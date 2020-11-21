import React, { Component } from "react";
import Question1Component from "../components/Question1Component";
import Question2Component from "../components/Question2Component";
import Question3Component from "../components/Question3Component";
import Question4Component from "../components/Question4Component";
import Results from "../components/Results";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import nodeServer from "../api/nodeServer";
// import postcodeServer from "../api/postcodeServer"
import GoogleServer from "../api/GoogleServer";
import { IoLogoFacebook } from "react-icons/io";

const INITIAL_STATE = {
  tags: [],
  selectedTypes: [],
  selectedPersonalisations: [],
  question1: [],
  charityResults: [],
  types: [],
  personalisations: [],
  charitiesFilteredByType: [],
  charitiesFilteredByPersonalisations: [],
  finalCharities: [],
  postcode: "",
  
};

export default class HomePageContainer extends Component {
  constructor(props) {
    super(props);
    this.state = { ...INITIAL_STATE };
    this.selectResults = this.selectResults.bind(this);
    this.getQuestion1 = this.getQuestion1.bind(this);
    this.getQuestion2 = this.getQuestion2.bind(this);
    this.getQuestion3 = this.getQuestion3.bind(this);
    this.filterByType = this.filterByType.bind(this);
    this.filterByPersonalisations = this.filterByPersonalisations.bind(this);
    this.sortCharities = this.sortCharities.bind(this);
    this.getUnique = this.getUnique.bind(this);
    this.getRating = this.getRating.bind(this);
    this.getNationalRating = this.getNationalRating.bind(this);
  }

  getQuestion1() {
    nodeServer.get("/needs").then((res) => {
      const question1Api = res.data;
      question1Api.sort((a, b) => a.Need.localeCompare(b.Need));
      this.setState({ question1: question1Api });
    });
  }

  getQuestion2() {
    nodeServer.get("/types").then((res) => {
      const typesApi = res.data;
      this.setState({ types: typesApi });
    });
  }
  getQuestion3() {
    nodeServer.get("/personalisations").then((res) => {
      const personalisationApi = res.data;
      this.setState({ personalisations: personalisationApi });
    });
  }

  getUnique(charities) {
     return Array.from(
      new Set(charities.map((charity) => charity.OrgName))
    ).map((OrgName)=> {
      return charities.find((charity) => charity.OrgName === OrgName)
    })

  };
  async getNationalRating(sortedCharities) {
    const finalCharities =[]

    await Promise.all(sortedCharities.map(charity => {
      if(charity.NationalService === 'YES')
      {
        if(charity.PlaceID !== ""){
          nodeServer.get(`/googleratings/${charity.PlaceID}`).then((res) => {
            const rating = res.data.rating
            charity.googleRating = rating
            finalCharities.push(charity)
            this.setState({ finalCharities: finalCharities})
          })
        }else {
          finalCharities.push(charity)
            this.setState({ finalCharities: finalCharities})
        }
      } 
   

      
 }))
  }

  async getRating(sortedCharities, postcode) {
    const finalCharities =[]
    await Promise.all(sortedCharities.map(charity => {
      const outerCode = this.state.postcode.slice(0, 4)
        if(charity.OuterCode.toLowerCase() === postcode.toLowerCase()){
          console.log(charity.PlaceID);
          if(charity.PlaceID){
            nodeServer.get(`/googleratings/${charity.PlaceID}`).then((res) => {
              const rating = res.data.rating
              console.log('rating', rating);
              charity.googleRating = rating
              finalCharities.push(charity)
              this.setState({ finalCharities: finalCharities})
            })
          } else {
            console.log('fired');
            this.setState({ finalCharities: finalCharities})
          }

        }
 }))
  };

  sortCharities(postcode) {
    const fullCharities = this.state.charitiesFilteredByPersonalisations.concat(this.state.charitiesFilteredByType, this.state.charityResults)

    if(postcode.postcode === "") {
      let nationalCharities = []
      fullCharities.map((charity) => {
        if(charity.NationalService === "YES")
        nationalCharities.push(charity)
        console.log(charity);
      })
      let uniqueCharities = this.getUnique(nationalCharities)
      this.setState({ finalCharities: uniqueCharities})
    } else {
      let uniqueCharities = this.getUnique(fullCharities)
      this.setState({ finalCharities: uniqueCharities})
    }

  }
  // async postcodeSearch(APICall) {
  //    await postcodeServer.get(`${APICall}`).then((res => {
  //     (let localPostcodes = res.data)
  //   }))};

  sortCharities(postcode) {
    this.setState({ postcode: postcode.postcode })

    const fullCharities = this.state.charitiesFilteredByPersonalisations.concat(this.state.charitiesFilteredByType, this.state.charityResults)
    let uniqueCharities = this.getUnique(fullCharities)
    if(postcode.postcode === "") {
     console.log(uniqueCharities);
        this.getNationalRating(uniqueCharities)
   
    } else {
      this.getRating(uniqueCharities, postcode.postcode.slice(0, 4))

      }
      }
      




  selectResults(tags) {
    this.setState({ tags})
    if (tags === 0) {
      nodeServer
        .get("/charities")
        .then((res) => {
          const charities = res.data;
 
          // returns unique charities
          // const uniqueCharities = this.getUnique(charities)
         
          // sorts charities alphabetically 
          charities.sort((a, b) => a.OrgName.localeCompare(b.OrgName));
          this.setState({ charityResults: charities });
        })
        .catch((error) => {
          console.log(error);
        });
    } else {
      let results = "";
      tags.map((tag) => {
        let apiTag = `${tag}£`;
        let resultsTemp = results.concat(apiTag);
        results = resultsTemp;
      });
      nodeServer
        .get(`/charities?tags=${results}`)
        .then((res) => {
          const charities = res.data;
          // sorts charities alphabetically 
          charities.sort((a, b) => a.OrgName.localeCompare(b.OrgName));
          this.setState({ charityResults: charities });
        })
        .catch((error) => {
          console.log(error);
        });
    }
    this.getQuestion2();
  }

  filterByType(types) {
    if (types.length === 0) {
      this.setState({ charitiesFilteredByType: this.state.charityResults });
      this.getQuestion3();
    } else {
      this.setState({ selectedTypes: types})
      let filteredCharities = [];
      const charities = this.state.charityResults;
      types.map((type) => {
        charities.map((charity) => {
          if (charity.UserOption_Type === type) {
            filteredCharities.push(charity);
          }
        });
      });
      filteredCharities.sort((a, b) => a.OrgName.localeCompare(b.OrgName));
      this.setState({ charitiesFilteredByType: filteredCharities });
      this.getQuestion3();
    }
  }

  filterByPersonalisations(selected) {
    if (selected.length === 0) {
      this.setState({ charitiesFilteredByPersonalisations: this.state.charitiesFilteredByType });
    } else {
      this.setState({ selectedPersonalisations: selected})
      let filteredCharities = [];
      const charities = this.state.charitiesFilteredByType;
      selected.map((personalisation) => {
        charities.map((charity) => {
          if (charity.Personalisation === personalisation) {
            filteredCharities.push(charity);
          }
        });
      });
      filteredCharities.sort((a, b) => a.OrgName.localeCompare(b.OrgName));
      this.setState({ charitiesFilteredByPersonalisations: filteredCharities });
      // this.sortCharities()
    }
  }

  componentDidMount() {
    this.getQuestion1();
  }

  render() {
    return (
      <Router>
        <React.Fragment>
          <Route exact path="/">
            <Question1Component
              questions={this.state.question1}
              addTag={this.addTag}
              needs={this.state.tags}
              selectResults={this.selectResults}
            />
          </Route>
          <Route exact path="/service-types">
            <Question2Component
              results={this.state.charityResults}
              questions={this.state.types}
              filterByType={this.filterByType}
              selectedTypes={this.state.selectedTypes}
            />
          </Route>
          <Route exact path="/personalise">
            <Question3Component
              results={this.state.charityResults}
              questions={this.state.personalisations}
              filterByPersonalisations={this.filterByPersonalisations}
              selectedPersonalisations={this.state.selectedPersonalisations}
            />
          </Route>
          <Route exact path="/postcode">
            <Question4Component
              sortCharities={this.sortCharities}
            />
          </Route>
          <Route exact path="/results">
            <Results results={this.state.finalCharities} />
          </Route>

        </React.Fragment>
      </Router>
    );
  }
}

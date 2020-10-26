import React, { Component } from "react";
import Question1Component from "../components/Question1Component";
import Question2Component from "../components/Question2Component";
import Question3Component from "../components/Question3Component";
import Question4Component from "../components/Question4Component";
import Results from "../components/Results";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import nodeServer from "../api/nodeServer";

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

  sortCharities(postcode) {
    console.log('postcode', postcode.postcode);
    const fullCharities = this.state.charitiesFilteredByPersonalisations.concat(this.state.charitiesFilteredByType, this.state.charityResults)
    let uniqueCharities = this.getUnique(fullCharities)
    this.setState({ finalCharities: uniqueCharities})
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
      console.log(results);
      nodeServer
        .get(`/charities?tags=${results}`)
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
      this.setState({ charitiesFilteredByType: filteredCharities });
      this.getQuestion3();
    }
  }

  filterByPersonalisations(selected) {
    if (selected.length === 0) {
      this.setState({ charitiesFilteredByPersonalisations: this.state.charitiesFilteredByType });
      console.log('none', this.state.filteredCharities); 
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
      this.setState({ charitiesFilteredByPersonalisations: filteredCharities });
      console.log('some', filteredCharities);
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

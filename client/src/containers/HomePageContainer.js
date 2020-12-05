import React, { useEffect, useState } from "react";
import Question1Component from "../components/Question1Component";
import Question2Component from "../components/Question2Component";
import Question3Component from "../components/Question3Component";
import Question4Component from "../components/Question4Component";
import Results from "../components/Results";
import {
  BrowserRouter as Router,
  Route,
  Link,
  useHistory,
} from "react-router-dom";
import nodeServer from "../api/nodeServer";
// import postcodeServer from "../api/postcodeServer"
import GoogleServer from "../api/GoogleServer";
import { IoLogoFacebook } from "react-icons/io";
import Question from "../components/Question";

const INITIAL_STATE = {
  tags: [],
  needs: [],
  selectedTypes: [],
  selectedPersonalisations: [],
  charityResults: [],
  types: [],
  personalisations: [],
  charitiesFilteredByType: [],
  charitiesFilteredByPersonalisations: [],
  finalCharities: [],
  postcode: "",
};

const HomePageContainer = () => {
  const [needs, setNeeds] = useState([]);

  useEffect(() => {
    getNeeds();
  }, []);

  const history = useHistory();

  // constructor(props) {
  //   super(props);
  //   this.state = { ...INITIAL_STATE };
  //   this.selectResults = this.selectResults.bind(this);
  //   this.getNeeds = this.getNeeds.bind(this);
  //   this.getQuestion2 = this.getQuestion2.bind(this);
  //   this.getQuestion3 = this.getQuestion3.bind(this);
  //   this.filterByType = this.filterByType.bind(this);
  //   this.filterByPersonalisations = this.filterByPersonalisations.bind(this);
  //   this.sortCharities = this.sortCharities.bind(this);
  //   this.getUnique = this.getUnique.bind(this);
  //   this.getRating = this.getRating.bind(this);
  //   // this.getNationalRating = this.getNationalRating.bind(this);
  //   this.nationalCharities = this.nationalCharities.bind(this);
  //   this.localCharities = this.localCharities.bind(this);
  // }

  // QUESTION - 1: Needs

  const getNeeds = () => {
    nodeServer.get("/needs").then((res) => {
      const needsResponse = res.data;
      needsResponse.sort((a, b) => a.Need.localeCompare(b.Need));
      const needs = needsResponse.map((need) => need.Need);
      setNeeds(needs);
    });
  };

  const handleNeedsCompleted = (selectedOptions) => {
    // history.push("/service-types");
    console.log(selectedOptions);
  };

  // QUESTION - 2:

  // const getQuestion2 = () => {
  //   nodeServer.get("/types").then((res) => {
  //     const typesApi = res.data;
  //     this.setState({ types: typesApi });
  //   });
  // };

  // const getQuestion3 = () => {
  //   nodeServer.get("/personalisations").then((res) => {
  //     const personalisationApi = res.data;
  //     this.setState({ personalisations: personalisationApi });
  //   });
  // };

  // const getUnique = (charities) => {
  //   return Array.from(new Set(charities.map((charity) => charity.OrgName))).map(
  //     (OrgName) => {
  //       return charities.find((charity) => charity.OrgName === OrgName);
  //     }
  //   );
  // };

  //   async getNationalRating(sortedCharities) {
  //     const finalCharities =[]

  //     await Promise.all(sortedCharities.map(charity => {
  //       if(charity.NationalService === 'YES')
  //       {
  //         if(charity.PlaceID !== ""){
  //           nodeServer.get(`/googleratings/${charity.PlaceID}`).then((res) => {
  //             const rating = res.data.rating
  //             charity.googleRating = rating
  //             finalCharities.push(charity)
  //             this.setState({ finalCharities: finalCharities})
  //           })
  //         }else {
  //           finalCharities.push(charity)
  //             this.setState({ finalCharities: finalCharities})
  //         }
  //       }

  //  }))
  //   }

  // const getRating = async (charities) => {
  //   const finalCharities = [];
  //   await Promise.all(
  //     charities.map((charity) => {
  //       // console.log(charity.PlaceID);
  //       if (charity.PlaceID) {
  //         nodeServer.get(`/googleratings/${charity.PlaceID}`).then((res) => {
  //           const rating = res.data.rating;
  //           // console.log('rating', rating);
  //           charity.googleRating = rating;
  //           finalCharities.push(charity);
  //           this.setState({ finalCharities: finalCharities });
  //         });
  //       } else {
  //         // console.log('fired');
  //         this.setState({ finalCharities: finalCharities });
  //       }
  //     })
  //   );
  // };

  // }
  // async postcodeSearch(APICall) {
  //    await postcodeServer.get(`${APICall}`).then((res => {
  //     (let localPostcodes = res.data)
  //   }))};

  //TODO

  // const nationalCharities = (charities) => {
  //   const national = [];
  //   charities.map((charity) => {
  //     if (charity.NationalService === "YES") {
  //       national.push(charity);
  //     }
  //   });

  //   return national;
  // };

  // const localCharities = (charities, postcode) => {
  //   return charities.map((charity) => {
  //     if (charity.OuterCode.toLowerCase() === postcode.toLowerCase())
  //       return charity;
  //   });
  // };

  // const sortCharities = (postcode) => {
  //   this.setState({ postcode: postcode.postcode });

  //   const fullCharities = this.state.charitiesFilteredByPersonalisations.concat(
  //     this.state.charitiesFilteredByType,
  //     this.state.charityResults
  //   );

  //   if (postcode.postcode === "") {
  //     let nationalCharities = this.nationalCharities(fullCharities);
  //     let uniqueCharities = this.getUnique(nationalCharities);
  //     this.setState({ finalCharities: uniqueCharities });
  //     // this.getRating(uniqueCharities)
  //   } else {
  //     let localCharities = localCharities(
  //       uniqueCharities,
  //       postcode.postcode.slice(0, 4)
  //     );
  //     let uniqueCharities = this.getUnique(localCharities);
  //     this.setState({ finalCharities: uniqueCharities });
  //     // this.getRating(uniqueCharities)
  //   }
  // };

  // const selectResults = (tags) => {
  //   this.setState({ tags });
  //   if (tags === 0) {
  //     nodeServer
  //       .get("/charities")
  //       .then((res) => {
  //         const charities = res.data;

  //         // returns unique charities
  //         // const uniqueCharities = this.getUnique(charities)

  //         // sorts charities alphabetically
  //         charities.sort((a, b) => a.OrgName.localeCompare(b.OrgName));
  //         this.setState({ charityResults: charities });
  //       })
  //       .catch((error) => {
  //         console.log(error);
  //       });
  //   } else {
  //     let results = "";
  //     tags.map((tag) => {
  //       let apiTag = `${tag}£`;
  //       let resultsTemp = results.concat(apiTag);
  //       results = resultsTemp;
  //     });
  //     nodeServer
  //       .get(`/charities?tags=${results}`)
  //       .then((res) => {
  //         const charities = res.data;
  //         // sorts charities alphabetically
  //         charities.sort((a, b) => a.OrgName.localeCompare(b.OrgName));
  //         this.setState({ charityResults: charities });
  //       })
  //       .catch((error) => {
  //         console.log(error);
  //       });
  //   }

  //   this.getQuestion2();
  // };

  // const filterByType = (types) => {
  //   if (types.length === 0) {
  //     this.setState({ charitiesFilteredByType: this.state.charityResults });
  //     this.getQuestion3();
  //   } else {
  //     this.setState({ selectedTypes: types });
  //     let filteredCharities = [];
  //     const charities = this.state.charityResults;
  //     types.map((type) => {
  //       charities.map((charity) => {
  //         if (charity.UserOption_Type === type) {
  //           filteredCharities.push(charity);
  //         }
  //       });
  //     });
  //     filteredCharities.sort((a, b) => a.OrgName.localeCompare(b.OrgName));
  //     this.setState({ charitiesFilteredByType: filteredCharities });
  //     this.getQuestion3();
  //   }
  // };

  // const filterByPersonalisations = (selected) => {
  //   if (selected.length === 0) {
  //     this.setState({
  //       charitiesFilteredByPersonalisations: this.state.charitiesFilteredByType,
  //     });
  //   } else {
  //     this.setState({ selectedPersonalisations: selected });
  //     let filteredCharities = [];
  //     const charities = this.state.charitiesFilteredByType;
  //     selected.map((personalisation) => {
  //       charities.map((charity) => {
  //         if (charity.Personalisation === personalisation) {
  //           filteredCharities.push(charity);
  //         }
  //       });
  //     });
  //     filteredCharities.sort((a, b) => a.OrgName.localeCompare(b.OrgName));
  //     this.setState({ charitiesFilteredByPersonalisations: filteredCharities });
  //   }
  // };

  return (
    <Router>
      <React.Fragment>
        <Route exact path="/">
          <Question
            optionsList={needs}
            onComplete={handleNeedsCompleted}
            questionTitle="What can we help you with?"
          />
          {/* <Question1Component
              questions={this.state.needs}
              selectResults={this.selectResults}
            /> */}
        </Route>
        {/* <Route exact path="/service-types">
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
          <Question4Component sortCharities={this.sortCharities} />
        </Route>
        <Route exact path="/results">
          <Results results={this.state.finalCharities} />
        </Route> */}
      </React.Fragment>
    </Router>
  );
};

export default HomePageContainer;

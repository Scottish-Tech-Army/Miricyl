import React, { Component } from "react";
import Question1Component from "../components/Question1Component";
import Question2Component from "../components/Question2Component";
import Question3Component from "../components/Question3Component";
import Results from "../components/Results";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import nodeServer from "../api/nodeServer";

const INITIAL_STATE = {
  tags: [],
  selectedTypes: [],
  selectedPersonalisation: [],
  question1: [],
  charityResults: [],
  types: [],
  personalisation: [],
  charitiesFilteredByType: [],
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
    nodeServer.get("/personalisation").then((res) => {
      const personalisation = res.data;
      this.setState({ personalisation: personalisation });
    });
  }

  getUnique(charities) {
     return Array.from(
      new Set(charities.map((charity) => charity.OrgName))
    ).map((OrgName)=> {
      return charities.find((charity) => charity.OrgName === OrgName)
    })
  }


  selectResults(tags) {
    this.setState({ tags})
    if (tags === 0) {
      nodeServer
        .get("/charities")
        .then((res) => {
          const charities = res.data;
 
          // returns unique charities
          const uniqueCharities = this.getUnique(charities)
         
          // sorts charities alphabetically 
          uniqueCharities.sort((a, b) => a.OrgName.localeCompare(b.OrgName));
          this.setState({ charityResults: uniqueCharities });
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
          const uniqueCharities = this.getUnique(charities)
          // sorts charities alphabetically 
          uniqueCharities.sort((a, b) => a.OrgName.localeCompare(b.OrgName));
          this.setState({ charityResults: uniqueCharities });
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
      this.getQuestion3()
    } else {
      this.setState({ selectedTypes: types})
      let filteredCharities = [];
      const charities = this.state.charityResults;
      types.map((type) => {
        charities.map((charity) => {
          if (charity.TypeOfSupport === type) {
            filteredCharities.push(charity);
          }
        });
      });
      this.setState({ charitiesFilteredByType: filteredCharities });
      this.getQuestion3()
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
          <Route exact path="/personalisation">
            <Question3Component questions={this.state.personalisation} />
          </Route>
          <Route exact path="/results">
            <Results results={this.state.charitiesFilteredByType} selectedPersonalisation={this.state.selectedPersonalisation}/>
          </Route>

        </React.Fragment>
      </Router>
    );
  }
}

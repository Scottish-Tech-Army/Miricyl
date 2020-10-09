import React, { Component } from "react";
import Question1Component from "../components/Question1Component";
import Question2Component from "../components/Question2Component";
import Results from "../components/Results";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import nodeServer from "../api/nodeServer";

const INITIAL_STATE = {
  tags: [],
  question1: [
    { NeedsID: 1, title: "Alcohol", NeedsDesc: "Alcohol" },
    { NeedsID: 2, title: "Pregnancy and Parenting", NeedsDesc: "Parenting" },
  ],
  // charities: [
  //   { id: 1, name: "Turning Point Scotland", tags: "addiction" },
  //   { id: 2, name: "Pregnancy Counselling & Care", tags: "parenting" },
  //   { id: 3, name: "Mind", tags: "addiction" },
  //   { id: 4, name: "Stepping Stones", tags: "parenting" },
  // ],
  charityResults: [],
  types: [],
  charitiesFilteredByType: [],
};

export default class HomePageContainer extends Component {
  constructor(props) {
    super(props);
    this.state = { ...INITIAL_STATE };
    this.selectResults = this.selectResults.bind(this);
    this.getQuestion1 = this.getQuestion1.bind(this);
    this.getQuestion2 = this.getQuestion2.bind(this);
    this.filterByType = this.filterByType.bind(this);
  }

  getQuestion1() {
    nodeServer.get("/needs").then((res) => {
      const question1Api = res.data;
      this.setState({ question1: question1Api });
    });
  }

  getQuestion2() {
    nodeServer.get("/types").then((res) => {
      const typesApi = res.data;
      this.setState({ types: typesApi });
    });
  }

  selectResults(tags) {
    if (tags === 0) {
      nodeServer
        .get("/charities")
        .then((res) => {
          const charities = res.data;
          this.setState({ charityResults: charities });
        })
        .catch((error) => {
          console.log(error);
        });
    } else {
      let results = "";
      tags.map((tag) => {
        let apiTag = `${tag},`;
        let resultsTemp = results.concat(apiTag);
        results = resultsTemp;
      });
      nodeServer
        .get(`/charities?tags=${results}`)
        .then((res) => {
          const charities = res.data;
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
    } else {
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
    }
  }

  componentDidMount() {
    // this.getQuestion1();
  }

  render() {
    return (
      <Router>
        <React.Fragment>
          <Route exact path="/">
            <Question1Component
              questions={this.state.question1}
              addTag={this.addTag}
              selectResults={this.selectResults}
            />
          </Route>
          <Route exact path="/service-types">
            <Question2Component
              results={this.state.charityResults}
              questions={this.state.types}
              filterByType={this.filterByType}
            />
          </Route>
          <Route exact path="/results">
            <Results results={this.state.charitiesFilteredByType} />
          </Route>
        </React.Fragment>
      </Router>
    );
  }
}

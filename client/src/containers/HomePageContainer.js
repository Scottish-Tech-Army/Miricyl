import React, { Component } from "react";
import Question1Component from "../components/Question1Component";
import Results from "../components/Results";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import nodeServer from "../api/nodeServer";

const INITIAL_STATE = {
  tags: [],
  question1: [
    // { id: 1, title: "Addiction", tags: "addiction" },
    // { id: 2, title: "Pregnancy and Parenting", tags: "parenting" },
  ],
  // charities: [
  //   { id: 1, name: "Turning Point Scotland", tags: "addiction" },
  //   { id: 2, name: "Pregnancy Counselling & Care", tags: "parenting" },
  //   { id: 3, name: "Mind", tags: "addiction" },
  //   { id: 4, name: "Stepping Stones", tags: "parenting" },
  // ],
  charityResults: [],
};

export default class HomePageContainer extends Component {
  constructor(props) {
    super(props);
    this.state = { ...INITIAL_STATE };
    this.addTag = this.addTag.bind(this);
    this.selectResults = this.selectResults.bind(this);
    this.getQuestion1 = this.getQuestion1.bind(this);
  }

  addTag(tag) {
    if (tag) {
      const newTags = this.state.tags;
      newTags.push(tag);
      this.setState({ tags: newTags });
    }
  }

  selectResults() {
    if (this.state.tags.length === 0) {
      nodeServer
        .get("http://localhost:3000/api/charities")
        .then((res) => {
          const charities = res.data;
          this.setState({ charityResults: charities });
        })
        .catch((error) => {
          console.log(error);
        });
    } else {
      let results = "";
      this.state.tags.map((tags) => {
        let apiTag = `${tags},`;
        let resultsTemp = results.concat(apiTag);
        results = resultsTemp;
        console.log("results", results);
      });

      nodeServer
        .get(`http://localhost:3000/api/charities?tags=${results}`)
        .then((res) => {
          const charities = res.data;
          this.setState({ charityResults: charities });
        })
        .catch((error) => {
          console.log(error);
        });
    }
  }

  getQuestion1() {
    nodeServer.get("/tags").then((res) => {
      const question1Api = res.data;
      this.setState({ question1: question1Api });
    });
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
              selectResults={this.selectResults}
            />
          </Route>
          <Route exact path="/results">
            <Results results={this.state.charityResults} />
          </Route>
        </React.Fragment>
      </Router>
    );
  }
}

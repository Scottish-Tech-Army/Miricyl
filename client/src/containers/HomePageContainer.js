import React, { Component } from "react";
import Question1Component from "../components/Question1Component";
import Results from "../components/Results";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";

const INITIAL_STATE = {
  tags: [],
  question1: [
    { id: 1, title: "Addiction", tags: "addiction" },
    { id: 2, title: "Pregnancy and Parenting", tags: "parenting" },
  ],
  charities: [
    { id: 1, name: "Turning Point Scotland", tags: "addiction" },
    { id: 2, name: "Pregnancy Counselling & Care", tags: "parenting" },
    { id: 3, name: "Mind", tags: "addiction" },
    { id: 4, name: "Stepping Stones", tags: "parenting" },
  ],
  charityResults: [],
};

export default class HomePageContainer extends Component {
  constructor(props) {
    super(props);
    this.state = { ...INITIAL_STATE };
    this.addTag = this.addTag.bind(this);
    this.selectResults = this.selectResults.bind(this);
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
      this.setState({ charityResults: this.state.charities });
    } else {
      const results = [];
      this.state.tags.map((tags) => {
        this.state.charities.map((charity) => {
          if (charity.tags === tags) {
            results.push(charity);
          }
        });
      });
      this.setState({ charityResults: results });
    }
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

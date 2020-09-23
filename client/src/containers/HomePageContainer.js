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
};

export default class HomePageContainer extends Component {
  constructor(props) {
    super(props);
    this.state = { ...INITIAL_STATE };
    this.addTag = this.addTag.bind(this);
  }

  addTag(tag) {
    const newTags = this.state.tags;
    newTags.push(tag);
    this.setState({ tags: newTags });
  }

  render() {
    return (
      <Router>
        <React.Fragment>
          <Route exact path="/">
            <Question1Component
              questions={this.state.question1}
              addTag={this.addTag}
            />
          </Route>
          <Route exact path="/results">
            <Results />
          </Route>
        </React.Fragment>
      </Router>
    );
  }
}

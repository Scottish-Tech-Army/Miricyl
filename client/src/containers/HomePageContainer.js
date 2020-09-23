import React, { Component } from "react";
import Question1Component from "../components/Question1Component";

const INITIAL_STATE = {
  tags: [],
  question1: [
    { id: 1, title: "Addiction", tags: ["addiction"] },
    { id: 2, title: "Pregnancy and Parenting", tags: ["parenting"] },
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
      <div>
        <h1>How can we help you?</h1>
        <p>Search for personalised resources and services that can help you</p>
        <Question1Component
          questions={this.state.question1}
          addTag={this.addTag}
        />
      </div>
    );
  }
}

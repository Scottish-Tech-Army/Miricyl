import React from "react";
import { withRouter } from "react-router-dom";

const Question1Component = (props) => {
  const handleSubmit = (e) => {
    e.preventDefault();
    props.addTag(e.target.q1.value);
    props.history.push("/results");
    props.selectResults();
  };

  const questions = props.questions.map((question) => (
    <option key={question.id} value={question.tags}>
      {question.title}
    </option>
  ));

  return (
    <div>
      <h1>How can we help you?</h1>
      <p>Search for personalised resources and services that can help you</p>
      <form onSubmit={handleSubmit}>
        <select name="q1">
          <option key="0" value="" defaultValue>
            I'm looking for help with...
          </option>
          {questions}
        </select>
        <input type="submit" value="Next" />
      </form>
    </div>
  );
};

export default withRouter(Question1Component);

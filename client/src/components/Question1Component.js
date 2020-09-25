import React from "react";
import { withRouter } from "react-router-dom";
import "../styles/global.css";

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
    <div className="question-title">
      <h1>
        Search mental health resources & services that can help you feel better
      </h1>
      <p>What can we help you with?</p>

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

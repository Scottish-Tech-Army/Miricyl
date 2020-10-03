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
    <option key={question.NeedsID} value={question.NeedsDesc}>
      {question.NeedsDesc}
    </option>
  ));

  return (
    <div className="question-one-container">
      <h1 className="question-title">
        Search mental health resources & services that can help you feel better
      </h1>

      <div className="select-container">
        <p className="question-one-text">What can we help you with?</p>
        <p className="question-one-subtext">select all that apply</p>

        <form onSubmit={handleSubmit}>
          <select name="q1">
            <option key="0" value="" defaultValue>
              I'm looking for help with...
            </option>
            {questions}
          </select>
          <br />

          <input type="submit" value="Next" />
        </form>
      </div>
    </div>
  );
};

export default withRouter(Question1Component);

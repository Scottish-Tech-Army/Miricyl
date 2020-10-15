import React from "react";
import { withRouter } from "react-router-dom";
import "../styles/global.css";


const Question1Component = ({ questions, selectResults, history }) => {
  const tags = [];
  const handleSubmit = (e) => {
    e.preventDefault();
    history.push("/service-types");
    selectResults(tags);
  };

  const handleChange = (e) => {
    if (e.target.classList == "question-button") {
      tags.push(e.target.value);
      e.target.classList = "question-button-selected";
    } else {
      tags.splice(tags.indexOf(e.target.value), 1);
      e.target.classList = "question-button";
    }
  };

  const questionsList = questions.map((question) => (
    <button
      onClick={handleChange}
      className="question-button"
      value={question.Need}
      key={question.Need}
    >
      {question.Need}
    </button>
  ));

  return (
    <div className="question-one-container">
      <h1 className="question-title">
        Search mental health resources & services that can help you feel better
      </h1>

      <div className="select-container">
        <p className="question-one-text">What can we help you with?</p>
        <p className="question-one-subtext">select all that apply</p>

        {questionsList}

        <br />

        <button className="next-button" onClick={handleSubmit}>
          Next
        </button>
      </div>
    </div>
  );
};

export default withRouter(Question1Component);

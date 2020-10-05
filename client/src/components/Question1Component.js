import React from "react";
import { withRouter } from "react-router-dom";
import "../styles/global.css";

const Question1Component = (props) => {
  const tags = [];
  const handleSubmit = (e) => {
    e.preventDefault();
    props.history.push("/results");
    props.selectResults(tags);
  };

  const handleChange = (e) => {
    if (e.target.classList == "question-button") {
      tags.push(e.target.value);
      e.target.classList = "question-button-selected";
      console.log("if fired");
    } else {
      tags.splice(tags.indexOf(e.target.value), 1);
      e.target.classList = "question-button";
      console.log("else fired");
    }
  };

  const questions = props.questions.map((question) => (
    <button
      onClick={handleChange}
      className="question-button"
      value={question.NeedsDesc}
    >
      {question.NeedsDesc}
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

        {/* <form onSubmit={handleSubmit}> */}
        {/* <h2>I'm looking for help with...</h2> */}

        {questions}

        <br />
        <button className="next-button" onClick={handleSubmit}>
          Next
        </button>
        {/* <input type="submit" value="Next" />
        </form> */}
      </div>
    </div>
  );
};

export default withRouter(Question1Component);

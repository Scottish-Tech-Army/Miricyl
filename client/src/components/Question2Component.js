import React from "react";
import { withRouter } from "react-router-dom";
import "../styles/global.css";

const Question2Component = (props) => {
  var types = [];
  const handleSubmit = (e) => {
    e.preventDefault();
    props.history.push("/results");
    props.filterByType(types);
  };

  const handleChange = (e) => {
    if (e.target.classList == "question-button") {
      types.push(e.target.value);
      e.target.classList = "question-button-selected";
    } else {
      types.splice(types.indexOf(e.target.value), 1);
      e.target.classList = "question-button";
    }
  };

  //   TODO: filter results based on the types selected

  const questions = props.questions.map((question) => (
    <button
      onClick={handleChange}
      className="question-button"
      value={question.Description}
      key={question.ServiceTypeID}
    >
      {question.Description}
    </button>
  ));
  return (
    <div className="question-two-container">
      <h1 className="question-title">
        Search mental health resources & services that can help you feel better
      </h1>
      <div className="select-container">
        <p className="question-one-text">
          What types of support are you looking for?
        </p>
        <p className="question-one-subtext">select all that apply</p>

        {questions}

        <br />
        <button className="next-button" onClick={handleSubmit}>
          Next
        </button>
      </div>
    </div>
  );
};

export default withRouter(Question2Component);

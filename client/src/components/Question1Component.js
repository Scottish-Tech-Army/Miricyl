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
    if (e.target.checked) {
      tags.push(e.target.value);
    }
    if (!e.target.checked) {
      tags.splice(tags.indexOf(e.target.value), 1);
    }
  };

  // const setColor = (e) => {
  //   const target = e.target,
  //     status = e.target.classList.contains("active");
  //   e.target.classList.add(status ? "inactive" : "active");
  //   e.target.classList.remove(status ? "active" : "inactive");
  // };

  const questions = props.questions.map((question) => (
    <div className="question-button">
      <input
        type="checkbox"
        // type="button"
        key={question.NeedsID}
        value={question.NeedsDesc}
        id={question.NeedsDesc}
        onChange={handleChange}
        // onChange={setColor}
        // style={color:"white"}
        // <input
      />
      <label>{question.NeedsDesc}</label>
    </div>
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
          {/* <h2>I'm looking for help with...</h2> */}

          {questions}

          <br />

          <input type="submit" value="Next" />
        </form>
      </div>
    </div>
  );
};

export default withRouter(Question1Component);

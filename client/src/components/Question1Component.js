import React from "react";
import { withRouter } from "react-router-dom";
import "../styles/global.css";




const Question1Component = ({ questions, needs, selectResults, history }) => {
  const tags = [];
  const handleSubmit = (e) => {
    e.preventDefault();
    history.push("/service-types");
    selectResults(tags);
  };

  const QuestionsList = () => {

    const handleChange = (e) => {
      if (e.target.className === "question-button") {
        tags.push(e.target.value);
        e.target.className = "question-button-selected";
      } else {
        tags.splice(tags.indexOf(e.target.value), 1);
        e.target.className = "question-button";
      }
    };
  
  
  return questions.map((question) => {
    var isSelected = false
    needs.map((need) => {
      if(need === question.Need) {
        isSelected = true
      }})
          if(isSelected === true){
            tags.push(question.Need)
        return (
          <button
          onClick={handleChange}
          className="question-button-selected"
          value={question.Need}
          key={question.Need}
        >
          {question.Need}
        </button>
        )
      } else {
        return (
          <button
          onClick={handleChange}
          className="question-button"
          value={question.Need}
          key={question.Need}
        >
          {question.Need}
        </button>
        )
      }
    
  })
  }

  return (
    <div className="question-one-container">
      <div className="grid-container">
        <div className="title-description-container">
        <h1 className="question-title">
          Search mental health resources & services that can help you feel better
        </h1>
        <h2 className="question-page-detail-text">
        Boost is here for you if you need trusted guidance on accessing resources and services that can positively impact your mental health.  We will guide you in finding the treatment and help you need.
        </h2>
        </div>

        <div>
          <div className="select-container">
            <p className="question-text">What can we help you with?</p>
            <p className="question-subtext">select all that apply</p>

            <QuestionsList />

            <br />
            </div>
            <button className="next-button" onClick={handleSubmit}>
              Next
            </button>
          </div>
      </div>
    </div>
  );
};




export default withRouter(Question1Component);

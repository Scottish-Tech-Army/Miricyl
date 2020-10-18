import React from "react";
import { withRouter } from "react-router-dom";
import "../styles/global.css";
import { IoIosArrowDropleft } from "react-icons/io";

const Question2Component = ({ questions, history, filterByType, selectedTypes}) => {
  var types = [];
  const handleSubmit = (e) => {
    e.preventDefault();
    history.push("/results");
    filterByType(types);
  };

 


  //   TODO: filter results based on the types selected

  const QuestionsList = () => {

// handle change
    const handleChange = (e) => {
      if (e.target.classList == "question-button") {
        types.push(e.target.value);
        e.target.classList = "question-button-selected";
      } else {
        types.splice(types.indexOf(e.target.value), 1);
        e.target.classList = "question-button";
      }
    };
  
  return questions.map((question) => {
    var isSelected = false
    selectedTypes.map((type) => {
      if(type === question.Description) {
        isSelected = true
      }
    })
          if(isSelected === true){
            types.push(question.Description)
        return (
          <button
          onClick={handleChange}
          className="question-button-selected"
          value={question.Description}
          key={question.Description}
        >
          {question.Description}
        </button>
        )
      } else {
        return (
          <button
          onClick={handleChange}
          className="question-button"
          value={question.Description}
          key={question.Description}
        >
          {question.Description}
        </button>
        )
      }
    
  })
  }

  // const questionsList = questions.map((question) => (
  //   <button
  //     onClick={handleChange}
  //     className="question-button"
  //     value={question.Description}
  //     key={question.ServiceTypeID}
  //   >
  //     {question.Description}
  //   </button>
  // ));
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

        <QuestionsList />

        <br />
        <div className="bottom-navigation">
          <IoIosArrowDropleft className="back-button" onClick={() => {history.goBack()}} />
          <button className="next-button" onClick={handleSubmit}>
            Next
          </button>
        </div>
      </div>
    </div>
  );
};

export default withRouter(Question2Component);

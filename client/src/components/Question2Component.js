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

    function getUnique(charities) {
    return Array.from(
     new Set(charities.map((charity) => charity.UserOption_Type))
   ).map((UserOption_Type)=> {
     return charities.find((charity) => charity.UserOption_Type === UserOption_Type)
   })
  }



 let uniqueQuestions = getUnique(questions)
 console.log(uniqueQuestions);

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

  
  return uniqueQuestions.map((Question) => {
    var isSelected = false
    selectedTypes.map((type) => {
      if(type === Question.UserOption_Type) {
        isSelected = true
      }
    })
          if(isSelected === true){
            types.push(Question.UserOption_Type)
        return (
          <button
          onClick={handleChange}
          className="question-button-selected"
          value={Question.UserOption_Type}
          key={Question.UserOption_Type}
        >
          {Question.UserOption_Type}
        </button>
        )
      } else {
        return (
          <button
          onClick={handleChange}
          className="question-button"
          value={Question.UserOption_Type}
          key={Question.UserOption_Type}
        >
          {Question.UserOption_Type}
        </button>
        )
      }
    
  })
  }

  return (
    <div className="question-two-container">
      <h1 className="question-two-title">
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

}



export default withRouter(Question2Component);

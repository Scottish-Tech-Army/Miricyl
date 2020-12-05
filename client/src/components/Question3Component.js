import React from "react";
import { withRouter } from "react-router-dom";
import "../styles/global.css";
import { IoIosArrowDropleft } from "react-icons/io";

const Question3Component = ({
  questions,
  history,
  filterByPersonalisations,
  selectedPersonalisations,
}) => {
  var personalisations = [];
  const handleSubmit = (e) => {
    e.preventDefault();
    history.push("/postcode");
    filterByPersonalisations(personalisations);
  };

  const QuestionsList = () => {
    // handle change
    const handleChange = (e) => {
      if (e.target.classList == "question-button") {
        personalisations.push(e.target.value);
        e.target.classList = "question-button-selected";
      } else {
        personalisations.splice(personalisations.indexOf(e.target.value), 1);
        e.target.classList = "question-button";
      }
    };

    return questions.map((Question) => {
      var isSelected = false;
      if (Question.UserOption !== "") {
        selectedPersonalisations.map((type) => {
          if (type === Question.UserOption) {
            isSelected = true;
          }
        });
        if (isSelected === true) {
          personalisations.push(Question.UserOption);
          return (
            <button
              onClick={handleChange}
              className="question-button-selected"
              value={Question.UserOption}
              key={Question.UserOption}
            >
              {Question.UserOption}
            </button>
          );
        } else {
          return (
            <button
              onClick={handleChange}
              className="question-button"
              value={Question.UserOption}
              key={Question.UserOption}
            >
              {Question.UserOption}
            </button>
          );
        }
      }
    });
  };

  return (
    <div className="question-three-container">
      <div className="question-grid-container">
        <div className="title-description-container">
          <h1 className="question-title">
            Search mental health resources & services that can help you feel
            better
          </h1>
          <h2 className="question-page-detail-text">
            Boost is here for you if you need trusted guidance on accessing
            resources and services that can positively impact your mental
            health. We will guide you in finding the treatment and help you
            need.
          </h2>
        </div>

        <div>
          <div className="select-container">
            <p className="question-text">Personalise your results</p>
            <p className="question-subtext">select all that apply</p>

            <QuestionsList />

            <br />
          </div>
          <div className="bottom-navigation">
            <IoIosArrowDropleft
              className="back-button"
              onClick={() => {
                history.goBack();
              }}
            />
            <button className="next-button" onClick={handleSubmit}>
              Next
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default withRouter(Question3Component);

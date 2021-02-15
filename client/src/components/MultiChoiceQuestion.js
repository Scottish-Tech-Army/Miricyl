import React from "react";
import "../styles/global.css";
import { withRouter } from "react-router-dom";
import Header from "./Header";
import SubHeader from "./SubHeader";
import BackButton from "./BackButton";
import Footer from "./Footer";

const MultiChoiceQuestion = ({
  optionsList,
  onToggleItemSelected,
  onComplete,
  questionTitle,
  onBackClicked,
  backgroundToUse = "one",
}) => {
  const OptionsList = () => {
    return optionsList.map((option) => {
      return (
        <button
          onClick={() => onToggleItemSelected(option)}
          className={`question-button ${
            option.isSelected && "question-button-selected"
          }`}
          value={option.value}
          key={option.value}
          id={option.value.replace(/\s/g, "-")}
        >
          {option.value}
        </button>
      );
    });
  };

  return (
    <div className={`question-${backgroundToUse}-container question-container`}>
      <div className="question-grid-container">
        <div className="title-description-container">
          <Header />
          <SubHeader />
        </div>
        <div className="ui-container">
          <div className="select-container">
            <p className="question-text" id="question-title">
              {questionTitle}
            </p>
            <p className="question-subtext" id="question-subtitle">
              select all that apply
            </p>

            <OptionsList />

            <br />
          </div>
          <div className="bottom-navigation">
            {onBackClicked && <BackButton onBackClicked={onBackClicked} />}
            <button
              className="next-button"
              onClick={onComplete}
              id="next-button"
            >
              Next
            </button>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default withRouter(MultiChoiceQuestion);

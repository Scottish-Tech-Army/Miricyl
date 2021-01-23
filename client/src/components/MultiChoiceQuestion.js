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
          className={
            option.isSelected ? "question-button-selected" : "question-button"
          }
          value={option.value}
          key={option.value}
          id={option.value}
          test-id={option.value.replace(/\s/g, "-")}
        >
          {option.value}
        </button>
      );
    });
  };

  return (
    <div className={`question-${backgroundToUse}-container`}>
      <div className="question-grid-container">
        <div className="title-description-container">
          <Header />
          <SubHeader />
        </div>

        <div>
          <div className="select-container">
            <p className="question-text" test-id="question-title">
              {questionTitle}
            </p>
            <p className="question-subtext" test-id="question-subtitle">
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
              test-id="next-button"
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

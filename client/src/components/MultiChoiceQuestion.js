import React, { useState, useEffect } from "react";
import "../styles/global.css";
import { IoIosArrowDropleft } from "react-icons/io";
import { withRouter } from "react-router-dom";

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
            <p className="question-text">{questionTitle}</p>
            <p className="question-subtext">select all that apply</p>

            <OptionsList />

            <br />
          </div>
          <div className="bottom-navigation">
            {onBackClicked && (
              <IoIosArrowDropleft
                className="back-button"
                onClick={onBackClicked}
              />
            )}
            <button className="next-button" onClick={onComplete}>
              Next
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default withRouter(MultiChoiceQuestion);

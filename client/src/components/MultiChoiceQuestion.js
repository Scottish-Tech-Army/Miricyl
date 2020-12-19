import React, { useState, useEffect } from "react";
import "../styles/global.css";
import { IoIosArrowDropleft } from "react-icons/io";

const MultiChoiceQuestion = ({
  optionsList,
  onComplete,
  questionTitle,
  onBackClicked,
  selected,
  backgroundToUse = "one",
}) => {

  const [options, setOptions] = useState([]);

  const handleOptionClicked = (selectedOption) => {
    const indexOfSelectedOption = options.findIndex(
      (option) => option == selectedOption
    );

    const toggledOption = {
      ...selectedOption,
      isSelected: !selectedOption.isSelected,
    };

    const startOfArray = options.slice(0, indexOfSelectedOption);
    const endOfArray = options.slice(indexOfSelectedOption + 1);

    setOptions([...startOfArray, toggledOption, ...endOfArray]);
  };

  useEffect(() => {
    const optionsListForDisplay = optionsList.map((option) => {

      // check if selected
      var isSelected = false;
      selected.map((value) => {

        if (value === option) {
          isSelected = true;
        }
      });
      return { value: option, isSelected: isSelected };
    });
    setOptions(optionsListForDisplay);
  }, [optionsList]);

  const OptionsList = () => {
    console.log(options);
    return options.map((option) => {
      var isSelected = option.isSelected;
      return (
        <button
          onClick={() => handleOptionClicked(option)}
          className={
            isSelected ? "question-button-selected" : "question-button"
          }
          value={option.value}
          key={option.value}
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
            <button
              className="next-button"
              onClick={() =>
                onComplete(
                  options
                    .filter((option) => option.isSelected)
                    .map((option) => option.value)
                )
              }
            >
              Next
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default MultiChoiceQuestion;

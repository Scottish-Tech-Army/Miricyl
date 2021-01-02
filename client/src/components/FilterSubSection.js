import React from "react";

const FilterSubsection = ({ onToggleOption, filterOptions, heading }) => {
  return (
    <div className="filter-section-container">
      <span className="filter-section-subtitle">{heading}</span>
      <div className="filter-item-container">
        {filterOptions.map((option) => {
          return (
            <button
              onClick={() => onToggleOption(option)}
              className={
                option.isSelected
                  ? "question-button-selected"
                  : "question-button"
              }
              value={option.value}
              key={option.value}
              id={option.value}
            >
              {option.value}
            </button>
          );
        })}
      </div>
    </div>
  );
};

export default FilterSubsection;

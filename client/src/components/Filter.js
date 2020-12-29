import React from "react";

const Filter = ({
  needs,
  supportTypes,
  personalisations,
  onToggleNeedSelected,
  onToggleSupportTypeSelected,
  onTogglePersonalisationSelected,
}) => {
  return (
    <div>
      <div className="filters-container">
        <div className="filter-item-container">
          {needs.map((need) => {
            return (
              <button
                onClick={() => onToggleNeedSelected(need)}
                className={
                  need.isSelected
                    ? "question-button-selected"
                    : "question-button"
                }
                value={need.value}
                key={need.value}
                id={need.value}
              >
                {need.value}
              </button>
            );
          })}
        </div>
        <div className="filter-item-container">
          {supportTypes.map((supportType) => {
            return (
              <button
                onClick={() => onToggleSupportTypeSelected(supportType)}
                className={
                  supportType.isSelected
                    ? "question-button-selected"
                    : "question-button"
                }
                value={supportType.value}
                key={supportType.value}
                id={supportType.value}
              >
                {supportType.value}
              </button>
            );
          })}
        </div>
        <div className="filter-item-container">
          {personalisations.map((personalisation) => {
            return (
              <button
                onClick={() => onTogglePersonalisationSelected(personalisation)}
                className={
                  personalisation.isSelected
                    ? "question-button-selected"
                    : "question-button"
                }
                value={personalisation.value}
                key={personalisation.value}
                id={personalisation.value}
              >
                {personalisation.value}
              </button>
            );
          })}
        </div>
      </div>
    </div>
  );
};

export default Filter;

import React from "react";

const Filter = ({
  needs,
  onToggleNeedSelected,
  onToggleSupportTypeSelected,
  onTogglePersonalisationSelected,
}) => {
  return (
    <div>
      <div className="filter-needs-container">
        {needs.map((need) => {
          return (
            <button
              onClick={() => onToggleNeedSelected(need)}
              className={
                need.isSelected ? "question-button-selected" : "question-button"
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
    </div>
  );
};

export default Filter;

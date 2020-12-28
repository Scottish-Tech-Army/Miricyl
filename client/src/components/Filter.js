import React from "react";

const Filter = ({ needs, onSelectedNeedsChanged }) => {
  return (
    <div>
      <div className="filter-needs-container">
        {needs.map((need) => {
          return (
            <button
              onClick={() => onSelectedNeedsChanged(need)}
              className={
                need.isSelected ? "question-button-selected" : "question-button"
              }
              value={need.need}
              key={need.need}
              id={need.need}
            >
              {need.need}
            </button>
          );
        })}
      </div>
    </div>
  );
};

export default Filter;

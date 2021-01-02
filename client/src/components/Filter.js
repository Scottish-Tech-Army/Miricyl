import React, { useState } from "react";
import FilterSubsection from "./FilterSubSection";

const Filter = ({
  needs,
  supportTypes,
  personalisations,
  onToggleNeedSelected,
  onToggleSupportTypeSelected,
  onTogglePersonalisationSelected,
}) => {
  const [expandFilterPanel, setExpandFilterPanel] = useState(false);

  return (
    <div className="filter-panel">
      <div className="filter-header">
        <span>Search Results</span>
        <button
          onClick={() => {
            setExpandFilterPanel(!expandFilterPanel);
          }}
        >
          Icon
        </button>
      </div>
      {expandFilterPanel && (
        <div className="filters-container">
          <FilterSubsection
            filterOptions={needs}
            heading="What can we help you with?"
            onToggleOption={(option) => onToggleNeedSelected(option)}
          />
          <FilterSubsection
            filterOptions={supportTypes}
            heading="Types of service"
            onToggleOption={(option) => onToggleSupportTypeSelected(option)}
          />
          <FilterSubsection
            filterOptions={personalisations}
            heading="Personalisation"
            onToggleOption={(option) => onTogglePersonalisationSelected(option)}
          />
        </div>
      )}
    </div>
  );
};

export default Filter;

import React, { useState } from "react";

import { BsFilter } from "react-icons/bs";
import { MdClose } from "react-icons/md";

import * as styles from "./filter.module.scss";

const Filter = ({
  needs,
  supportTypes,
  personalisations,
  onToggleNeedSelected,
  onToggleSupportTypeSelected,
  onTogglePersonalisationSelected,
  onClearAllClicked,
}) => {
  const [expandFilterPanel, setExpandFilterPanel] = useState(false);

  return (
    <div className={styles.filterPanel}>
      <div className={styles.filterHeader}>
        <span>Search Results</span>
        <button
          className={styles.filterButton}
          onClick={() => {
            setExpandFilterPanel(!expandFilterPanel);
          }}
        >
          <BsFilter />
        </button>
      </div>
      {expandFilterPanel && (
        <div className={styles.filtersContainer}>
          <FilterSubsection
            filterOptions={needs}
            heading="What can we help you with?"
            onToggleOption={(option) => onToggleNeedSelected(option)}
            backgroundType={"need"}
          />
          <FilterSubsection
            filterOptions={supportTypes}
            heading="Types of service"
            onToggleOption={(option) => onToggleSupportTypeSelected(option)}
            backgroundType={"supportType"}
          />
          <FilterSubsection
            filterOptions={personalisations}
            heading="Personalisation"
            onToggleOption={(option) => onTogglePersonalisationSelected(option)}
            backgroundType={"personalisation"}
          />
          <button
            className={styles.clearAllButton}
            onClick={() => onClearAllClicked()}
          >
            <MdClose className={styles.closeIcon} /> Clear All
          </button>
        </div>
      )}
    </div>
  );
};

export default Filter;

const FilterSubsection = ({
  onToggleOption,
  filterOptions,
  heading,
  backgroundType,
}) => {
  let styleForOptionType;

  if (backgroundType === "need") {
    styleForOptionType = styles.need;
  } else if (backgroundType === "supportType") {
    styleForOptionType = styles.supportType;
  } else {
    styleForOptionType = styles.personalisation;
  }

  return (
    <div className={styles.filterSectionContainer}>
      <span className={styles.filterSectionSubtitle}>{heading}</span>
      <div className={styles.filterItemsContainer}>
        {filterOptions.map((option) => {
          return (
            <button
              onClick={() => onToggleOption(option)}
              className={`${styles.optionButton} ${
                option.isSelected &&
                `${styles.optionSelected} ${styleForOptionType}`
              }`}
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

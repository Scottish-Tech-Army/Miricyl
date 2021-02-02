import React from "react";
import { IoIosArrowDropleft } from "react-icons/io";

const BackButton = ({ onBackClicked }) => {
  return (
    <IoIosArrowDropleft
      id="back-button"
      className="back-button"
      onClick={() => onBackClicked()}
    />
  );
};

export default BackButton;

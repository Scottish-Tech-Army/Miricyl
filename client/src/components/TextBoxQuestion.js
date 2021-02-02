import React, { useState, useEffect } from "react";
import { withRouter } from "react-router-dom";
import { IoIosArrowDropleft } from "react-icons/io";
import "../styles/global.css";

const TextBoxQuestion = ({
  onComplete,
  onBackClicked,
  backgroundToUse = "one",
  postcode,
}) => {
  const [text, setText] = useState("");
  const checkPostcode = () => {
    if (postcode) {
      setText(`${postcode}`);
    }
  };

  useEffect(() => {
    checkPostcode();
  }, []);
  const handleChange = (e) => {
    setText(e.target.value);
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
          <div className="select-container-q4">
            <p className="question-text">
              Enter the first part of your postcode to find services and support
              in your area
            </p>

            <input
              className="postcode-select"
              type="text"
              value={text}
              onChange={handleChange}
              placeholder="Enter your postcode"
            ></input>

            <br />
          </div>

          <div className="bottom-navigation">
            {onBackClicked && (
              <IoIosArrowDropleft
                className="back-button"
                onClick={onBackClicked}
              />
            )}
            <button className="next-button" onClick={() => onComplete(text)}>
              Next
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default withRouter(TextBoxQuestion);

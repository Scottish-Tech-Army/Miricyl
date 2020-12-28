import React, { useState, useEffect } from "react";
import { withRouter } from "react-router-dom";
import "../styles/global.css";
import Header from "./Header";
import SubHeader from "./SubHeader";
import BackButton from "./BackButton";

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
          <Header />
          <SubHeader />
        </div>
        <div>
          <div className="select-container-q4">
            <p className="question-text" test-id="question-title">
              Enter the first part of your postcode to find services and support
              in your area
            </p>

            <input
              className="postcode-select"
              type="text"
              value={text}
              onChange={handleChange}
              placeholder="Enter your postcode"
              test-id="text-input-field"
            ></input>

            <br />
          </div>

          <div className="bottom-navigation">
            {onBackClicked && <BackButton onBackClicked={onBackClicked} />}
            <button
              className="next-button"
              onClick={() => onComplete(text)}
              test-id="next-button"
            >
              Next
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default withRouter(TextBoxQuestion);

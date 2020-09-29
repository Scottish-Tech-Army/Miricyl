import React from "react";
import "../styles/global.css";

const Results = (props) => {
  
  const showResults = props.results.map((result) => (
    <p className="results-list" key={result.id}>{result.name}</p>
  ));

  return (
    <div className="results-container">
      <h1 className="question-title">Search results</h1>
      <h4 className="results-list-name">
        {showResults}
      </h4>
    </div>
  );
};
export default Results;

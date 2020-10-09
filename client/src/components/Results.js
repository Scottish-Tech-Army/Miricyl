import React from "react";
import "../styles/global.css";

const Results = (props) => {

  const showResults = props.results.map((result) => (

    <div className="results-list-container" key={result.PlaceID}>
        <p className="results-list-title">
        <a href={result.ServiceURL}>{result.OrgName}</a>
        </p>
        <p className="results-list-service-description">{result.ServiceDescription}</p>
          <div>
          <button className="results-list-button" type="button">Call</button>
          <button className="results-list-button" type="button">Chat</button>
          <button className="results-list-button" type="button">Email</button>
          </div>
        <p className="results-list-address-title">Phone Support:</p>
        <p className="results-list-address-detail">{result.OpeningTime}</p>
        <p className="results-list-address-title">Address:</p>
        <p className="results-list-address-detail">{result.PhysicalAddress}</p>
        <p className="results-list-address-title">About</p>
        <p className="results-list-address-detail">{result.OrgDescription}</p>
      
    </div>
  ));

  return (
    <div className="results-container">
      <h1 className="question-title">Search results</h1>
      {showResults}
    </div>
  );
};
export default Results;

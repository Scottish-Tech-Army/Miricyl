import React from "react";
import "../styles/global.css";

const Results = (props) => {

  const showResults = props.results.map((result) => (

    <div className="results-list-container" key={result.PlaceID}>
        <div className="results-title-container">
          <img className="results-list-logo" src={result.Logo}/>
          <div className="results-list-title-service">
          
          
          {result.ServiceURL ? <p className="results-list-title"> <a href={result.ServiceURL}>{result.OrgName}</a></p> : 
          <p className="results-list-title">{result.OrgName}</p>}
          {/* </p> */}
          
          <p className="results-list-service-description">{result.ServiceDescription}</p>
          </div>
        </div>
          <div>
          
          <button className="results-list-button" type="button">Call</button>
          <button className="results-list-button" type="button">Chat</button>
          
          {result.EmailAddress ? 
          <button className="results-list-button" type="button">
            <a class="mailto" href={"mailto:" + result.EmailAddress}>Email</a>
          </button> : null}
          
          
          </div>
        <p className="results-list-sub-title">Phone Support:</p>
        <p className="results-list-service-detail">{result.OpeningTime}</p>
        <p className="results-list-sub-title">Address:</p>
        <p className="results-list-service-detail">{result.PhysicalAddress}</p>

        <p className="results-list-needs-tag">{result.Needs}</p>
        <p className="results-list-personalisation-tag">{result.Personalisation}</p>

        <p className="results-list-sub-title">Types of Service:</p>
        <li className="results-list-service-detail">{result.TypeOfSupport}</li>
        <p className="results-list-sub-title">About</p>
        <p className="results-list-service-detail">{result.OrgDescription}</p>
        
      
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

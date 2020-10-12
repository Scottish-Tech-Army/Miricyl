import React from "react";
import "../styles/global.css";

const Results = (props) => {

  const showResults = props.results.map((result) => (

    <div className="results-list-container" key={result.PlaceID}>
        <div className="results-title-container">
          <img className="results-list-logo" src={result.Logo}/>
          <div className="results-list-title-service">
          <p className="results-list-title"> 
        
          {result.ServiceURL ? <a href={result.ServiceURL}>{result.OrgName}</a> : <p>{result.OrgName}</p>}
          </p>
          
          <p className="results-list-service-description">{result.ServiceDescription}</p>
          </div>
        </div>
          <div>
          <button className="results-list-button" type="button">Call</button>
          <button className="results-list-button" type="button">Chat</button>
          <button className="results-list-button" type="button">

            {result.EmailAddress &&  <a class="mailto" href={result.EmailAddress}>Email</a>}
          
          {/* {result.EmailAddress ? <a class="mailto" href={result.EmailAddress}>Email</a> : <button className="results-list-button" type="button">Email</button>} */}
          
          {/* {result.EmailAddress ? <a class="mailto" href={result.EmailAddress}>Email</a> : null} */}
          {/* <a class="mailto" href={result.EmailAddress}>Email</a> */}
          </button>
          
          
          
          
          {/* <p className="results-list-email">{result.EmailAddress}</p> */}

          
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

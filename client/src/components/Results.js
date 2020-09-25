import React from "react";

const Results = (props) => {
  const showResults = props.results.map((result) => (
    <li key={result.id}>{result.name}</li>
  ));

  return (
    <div>
      <h1>results</h1>
      <ul>{showResults}</ul>
    </div>
  );
};
export default Results;

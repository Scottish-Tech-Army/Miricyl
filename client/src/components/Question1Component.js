import React from "react";

const Question1Component = (props) => {
  const handleSubmit = (e) => {
    e.preventDefault();
    props.addTag(e.target.q1.value);
  };

  const questions = props.questions.map((question) => (
    <option key={question.id} value={question.tags}>
      {question.title}
    </option>
  ));

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <select name="q1">
          <option key="0" value="" defaultValue>
            I'm looking for help with...
          </option>
          {questions}
        </select>
        <input type="submit" value="Next" />
      </form>
    </div>
  );
};

export default Question1Component;

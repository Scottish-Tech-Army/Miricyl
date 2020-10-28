import React, {useState} from 'react'
import { withRouter } from "react-router-dom";
import { IoIosArrowDropleft } from "react-icons/io";
import "../styles/global.css";

const Question4Component = ({history, sortCharities}) => {

    const [postcode, setPostcode] = useState("")

    const handleSubmit = (e) => {
        e.preventDefault();
        history.push("/results");
        sortCharities({postcode})
 
      };

      const handleChange = (e) => {
          setPostcode(e.target.value)
      }

    return (
        <div className="question-four-container">
            <div className="question-grid-container">
                <div className="title-description-container">
                    <h1 className="question-title">
                        Search mental health resources & services that can help you feel better
                    </h1>
                    <h2 className="question-page-detail-text">
                        Boost is here for you if you need trusted guidance on accessing resources and services that can positively impact your mental health.  We will guide you in finding the treatment and help you need.
                    </h2>
                </div>
                <div className="select-container">
                    <p className="question-text">Enter the first part of your postcode to find services in your area</p>

                    <input
                        type="text"
                        onChange={handleChange}
                        placeholder="Enter your postcode"
                    ></input>

                    <br />

                </div>

            </div>
            <div className="bottom-navigation">
                  <IoIosArrowDropleft className="back-button" onClick={() => {history.goBack()}} />
                  <button className="next-button" onClick={handleSubmit}>
                  Next
                  </button>
                </div>
        </div>
    )
}

export default withRouter(Question4Component);

import React, { useState, useEffect } from "react";
import "../styles/global.css";
import { IconContext } from "react-icons";
import { BiPhone } from "react-icons/bi";
import { BiEnvelope } from "react-icons/bi";
import { BiChat } from "react-icons/bi";
import { BiMap } from "react-icons/bi";
import { withRouter } from "react-router-dom";
import { IoIosArrowDropleft } from "react-icons/io";
import ReactStars from "react-rating-stars-component";
import nodeServer from "../api/nodeServer";

const Results = ({ results, history }) => {
  const [displayResults, setDisplayResults] = useState(results);

  //   async getRating(charities) {
  //     const finalCharities =[]
  //     await Promise.all(charities.map(charity => {
  //           // console.log(charity.PlaceID);
  //           if(charity.PlaceID){
  //             nodeServer.get(`/googleratings/${charity.PlaceID}`).then((res) => {
  //               const rating = res.data.rating
  //               // console.log('rating', rating);
  //               charity.googleRating = rating
  //               finalCharities.push(charity)
  //               this.setState({ finalCharities: finalCharities})
  //             })
  //           } else {
  //             // console.log('fired');
  //             this.setState({ finalCharities: finalCharities})
  //           }
  //  }))
  //   };

  const getRating = async () => {
    const finalCharities = [];
    // console.log(charity.PlaceID);
    await Promise.all(
      displayResults.map((charity) => {
        if (charity.PlaceID) {
          nodeServer.get(`/googleratings/${charity.PlaceID}`).then((res) => {
            const rating = res.data.rating;

            charity.googleRating = rating;
            console.log("rating", charity);
            finalCharities.push(charity);
            //   this.setState({ finalCharities: finalCharities})
          });
        } else {
          console.log("fired");
        }
        // return finalCharities
      })
    ).then((res) => {
      console.log(res);
    });
    // setDisplayResults(finalCharities)
  };

  const showResults = displayResults.map((result) => (
    <div className="results-list-container" key={result.PlaceID}>
      <div className="results-title-container">
        {result.Logo ? (
          <a href={result.ServiceURL} target="_blank">
            <img className="results-list-logo" src={result.Logo} />
          </a>
        ) : (
          <div></div>
        )}

        <div className="results-list-title-service">
          {result.ServiceURL ? (
            <p className="results-list-title">
              {" "}
              <a href={result.ServiceURL} target="_blank">
                {result.OrgName}
              </a>
            </p>
          ) : (
            <p className="results-list-title">{result.OrgName}</p>
          )}

          <p className="results-list-service-description">
            {result.ServiceDescription}
          </p>
          {result.googleRating ? (
            <p>
              {" "}
              <ReactStars count={5} value={result.googleRating} isHalf={true} />
              {result.googleRating}{" "}
            </p>
          ) : (
            <p>
              {" "}
              <ReactStars count={5} value={0} isHalf={true} />
              No ratings found{" "}
            </p>
          )}
        </div>
      </div>

      <div className="results-button-container">
        {result.PhoneNo && (
          <button className="results-list-button" type="button">
            <IconContext.Provider
              value={{ className: "results-react-button-icon" }}
            >
              <a href={"tel:" + result.PhoneNo}>
                <BiPhone /> Call
              </a>
            </IconContext.Provider>
          </button>
        )}

        {result.ServiceURL && (
          <button className="results-list-button" type="button">
            <IconContext.Provider
              value={{ className: "results-react-button-icon" }}
            >
              <a href={result.ServiceURL} target="_blank">
                <BiChat /> Chat{" "}
              </a>
            </IconContext.Provider>
          </button>
        )}

        {result.EmailAddress && (
          <button className="results-list-button" type="button">
            <IconContext.Provider
              value={{ className: "results-react-button-icon" }}
            >
              <a class="mailto" href={"mailto:" + result.EmailAddress}>
                <BiEnvelope /> Email
              </a>
            </IconContext.Provider>
          </button>
        )}
      </div>

      {result.OpeningTime && (
        <p className="results-list-sub-title">
          <IconContext.Provider
            value={{ className: "results-react-icons-detail" }}
          >
            {" "}
            <BiPhone /> Phone Support:
          </IconContext.Provider>
        </p>
      )}
      <p className="results-list-service-detail">{result.OpeningTime}</p>

      {result.PhysicalAddress && (
        <p className="results-list-sub-title">
          <IconContext.Provider
            value={{ className: "results-react-icons-detail" }}
          >
            {" "}
            <BiMap /> Address:
          </IconContext.Provider>
        </p>
      )}
      <p className="results-list-service-detail">{result.PhysicalAddress}</p>

      {result.UserOption && (
        <p className="results-list-needs-tag">{result.UserOption}</p>
      )}

      {result.Personalisation && (
        <p className="results-list-personalisation-tag">
          {result.Personalisation}
        </p>
      )}

      {result.TypeOfSupport && (
        <p className="results-list-sub-title">Types of Service:</p>
      )}
      {result.TypeOfSupport && (
        <li className="results-list-service-detail">{result.TypeOfSupport}</li>
      )}

      {result.OrgDescription && <p className="results-list-sub-title">About</p>}
      <p className="results-list-service-detail">{result.OrgDescription}</p>
    </div>
  ));

  // useEffect(() => {
  //   getRating()
  // }, [])

  return (
    <div className="results-page-container">
      <div className="results-wrapper">
        <div className="title-description-container">
          <h1 className="question-title">Search results</h1>
        </div>
        <div className="results-page-display">{showResults}</div>
        <div className="bottom-navigation">
          <IoIosArrowDropleft
            className="back-button-results"
            onClick={() => {
              history.goBack();
            }}
          />
        </div>
      </div>
    </div>
  );
};

export default withRouter(Results);

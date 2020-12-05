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

const Results = ({
  onBackClicked,
  selectedNeeds,
  selectedSupportTypes,
  selectedPersonalisations,
  postcode,
  charities,
}) => {
  const [prioritisedResults, setprioritisedResults] = useState([]);
  const [allCharities, setAllCharities] = useState([]);

  useEffect(() => {
    constructCharityObjects();
  }, []);

  useEffect(() => {
    sortCharities();
  }, [allCharities]);

  const sortCharities = () => {
    // Sort by number of needs met
    // then by support types
    // then by personalisations
    // then by postcode

    const prioritisedCharities = allCharities.sort(
      (a, b) => needsMet(a, b) || supportTypes(a, b) || personalisations(a, b)
    );

    setprioritisedResults(prioritisedCharities);
  };

  const needsMet = (a, b) => b.needsMet.length - a.needsMet.length;

  const supportTypes = (a, b) =>
    b.typesOfSupportOffered.length - a.typesOfSupportOffered.length;

  const personalisations = (a, b) =>
    b.personalisationsMet.length - a.personalisationsMet.length;

  const constructCharityObjects = () => {
    // get unique org ids
    const uniqueOrgIds = [
      ...new Set(charities.map((charity) => charity.OrgID)),
    ];

    // for each org generate list of
    // userOption (needs)
    // UserOption_Type (types of support)
    // personalisation

    const charityObjects = uniqueOrgIds.map((orgId) => {
      const charity = charities.find((charity) => charity.OrgID === orgId);

      const servicesFromCharity = charities.filter(
        (charity) => charity.OrgID == orgId
      );

      // This filtering logic will need to be changed once the use filter interface is implemented
      // as for now it deleted any unselected filters which the user may wish to enable

      const needsMet = [
        ...new Set(servicesFromCharity.map((service) => service.UserOption)),
      ].filter((need) => selectedNeeds.includes(need));

      const typesOfSupportOffered = [
        ...new Set(
          servicesFromCharity.map((service) => service.UserOption_Type)
        ),
      ];
      // .filter((supportType) => selectedSupportTypes.includes(supportType));
      // removed the filter as I think we should show all services?

      // there seems to be a data problem here
      const personalisationsMet = [
        ...new Set(
          servicesFromCharity.map((service) => service.Personalisation)
        ),
      ].filter((personalisation) =>
        selectedPersonalisations.includes(personalisation)
      );

      delete charity.TypeOfSupport;
      delete charity.UserOption_Type;
      delete charity.UserOption;
      delete charity.Personalisation;

      return {
        ...charity,
        needsMet,
        typesOfSupportOffered,
        personalisationsMet,
      };
    });

    setAllCharities(charityObjects);
  };

  const PrioritisedListOfCharities = prioritisedResults.map((charity) => (
    <div className="results-list-container" key={charity.PlaceID}>
      <div className="results-title-container">
        {charity.Logo ? (
          <a href={charity.ServiceURL} target="_blank">
            <img className="results-list-logo" src={charity.Logo} />
          </a>
        ) : (
          <div></div>
        )}

        <div className="results-list-title-service">
          {charity.ServiceURL ? (
            <p className="results-list-title">
              {" "}
              <a href={charity.ServiceURL} target="_blank">
                {charity.OrgName}
              </a>
            </p>
          ) : (
            <p className="results-list-title">{charity.OrgName}</p>
          )}

          <p className="results-list-service-description">
            {charity.ServiceDescription}
          </p>
          {charity.googleRating ? (
            <p>
              {" "}
              <ReactStars
                count={5}
                value={charity.googleRating}
                isHalf={true}
              />
              {charity.googleRating}{" "}
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
        {charity.PhoneNo && (
          <button className="results-list-button" type="button">
            <IconContext.Provider
              value={{ className: "results-react-button-icon" }}
            >
              <a href={"tel:" + charity.PhoneNo}>
                <BiPhone /> Call
              </a>
            </IconContext.Provider>
          </button>
        )}

        {charity.ServiceURL && (
          <button className="results-list-button" type="button">
            <IconContext.Provider
              value={{ className: "results-react-button-icon" }}
            >
              <a href={charity.ServiceURL} target="_blank">
                <BiChat /> Chat{" "}
              </a>
            </IconContext.Provider>
          </button>
        )}

        {charity.EmailAddress && (
          <button className="results-list-button" type="button">
            <IconContext.Provider
              value={{ className: "results-react-button-icon" }}
            >
              <a class="mailto" href={"mailto:" + charity.EmailAddress}>
                <BiEnvelope /> Email
              </a>
            </IconContext.Provider>
          </button>
        )}
      </div>

      {charity.OpeningTime && (
        <p className="results-list-sub-title">
          <IconContext.Provider
            value={{ className: "results-react-icons-detail" }}
          >
            {" "}
            <BiPhone /> Phone Support:
          </IconContext.Provider>
        </p>
      )}
      <p className="results-list-service-detail">{charity.OpeningTime}</p>

      {charity.PhysicalAddress && (
        <p className="results-list-sub-title">
          <IconContext.Provider
            value={{ className: "results-react-icons-detail" }}
          >
            {" "}
            <BiMap /> Address:
          </IconContext.Provider>
        </p>
      )}
      <p className="results-list-service-detail">{charity.PhysicalAddress}</p>

      {/* TODO: REMOVE INLINE CSS */}
      <div style={{ display: "flex" }}>
        {charity.needsMet.map((need) => (
          <span className="results-list-needs-tag">{need}</span>
        ))}
      </div>

      <div style={{ display: "flex" }}>
        {charity.personalisationsMet.map((personalisation) => (
          <span className="results-list-personalisation-tag">
            {personalisation}
          </span>
        ))}
      </div>

      {charity.typesOfSupportOffered && (
        <p className="results-list-sub-title">Types of Service:</p>
      )}

      {charity.typesOfSupportOffered.map((supportType) => {
        return <li className="results-list-service-detail">{supportType}</li>;
      })}

      {charity.OrgDescription && (
        <p className="results-list-sub-title">About</p>
      )}
      <p className="results-list-service-detail">{charity.OrgDescription}</p>
    </div>
  ));

  return (
    <div className="results-page-container">
      <div className="results-wrapper">
        <div className="title-description-container">
          <h1 className="question-title">Search results</h1>
        </div>
        <div className="results-page-display">{PrioritisedListOfCharities}</div>
        <div className="bottom-navigation">
          {onBackClicked && (
            <IoIosArrowDropleft
              className="back-button"
              onClick={onBackClicked}
            />
          )}
        </div>
      </div>
    </div>
  );
};

export default withRouter(Results);

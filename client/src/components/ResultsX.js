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

// EmailAddress: "sdavidson@pkc.gov.uk"
// FaceBookURL: ""
// Gender: null
// InnerCode: "8JW"
// Logo: ""
// NationalService: "YES"
// OpeningTime: "Friday 1000-1700, Tuesday 1800-2000 Monday, Wednesday, Thursday and Friday 1000-1700"
// OrgDescription: "Service which offers guidance, support, information and signposting for young people."
// OrgID: 1001
// OrgName: "@Scott Street"
// OuterCode: "PH2"
// Personalisation: "18+" **********************
// PhoneNo: "01738 474580"
// PhysicalAddress: "68-86 Scott Street Perth PH2 8JW"
// PlaceID: "ChIJ67phyRY7hkgRLX2LuPbb21Y"
// PostCode: "PH2 8JW"
// ServiceDescription: "Guidance Service"
// ServiceURL: "https://www.pkc.gov.uk/article/18448/Services-for-Young-People-Scott-Street"
// SpecificArea: "Scotland"
// TypeOfSupport: "Drop in"  **********************
// UserOption: "Debt or Looking for Employment" ************************
// UserOption_Type: "Face to face"

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
    const prioritisedCharities = allCharities.sort(
      (a, b) => needsMet(a, b) || supportTypes(a, b) || personalisations(a, b)
    );

    console.log("prio", prioritisedCharities);

    // Sort by number of needs met
    // then by support types
    // then by personalisations
    // then by postcode
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

    const charityObjects = uniqueOrgIds.slice(0, 10).map((orgId) => {
      const charity = charities.find((charity) => charity.OrgID === orgId);

      const servicesFromCharity = charities.filter(
        (charity) => charity.OrgID == orgId
      );

      const needsMet = [
        ...new Set(servicesFromCharity.map((service) => service.UserOption)),
      ];
      const typesOfSupportOffered = [
        ...new Set(
          servicesFromCharity.map((service) => service.UserOption_Type)
        ),
      ];
      const personalisationsMet = [
        ...new Set(
          servicesFromCharity.map((service) => service.Personalisation)
        ),
      ]; // might not work

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

  // const ShowResults = prioritisedResults.map((result) => (
  //   <div className="results-list-container" key={result.PlaceID}>
  //     <div className="results-title-container">
  //       {result.Logo ? (
  //         <a href={result.ServiceURL} target="_blank">
  //           <img className="results-list-logo" src={result.Logo} />
  //         </a>
  //       ) : (
  //         <div></div>
  //       )}

  //       <div className="results-list-title-service">
  //         {result.ServiceURL ? (
  //           <p className="results-list-title">
  //             {" "}
  //             <a href={result.ServiceURL} target="_blank">
  //               {result.OrgName}
  //             </a>
  //           </p>
  //         ) : (
  //           <p className="results-list-title">{result.OrgName}</p>
  //         )}

  //         <p className="results-list-service-description">
  //           {result.ServiceDescription}
  //         </p>
  //         {result.googleRating ? (
  //           <p>
  //             {" "}
  //             <ReactStars count={5} value={result.googleRating} isHalf={true} />
  //             {result.googleRating}{" "}
  //           </p>
  //         ) : (
  //           <p>
  //             {" "}
  //             <ReactStars count={5} value={0} isHalf={true} />
  //             No ratings found{" "}
  //           </p>
  //         )}
  //       </div>
  //     </div>

  //     <div className="results-button-container">
  //       {result.PhoneNo && (
  //         <button className="results-list-button" type="button">
  //           <IconContext.Provider
  //             value={{ className: "results-react-button-icon" }}
  //           >
  //             <a href={"tel:" + result.PhoneNo}>
  //               <BiPhone /> Call
  //             </a>
  //           </IconContext.Provider>
  //         </button>
  //       )}

  //       {result.ServiceURL && (
  //         <button className="results-list-button" type="button">
  //           <IconContext.Provider
  //             value={{ className: "results-react-button-icon" }}
  //           >
  //             <a href={result.ServiceURL} target="_blank">
  //               <BiChat /> Chat{" "}
  //             </a>
  //           </IconContext.Provider>
  //         </button>
  //       )}

  //       {result.EmailAddress && (
  //         <button className="results-list-button" type="button">
  //           <IconContext.Provider
  //             value={{ className: "results-react-button-icon" }}
  //           >
  //             <a class="mailto" href={"mailto:" + result.EmailAddress}>
  //               <BiEnvelope /> Email
  //             </a>
  //           </IconContext.Provider>
  //         </button>
  //       )}
  //     </div>

  //     {result.OpeningTime && (
  //       <p className="results-list-sub-title">
  //         <IconContext.Provider
  //           value={{ className: "results-react-icons-detail" }}
  //         >
  //           {" "}
  //           <BiPhone /> Phone Support:
  //         </IconContext.Provider>
  //       </p>
  //     )}
  //     <p className="results-list-service-detail">{result.OpeningTime}</p>

  //     {result.PhysicalAddress && (
  //       <p className="results-list-sub-title">
  //         <IconContext.Provider
  //           value={{ className: "results-react-icons-detail" }}
  //         >
  //           {" "}
  //           <BiMap /> Address:
  //         </IconContext.Provider>
  //       </p>
  //     )}
  //     <p className="results-list-service-detail">{result.PhysicalAddress}</p>

  //     {result.UserOption && (
  //       <p className="results-list-needs-tag">{result.UserOption}</p>
  //     )}

  //     {result.Personalisation && (
  //       <p className="results-list-personalisation-tag">
  //         {result.Personalisation}
  //       </p>
  //     )}

  //     {result.TypeOfSupport && (
  //       <p className="results-list-sub-title">Types of Service:</p>
  //     )}
  //     {result.TypeOfSupport && (
  //       <li className="results-list-service-detail">{result.TypeOfSupport}</li>
  //     )}

  //     {result.OrgDescription && <p className="results-list-sub-title">About</p>}
  //     <p className="results-list-service-detail">{result.OrgDescription}</p>
  //   </div>
  // ));

  return (
    <div className="results-page-container">
      <div className="results-wrapper">
        <div className="title-description-container">
          <h1 className="question-title">Search results</h1>
        </div>
        {/* <div className="results-page-display">{ShowResults}</div> */}
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

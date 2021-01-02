import React, { useState, useEffect } from "react";
import { useFlags } from "../hooks/useFlags";
import "../styles/global.css";
import Filter from "./Filter";
import { IconContext } from "react-icons";
import { BiPhone } from "react-icons/bi";
import { BiEnvelope } from "react-icons/bi";
import { BiChat } from "react-icons/bi";
import { BiMap } from "react-icons/bi";
import { withRouter } from "react-router-dom";
import { IoIosArrowDropleft } from "react-icons/io";
import ReactStars from "react-rating-stars-component";
import postcodeServer from "../api/postcodeServer";

const Results = ({
  onBackClicked,
  needs,
  supportTypes,
  personalisations,
  postcode = "",
  charities,
  onToggleNeedSelected,
  onToggleSupportTypeSelected,
  onTogglePersonalisationSelected,
}) => {
  console.log("rendered");
  const [prioritisedResults, setprioritisedResults] = useState([]);

  const [allCharities, setAllCharities] = useState([]);

  const { filter } = useFlags();

  const selectedNeeds = needs
    .filter((need) => need.isSelected)
    .map((selectedNeed) => selectedNeed.value);

  const selectedSupportTypes = supportTypes
    .filter((supportType) => supportType.isSelected)
    .map((selectedSupportType) => selectedSupportType.value);

  const selectedPersonalisations = personalisations
    .filter((personalisation) => personalisation.isSelected)
    .map((selectedPersonalisation) => selectedPersonalisation.value);

  useEffect(() => {
    clearStates();
    constructCharityObjects();
  }, [needs, supportTypes, personalisations]);

  useEffect(() => {
    sortCharities();
  }, [allCharities]);

  const clearStates = () => {
    setAllCharities([]);
    setprioritisedResults([]);
  };

  const sortCharities = async () => {
    let filteredCharities = allCharities;

    console.log("filter2", filteredCharities);

    // if (selectedSupportTypes.length > 0) {
    //   filteredCharities = filteredCharities.filter(
    //     (charity) =>
    //       charity.typesOfSupportOffered.filter((supportType) =>
    //         selectedSupportTypes.includes(supportType)
    //       ).length > 0
    //   );
    // }

    // gets a list of all postcodes withing range of latitude and longitude
    const getListOfPostcodes = async (payload) => {
      const res = await postcodeServer.post("/", payload);
      return res;
    };

    // gets latitude and longitude from postcode
    const getPostcodeDetails = async () => {
      try {
        const res = await postcodeServer.get(`/${postcode}`);
        return res;
      } catch (error) {
        console.log(error);
      }
    };

    if (selectedNeeds.length > 0) {
      filteredCharities = filteredCharities.filter((charity) => {
        return selectedNeeds.every((need) => charity.needsMet.includes(need));
      });
    }

    if (postcode.length < 5 && postcode !== "") {
      console.log("pc", postcode);
      console.log("fired");
      // sort for outer postcode
      filteredCharities = filteredCharities.filter(
        (charity) => charity.OuterCode.toUpperCase() == postcode.toUpperCase()
      );
    }
    if (postcode.length > 4) {
      // sort for full postcode with distance
      let postcodeDetails = await getPostcodeDetails().then(
        (postcodeDetails) => {
          const latitude = postcodeDetails.data.result.latitude;
          const longitude = postcodeDetails.data.result.longitude;
          const payload = {
            geolocations: [
              {
                latitude: latitude,
                longitude: longitude,
                radius: 2000,
                limit: 100,
              },
            ],
          };
          return payload;
        }
      );
      const matchingCharities = await getListOfPostcodes(postcodeDetails)
        .then((returnedPostcodesResults) => {
          const charities = [];
          let returnedPostcodes =
            returnedPostcodesResults.data.result[0].result;
          filteredCharities.map((charity) => {
            returnedPostcodes.filter((postcode) => {
              if (charity.PostCode.toUpperCase() === postcode.postcode) {
                charities.push(charity);
              }
            });
          });
          return charities;
        })
        .then((charities) => {
          //setPostcodeCharities(charities)
          filteredCharities = charities;
        });
    }
    console.log("filter", filteredCharities);

    const prioritisedCharities = filteredCharities
      .filter((charity) => charity.NationalService === "YES" || postcode != "")
      .sort(
        (a, b) =>
          noOfMatchedSupportTypesAndPersonalisations(a, b) ||
          noOfMatchedPersonalisations(a, b) ||
          noOfMatchedSupportTypes(a, b) ||
          alphabetical(a, b)
      );

    setprioritisedResults(prioritisedCharities);
  };

  const noOfMatchedSupportTypesAndPersonalisations = (a, b) =>
    b.servicesWithMatchedPersonalisationsAndSupportTypes.length -
    a.servicesWithMatchedPersonalisationsAndSupportTypes.length;

  const noOfMatchedSupportTypes = (a, b) =>
    b.matchedTypesOfSupportOffered.length -
    a.matchedTypesOfSupportOffered.length;

  const noOfMatchedPersonalisations = (a, b) =>
    b.matchedPersonalisations.length - a.matchedPersonalisations.length;

  const alphabetical = (a, b) => a.OrgName.localeCompare(b.OrgName);

  // const needsMet = (a, b) => b.needsMet.length - a.needsMet.length;

  const constructCharityObjects = () => {
    let locationSortedCharities;

    if (postcode === "") {
      locationSortedCharities = charities.sort((a, b) => {
        return a.NationalService === "YES"
          ? -1
          : b.NationalService === "YES"
            ? 1
            : 0;
      });
    } else {
      locationSortedCharities = charities.sort((a, b) => {
        return a.OuterCode.toUpperCase() === postcode.toUpperCase()
          ? -1
          : b.OuterCode.toUpperCase() === postcode.toUpperCase()
            ? 1
            : 0;
      });
    }

    const uniqueOrgIds = [
      ...new Set(locationSortedCharities.map((charity) => charity.OrgID)),
    ];

    const charityObjects = uniqueOrgIds.map((orgId) => {
      const charity = charities.find((charity) => charity.OrgID === orgId);
      let servicesFromCharity = charities.filter((charity) => {
        return (
          charity.OrgID === orgId &&
          (postcode === ""
            ? charity.NationalService === "YES"
            : charity.OuterCode.toUpperCase() === postcode.toUpperCase())
        );
      });

      const needsMet = [
        ...new Set(servicesFromCharity.map((service) => service.UserOption)),
      ].filter((need) => selectedNeeds.includes(need));

      const typesOfSupportOffered = [
        ...new Set(
          servicesFromCharity.map((service) => service.UserOption_Type)
        ),
      ];

      const matchedTypesOfSupportOffered = [
        ...new Set(
          servicesFromCharity
            .filter(
              (service) =>
                (selectedNeeds.includes(service.UserOption) ||
                  selectedNeeds.length === 0) &&
                selectedSupportTypes.includes(service.UserOption_Type)
            )
            .map((matchedService) => matchedService.UserOption_Type)
        ),
      ];

      const personalisationsMet = [
        ...new Set(
          servicesFromCharity.map((service) => service.Personalisation)
        ),
      ];

      const matchedPersonalisations = [
        ...new Set(
          servicesFromCharity
            .filter(
              (service) =>
                (selectedNeeds.includes(service.UserOption) ||
                  selectedNeeds.length === 0) &&
                selectedPersonalisations.includes(service.Personalisation)
            )
            .map((matchedService) => matchedService.Personalisation)
        ),
      ];

      const servicesWithMatchedPersonalisationsAndSupportTypes = [
        ...new Set(
          servicesFromCharity
            .filter(
              (service) =>
                (selectedNeeds.includes(service.UserOption) ||
                  selectedNeeds.length === 0) &&
                selectedPersonalisations.includes(service.Personalisation) &&
                selectedSupportTypes.includes(service.UserOption_Type)
            )
            .map((matchedService) => matchedService.Personalisation)
        ),
      ];

      // This stuff is causing pass by reference issues currently
      // delete charity.TypeOfSupport;
      // delete charity.UserOption_Type;
      // delete charity.UserOption;
      // delete charity.Personalisation;

      return {
        ...charity,
        needsMet,
        typesOfSupportOffered,
        matchedTypesOfSupportOffered,
        personalisationsMet,
        matchedPersonalisations,
        servicesWithMatchedPersonalisationsAndSupportTypes,
      };
    });

    setAllCharities(charityObjects);
  };

  const PrioritisedListOfCharities = prioritisedResults.map((charity) => (
    <div
      className="results-list-container"
      key={charity.PlaceID}
      test-id={`card-${charity.OrgID}`}
    >
      <div className="results-title-container">
        {charity.Logo || `/images/$web/${charity.OrgID}.png` ? (
          <a href={charity.ServiceURL} target="_blank">
            <img className="results-list-logo" src={`/images/$web/${charity.OrgID}.png`} alt={`${charity.OrgName} logo`} onError={charity.Logo} />
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

          {/* <p className="results-list-service-description">
            {charity.ServiceDescription}
          </p> */}
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
        {filter === 1 && (
          <Filter
            needs={needs}
            supportTypes={supportTypes}
            personalisations={personalisations}
            onToggleNeedSelected={onToggleNeedSelected}
            onToggleSupportTypeSelected={onToggleSupportTypeSelected}
            onTogglePersonalisationSelected={onTogglePersonalisationSelected}
          />
        )}
        <div className="title-description-container">
          <h1 className="question-title" test-id="results-title">
            Search results
          </h1>
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

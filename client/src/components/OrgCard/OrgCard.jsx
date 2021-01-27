import React, { useState } from "react";

import * as styles from "./orgCard.module.scss";
import { IconContext } from "react-icons";
import { BiPhone } from "react-icons/bi";
import { BiEnvelope } from "react-icons/bi";
import { BiChat } from "react-icons/bi";
import { MdKeyboardArrowDown, MdKeyboardArrowUp } from "react-icons/md";

import ReactStars from "react-rating-stars-component";

const OrgCard = ({ charity }) => {
  const [isExapnded, setIsExpanded] = useState(false);

  return (
    <div className={styles.container}>
      <OrgOverview charity={charity} />
      <OptionsMet services={charity.Services} />
      <div className={styles.servicesContainer}>
        {charity.Services.slice(
          0,
          isExapnded ? charity.Services.length : 2
        ).map((service) => (
          <Service service={service} />
        ))}
      </div>
      <OrgDetails
        email={charity.Email}
        phone={charity.PhoneNo}
        address={charity.Address}
      />
      <button
        className={styles.expandButtonContainer}
        onClick={() => {
          setIsExpanded(!isExapnded);
        }}
        disabled={charity.Services.length <= 2}
      >
        {isExapnded ? (
          <MdKeyboardArrowDown className={`${styles.expandIcon}`} />
        ) : (
            <MdKeyboardArrowUp
              className={`${styles.expandIcon} ${charity.Services.length <= 2 && styles.disabled
                }`}
            />
          )}
      </button>
    </div>
  );
};

const OrgOverview = ({ charity }) => {
  console.log(charity);
  return (
    <div className={styles.overviewContainer}>
      <div className={styles.logoContainer}>
        <a href={charity.OrgURL} target="_blank">
          <img
            className={styles.orgLogo}
            src={`/images/$web/${charity.OrgID}.png`}
            alt={`${charity.OrgName} logo`}
          />
        </a>
      </div>
      <div className={styles.overviewInformationContainer}>
        <span className={styles.orgName}><a href={charity.OrgURL} target="_blank">{charity.OrgName}</a></span>
        <span className={styles.orgDescription}>{charity.OrgDescription}</span>
        <span>Ratings placeholder</span>
      </div>
      <div className={styles.distanceBox}>tbi</div>
    </div>
  );
};

const OptionsMet = ({ services }) => {
  const uniqueMatchedNeeds = [
    ...new Set(...services.map((service) => service.matchedNeeds)),
  ];

  const uniqueMatchedSupportTypes = [
    ...new Set(...services.map((service) => service.matchedTypesOfSupport)),
  ];
  const uniqueMatchedPersonalisations = [
    ...new Set(...services.map((service) => service.matchedPersonalisations)),
  ];

  return (
    <div className={styles.optionsMetContainer}>
      {uniqueMatchedNeeds.map((need) => (
        <span className={`${styles.optionBox} ${styles.need}`}>{need}</span>
      ))}
      {uniqueMatchedSupportTypes.map((supportType) => (
        <span className={`${styles.optionBox} ${styles.supportType}`}>
          {supportType}
        </span>
      ))}
      {uniqueMatchedPersonalisations.map((personalisation) => (
        <span className={`${styles.optionBox} ${styles.personalisation}`}>
          {personalisation}
        </span>
      ))}
    </div>
  );
};

const Service = ({ service }) => {
  return (
    <div className={styles.serviceContainer}>
      <span className={styles.serviceName}>{service.ServiceName}</span>
      <span className={styles.serviceInfo}>{service.PhoneNo}</span>
      <span className={styles.serviceInfo}>{service.OpeningTimes}</span>
      <span className={styles.serviceInfo}>{service.PhysicalAddress}</span>
      <div className={styles.serviceContactBoxes}>
        {service.PhoneNo && (
          <button className="results-list-button" type="button">
            <IconContext.Provider
              value={{ className: "results-react-button-icon" }}
            >
              <a href={"tel:" + service.PhoneNo}>
                <BiPhone /> Call
              </a>
            </IconContext.Provider>
          </button>
        )}

        {service.ServiceUrl && (
          <button className="results-list-button" type="button">
            <IconContext.Provider
              value={{ className: "results-react-button-icon" }}
            >
              <a href={service.ServiceUrl} target="_blank">
                <BiChat /> Web{" "}
              </a>
            </IconContext.Provider>
          </button>
        )}

        {service.EmailAddress && (
          <button className="results-list-button" type="button">
            <IconContext.Provider
              value={{ className: "results-react-button-icon" }}
            >
              <a class="mailto" href={"mailto:" + service.EmailAddress}>
                <BiEnvelope /> Email
              </a>
            </IconContext.Provider>
          </button>
        )}
      </div>
    </div>
  );
};

const OrgDetails = ({ phone, email, address }) => {
  return (
    <div className={styles.orgDetailsContainer}>
      <span className={styles.orgDetailsTitle}>
        Organisation contact details:
      </span>
      <div className={styles.contactDetailsContainer}>
        <span>
          <b>Phone:</b> {email ?? "placeholder"}
        </span>
        <span>
          <b>Email:</b> {phone ?? "placeholder"}
        </span>
        <span>
          <b>Address:</b> {address ?? "placeholder"}
        </span>
      </div>
    </div>
  );
};

export default OrgCard;

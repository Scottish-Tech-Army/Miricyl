import React, { useState } from "react";

import * as styles from "./orgCard.module.scss";
import { IconContext } from "react-icons";
import { BiPhone } from "react-icons/bi";
import { BiEnvelope } from "react-icons/bi";
import { BiChat } from "react-icons/bi";
import { MdKeyboardArrowDown, MdKeyboardArrowUp } from "react-icons/md";

const OrgCard = ({ charity }) => {
  const [isExapnded, setIsExpanded] = useState(false);

  return (
    <div className={styles.container} id={charity.OrgID}>
      <OrgOverview charity={charity} />
      <OptionsMet services={charity.Services} />
      <div className={styles.servicesContainer} id="services-container">
        {charity.Services.slice(
          0,
          isExapnded ? charity.Services.length : 2
        ).map((service) => (
          <Service service={service} />
        ))}
      </div>
      {charity.Email || charity.PhoneNo || charity.Address ? (
        <OrgDetails
          email={charity.Email}
          phone={charity.PhoneNo}
          address={charity.Address}
        />
      ) : (
        <div className={styles.expander} />
      )}
      <button
        className={styles.expandButtonContainer}
        onClick={() => {
          setIsExpanded(!isExapnded);
        }}
        disabled={charity.Services.length <= 2}
        id="expand-button"
      >
        {isExapnded ? (
          <MdKeyboardArrowUp className={`${styles.expandIcon}`} />
        ) : (
          <MdKeyboardArrowDown
            className={`${styles.expandIcon} ${
              charity.Services.length <= 2 && styles.disabled
            }`}
          />
        )}
      </button>
    </div>
  );
};

const OrgOverview = ({ charity }) => {
  return (
    <div className={styles.overviewContainer}>
      <div className={styles.logoContainer} id="org-logo">
        <a href={charity.OrgURL} target="_blank">
          <img
            className={styles.orgLogo}
            src={`/images/$web/${charity.OrgID}.png`}
            alt={`${charity.OrgName} logo`}
          />
        </a>
      </div>
      <div className={styles.overviewInformationContainer}>
        <span className={styles.orgName} id="org-name">
          <a href={charity.OrgURL} target="_blank">
            {charity.OrgName}
          </a>
        </span>
        <span className={styles.orgDescription} id="org-description">
          {charity.OrgDescription}
        </span>
      </div>
    </div>
  );
};

const OptionsMet = ({ services }) => {
  const uniqueMatchedNeeds = [
    ...new Set(services.map((service) => service.matchedNeeds).flat()),
  ];

  const uniqueMatchedSupportTypes = [
    ...new Set(services.map((service) => service.matchedTypesOfSupport).flat()),
  ];
  const uniqueMatchedPersonalisations = [
    ...new Set(
      services.map((service) => service.matchedPersonalisations).flat()
    ),
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
      <span className={styles.serviceName} id="service-name">
        {service.ServiceName}
      </span>
      <span className={styles.serviceInfo} id="service-phone">
        {service.PhoneNo}
      </span>
      <span className={styles.serviceInfo} id="service-opening">
        {service.OpeningTimes}
      </span>
      <span className={styles.serviceInfo} id="service-address">
        {service.PhysicalAddress}
      </span>
      <div className={styles.serviceContactBoxes}>
        {service.PhoneNo && (
          <button
            className="results-list-button"
            type="button"
            id="call-button"
          >
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
          <button className="results-list-button" type="button" id="web-button">
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
          <button
            className="results-list-button"
            type="button"
            id="mail-button"
          >
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
    <div className={styles.orgDetailsContainer} id="org-details">
      <span className={styles.orgDetailsTitle}>
        Organisation contact details:
      </span>
      <div className={styles.contactDetailsContainer}>
        {email && (
          <span id="org-email">
            <b>Email:</b> {email}
          </span>
        )}
        {phone && (
          <span id="org-phone">
            <b>Phone:</b> {phone}
          </span>
        )}
        {address && (
          <span id="org-address">
            <b>Address:</b> {address}
          </span>
        )}
      </div>
    </div>
  );
};

export default OrgCard;

import React from "react";

import * as styles from "./orgCard.module.scss";
import ReactStars from "react-rating-stars-component";

const OrgCard = ({ charity }) => {
  console.log(charity);
  return (
    <div className={styles.container}>
      <OrgOverview charity={charity} />
      <OptionsMet services={charity.Services} />
      <div className={styles.servicesContainer}>
        {charity.Services.map((service) => (
          <Service service={service} />
        ))}
      </div>
      <div className={styles.orgDetailsContainer}>Org Details</div>
    </div>
  );
};

const OrgOverview = ({ charity }) => {
  return (
    <div className={styles.overviewContainer}>
      <div className={styles.logoContainer}>
        <a href={charity.OrgURL} target="_blank">
          <img
            className={styles.orgLogo}
            src={`https://dev.miricyl.org/images/$web/${charity.OrgID}.png`}
            alt={`${charity.OrgName} logo`}
          />
        </a>
      </div>
      <div className={styles.overviewInformationContainer}>
        <span className={styles.orgName}>{charity.OrgName}</span>
        <span className={styles.orgDescription}>{charity.OrgDescription}</span>
        <span>Ratings placeholder</span>
      </div>
      <div className={styles.distanceBox}>tbi</div>
    </div>
  );
};

const OptionsMet = ({ services }) => {
  // const matchedPersonalisations = [
  //   ...new Set(
  //     service.Personalisations.filter((personalisation) =>
  //       selectedPersonalisations.includes(personalisation)
  //     )
  //   ),
  // ];

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
      <div className={styles.serviceContactBoxes}>boxes</div>
    </div>
  );
};

export default OrgCard;

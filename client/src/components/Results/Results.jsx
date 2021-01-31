import React from "react";

import Filter from "../Filter/Filter";
import OrgCard from "../OrgCard/OrgCard";
import Footer from "../Footer";

import * as styles from "./results.module.scss";

const Results = ({
  needs,
  supportTypes,
  personalisations,
  postcode = "",
  charities,
  onToggleNeedSelected,
  onToggleSupportTypeSelected,
  onTogglePersonalisationSelected,
  onClearAllUserSelections,
}) => {
  const selectedNeeds = needs
    .filter((need) => need.isSelected)
    .map((selectedNeed) => selectedNeed.value);

  const selectedSupportTypes = supportTypes
    .filter((supportType) => supportType.isSelected)
    .map((selectedSupportType) => selectedSupportType.value);

  const selectedPersonalisations = personalisations
    .filter((personalisation) => personalisation.isSelected)
    .map((selectedPersonalisation) => selectedPersonalisation.value);

  const filteredCharitiesByNeedsMet = (allCharities) => {
    // first, if no post code is entered, remove services which are not national
    // if postcode is entered remove services not relating to that postcode

    allCharities = allCharities.map((charity) => {
      const locationFilteredServicesForCharity = charity.Services.filter(
        (service) =>
          postcode === ""
            ? service.NationalService
            : service.OuterCode.toUpperCase() === postcode.toUpperCase()
      );
      return {
        ...charity,
        Services: locationFilteredServicesForCharity,
      };
    });

    // remove any charities with no services remaining
    allCharities = allCharities.filter(
      (charity) => charity.Services.length > 0
    );

    // remove charities where no services meet all needs
    if (selectedNeeds.length > 0) {
      allCharities = allCharities.filter((charity) => {
        return (
          charity.Services.filter((service) =>
            selectedNeeds.some((selectedNeed) =>
              service.Needs.includes(selectedNeed)
            )
          ).length > 0
        );
      });
    }

    return allCharities;
  };

  const enhanceServicesWithSupportTypesAndPersonalisationsMet = (charities) => {
    return charities.map((charity) => {
      const enhancedServices = charity.Services.map((service) => {
        const matchedTypesOfSupport = [
          ...new Set(
            service.SupportTypes.filter((supportType) =>
              selectedSupportTypes.includes(supportType)
            )
          ),
        ];

        const matchedPersonalisations = [
          ...new Set(
            service.Personalisations.filter((personalisation) =>
              selectedPersonalisations.includes(personalisation)
            )
          ),
        ];

        const matchedNeeds = [
          ...new Set(
            service.Needs.filter((need) => selectedNeeds.includes(need))
          ),
        ];

        return {
          ...service,
          matchedTypesOfSupport,
          matchedPersonalisations,
          matchedNeeds,
        };
      });

      return {
        ...charity,
        Services: enhancedServices,
      };
    });
  };

  const prioritiseServicesWithinCharities = (charities) => {
    return charities.map((charity) => {
      const sortedServices = charity.Services.sort(
        (a, b) =>
          noOfMatchedPersonalisations(a, b) ||
          noOfMatchedSupportTypes(a, b) ||
          sortByServicePiority(a, b) ||
          alphabeticalService(a, b)
      );

      return {
        ...charity,
        Services: sortedServices,
      };
    });
  };

  const noOfMatchedPersonalisations = (a, b) =>
    b.matchedPersonalisations.length - a.matchedPersonalisations.length;

  const noOfMatchedSupportTypes = (a, b) =>
    b.matchedTypesOfSupport.length - a.matchedTypesOfSupport.length;

  const sortByServicePiority = (a, b) => b.ServicePriority - a.ServicePriority;

  const sortByOrgPiority = (a, b) => b.OrgPriority - a.OrgPriority;

  const alphabeticalService = (a, b) =>
    a.ServiceName.localeCompare(b.ServiceName);

  const alphabeticalOrg = (a, b) => a.OrgName.localeCompare(b.OrgName);

  const prioritiseCharities = (charities) => {
    console.log(charities);
    return charities.sort(
      (a, b) => sortByOrgPiority(a, b) || alphabeticalOrg(a, b)
    );
  };

  let sortedObjects = filteredCharitiesByNeedsMet(charities);
  sortedObjects = enhanceServicesWithSupportTypesAndPersonalisationsMet(
    sortedObjects
  );

  sortedObjects = prioritiseServicesWithinCharities(sortedObjects);
  sortedObjects = prioritiseCharities(sortedObjects);

  return (
    <div className={styles.container}>
      <Filter
        needs={needs}
        supportTypes={supportTypes}
        personalisations={personalisations}
        onToggleNeedSelected={onToggleNeedSelected}
        onToggleSupportTypeSelected={onToggleSupportTypeSelected}
        onTogglePersonalisationSelected={onTogglePersonalisationSelected}
        onClearAllClicked={onClearAllUserSelections}
      />
      <div className={styles.cardList}>
        {sortedObjects.map((org) => {
          return <OrgCard charity={org} />;
        })}
      </div>
      <Footer />
    </div>
  );
};

export default Results;

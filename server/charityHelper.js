const createCharityObjects = (serviceDetailsJson, organisations) => {
  const allServices = createServiceObjects(serviceDetailsJson);
  const allOrgs = createOrgObjects(organisations);

  const orgObjects = addServicesToOrgs(allServices, allOrgs);

  // might make more changes to this method as requirements develop
  return orgObjects;
};

const createServiceObjects = (orgAndServicesObjects) => {
  return orgAndServicesObjects.map((object) => {
    return {
      OrgID: object.OrgID,
      NationalService: isNationalService(object.NationalService),
      ServiceName: object.ServiceName,
      PhoneNo: object.PhoneNo,
      OpeningTimes: object.OpeningTimes,
      PhysicalAddress: object.PhysicalAddress,
      EmailAdress: object.EmailAdress,
      ServiceUrl: object.ServiceUrl,
      Need: object.UserOption,
      SupportType: object.UserOption_Type,
      Personalisation: object.Personalisation,
    };
  });
};

createOrgObjects = (orgAndServicesObjects) => {
  return orgAndServicesObjects.map((object) => {
    return {
      OrgID: object.OrgID,
      OrgName: object.OrgName,
      OrgDescription: object.ServiceDesc,
      OrgURL: object.OrgURL,
      PlaceID: object.PlaceID,
      // Rating: object.Rating to be implemented
    };
  });
};

const addServicesToOrgs = (services, orgs) => {
  return orgs.map((org) => {
    const orgID = org.OrgID;
    const servicesForOrg = services.filter(
      (service) => service.OrgID === orgID
    );
    return {
      ...org,
      services: servicesForOrg,
    };
  });
};

const isNationalService = (isNationalString) => isNationalString === "YES";

module.exports = createCharityObjects;

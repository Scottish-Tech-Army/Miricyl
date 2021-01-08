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

const createOrgObjects = (orgAndServicesObjects) => {
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
      services: cleanServices(servicesForOrg),
    };
  });
};

const cleanServices = (servicesForOrg) => {
  const uniqueServicesForOrg = [
    ...new Set(servicesForOrg.map((service) => service.ServiceName)),
  ];

  return (cleanedServices = uniqueServicesForOrg.map((serviceName) => {
    const matchedServices = servicesForOrg.filter(
      (service) => service.ServiceName === serviceName
    );

    const needsMet = [
      ...new Set(matchedServices.map((service) => service.Need)),
    ];

    const supportTypesMet = [
      ...new Set(matchedServices.map((service) => service.SupportType)),
    ];

    const personalisationsMet = [
      ...new Set(matchedServices.map((service) => service.Personalisation)),
    ];

    const baseService = matchedServices[0];

    return {
      ServiceName: serviceName,
      NationalService: baseService.NationalService,
      PhoneNo: baseService.PhoneNo,
      PhysicalAddress: baseService.PhysicalAddress,
      Needs: needsMet,
      SupportTypes: supportTypesMet,
      Personalisations: personalisationsMet,
    };
  }));
};

const isNationalService = (isNationalString) => isNationalString === "YES";

module.exports = createCharityObjects;
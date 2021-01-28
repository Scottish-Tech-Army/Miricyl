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
      OuterCode: object.OuterCode,
      PhoneNo: object.PhoneNo,
      OpeningTimes: object.OpeningTime,
      PhysicalAddress: object.PhysicalAddress,
      EmailAddress: object.EmailAddress,
      ServiceURL: object.ServiceURL,
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
      OrgDescription: object.OrgDesc,
      OrgURL: object.OrgURL,
      PlaceID: object.PlaceID,
      Email: object.Email,
      PhoneNo: object.OrgPhoneNumber,
      Address: object.OrgAddress,
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
      Services: cleanServices(servicesForOrg),
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
      OuterCode: baseService.OuterCode,
      PhoneNo: baseService.PhoneNo,
      OpeningTimes: baseService.OpeningTimes,
      PhysicalAddress: baseService.PhysicalAddress,
      EmailAddress: baseService.EmailAddress,
      ServiceUrl: baseService.ServiceURL,
      Needs: needsMet,
      SupportTypes: supportTypesMet,
      Personalisations: personalisationsMet,
    };
  }));
};

const isNationalService = (isNationalString) => isNationalString === "YES";

module.exports = createCharityObjects;

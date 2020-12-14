import React, { useEffect, useState } from "react";
import { Route, useHistory, withRouter } from "react-router-dom";
import nodeServer from "../api/nodeServer";
import MultiChoiceQuestion from "../components/MultiChoiceQuestion";
import TextBoxQuestion from "../components/TextBoxQuestion";
import Results from "../components/Results";

const HomePageContainer = () => {
  const [allNeeds, setAllNeeds] = useState([]);
  const [selectedNeeds, setSelectedNeeds] = useState([]);

  const [allSupportTypes, setAllSupportTypes] = useState([]);
  const [selectedSupportTypes, setSelectedSupportTypes] = useState([]);

  const [allPersonalisations, setAllPersonalisations] = useState([]);
  const [selectedPersonalisations, setSelectedPersonalisations] = useState([]);

  const [charities, setCharities] = useState([]);

  const [postcode, setPostcode] = useState("");

  const history = useHistory();

  useEffect(() => {
    getNeeds();
  }, []);

  const onBackClicked = () => {
    history.goBack();
  };

  // QUESTION - 1: Needs

  const getNeeds = () => {
    nodeServer.get("/needs").then((res) => {
      const needsResponse = res.data;
      needsResponse.sort((a, b) => a.Need.localeCompare(b.Need));
      const needs = needsResponse.map((need) => need.Need);
      setAllNeeds(needs);
    });
  };

  const handleNeedsCompleted = (selectedOptions) => {
    setSelectedNeeds(selectedOptions);
    getSupportTypes();
    getCharitiesSuitableForNeeds(selectedOptions);
    history.push("/service-types");
    // fetchCharitiesSuitableForNeeds();
  };

  const getCharitiesSuitableForNeeds = (selectedOptions) => {
    // this method could do with a good refactor

    if (selectedOptions.length === 0) {
      nodeServer
        .get("/charities")
        .then((res) => {
          const charities = res.data;
          setCharities(charities);
        })
        .catch((error) => {
          console.log(error);
        });
    } else {
      let queryParams = "";
      selectedOptions.map((need) => {
        let queryParam = `${need}£`;
        queryParams = queryParams.concat(queryParam);
      });

      nodeServer
        .get(`/charities?tags=${queryParams}`)
        .then((res) => {
          const charities = res.data;
          // sorts charities alphabetically
          charities.sort((a, b) => a.OrgName.localeCompare(b.OrgName));
          setCharities(charities);
        })
        .catch((error) => {
          console.log(error);
        });
    }
  };

  // QUESTION 2 - Support Types:

  const getSupportTypes = () => {
    nodeServer.get("/types").then((res) => {
      const supportTypesResponse = res.data;

      const uniqueSupportTypes = [
        ...new Set(
          supportTypesResponse.map((supportType) => supportType.UserOption_Type)
        ),
      ];

      setAllSupportTypes(uniqueSupportTypes);
    });
  };

  const handleSupportTypesCompleted = (selectedOptions) => {
    setSelectedSupportTypes(selectedOptions);
    getPersonalisations();
    history.push("/personalise");
  };

  // QUESTION 3 - Personalisations:

  const getPersonalisations = () => {
    nodeServer.get("/personalisations").then((res) => {
      const personalisationsResponse = res.data
        .map((personalisation) => personalisation.UserOption)
        .filter((personalisation) => personalisation != "");
      setAllPersonalisations(personalisationsResponse);
    });
  };

  const handlePersonalisationsCompleted = (selectedOptions) => {
    setSelectedPersonalisations(selectedOptions);
    history.push("/postcode");
  };

  // QUESTION 4 - Postcode:

  const handlePostcodeSearchCompleted = (text) => {
    if (text === "Enter your postcode") {
      text = "";
    }
    setPostcode(text);
    history.push("/results");
  };

  return (
    <>
      <Route exact path="/">
        <MultiChoiceQuestion
          optionsList={allNeeds}
          onComplete={handleNeedsCompleted}
          questionTitle="What can we help you with?"
          selected={selectedNeeds}
        />
      </Route>
      <Route exact path="/service-types">
        <MultiChoiceQuestion
          optionsList={allSupportTypes}
          onComplete={handleSupportTypesCompleted}
          questionTitle="What types of support are you looking for?"
          onBackClicked={onBackClicked}
          backgroundToUse="two"
          selected={selectedSupportTypes}
        />
      </Route>
      <Route exact path="/personalise">
        <MultiChoiceQuestion
          optionsList={allPersonalisations}
          onComplete={handlePersonalisationsCompleted}
          questionTitle="Personalise your results"
          onBackClicked={onBackClicked}
          backgroundToUse="three"
          selected={selectedPersonalisations}
        />
      </Route>
      <Route exact path="/postcode">
        <TextBoxQuestion
          onComplete={handlePostcodeSearchCompleted}
          onBackClicked={onBackClicked}
          backgroundToUse="four"
          postcode={postcode}
        />
      </Route>
      <Route exact path="/results">
        <Results
          onBackClicked={onBackClicked}
          selectedNeeds={selectedNeeds}
          selectedSupportTypes={selectedSupportTypes}
          selectedPersonalisations={selectedPersonalisations}
          postcode={postcode}
          charities={charities}
        />
      </Route>
    </>
  );
};

export default withRouter(HomePageContainer);

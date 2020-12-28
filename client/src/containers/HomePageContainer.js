import React, { useEffect, useState } from "react";
import { Route, Switch, withRouter } from "react-router-dom";
import nodeServer from "../api/nodeServer";
import MultiChoiceQuestion from "../components/MultiChoiceQuestion";
import TextBoxQuestion from "../components/TextBoxQuestion";
import Results from "../components/Results";
import { getAppInsights } from "../telemetry/TelemetryService";
import TelemetryProvider from "../telemetry/telemetry-provider";

const HomePageContainer = ({ history }) => {
  const [allNeeds, setAllNeeds] = useState([]);
  const [selectedNeeds, setSelectedNeeds] = useState([]);
  const [needs, setNeeds] = useState([]);

  const [allSupportTypes, setAllSupportTypes] = useState([]);
  const [selectedSupportTypes, setSelectedSupportTypes] = useState([]);

  const [allPersonalisations, setAllPersonalisations] = useState([]);
  const [selectedPersonalisations, setSelectedPersonalisations] = useState([]);

  const [charities, setCharities] = useState([]);

  const [postcode, setPostcode] = useState("");

  let appInsights = getAppInsights();

  const onBackClicked = () => {
    history.goBack();
  };

  const trackEvent = (type, selected) => {
    appInsights.trackEvent({
      page: type,
      selected: selected,
    });
  };

  useEffect(() => {
    getAllOptionsFromServer();
  }, []);

  // QUESTION - 1: Needs

  const getAllOptionsFromServer = () => {
    nodeServer.get("/needs").then((res) => {
      const needsResponse = res.data;
      needsResponse.sort((a, b) => a.Need.localeCompare(b.Need));
      const needs = needsResponse.map((need) => {
        return { value: need.Need, isSelected: false };
      });
      setNeeds(needs);
    });

    nodeServer
      .get("/charities")
      .then((res) => {
        const charities = res.data;
        setCharities(charities);
      })
      .catch((error) => {
        console.log(error);
      });

    nodeServer.get("/types").then((res) => {
      const supportTypesResponse = res.data;

      const uniqueSupportTypes = [
        ...new Set(
          supportTypesResponse.map((supportType) => supportType.UserOption_Type)
        ),
      ];

      setAllSupportTypes(uniqueSupportTypes);
    });

    nodeServer.get("/personalisations").then((res) => {
      const personalisationsResponse = res.data
        .map((personalisation) => personalisation.UserOption)
        .filter((personalisation) => personalisation != "");
      setAllPersonalisations(personalisationsResponse);
    });
  };

  const onToggleNeedSelected = (selectedNeed) => {
    setNeeds(
      [
        ...needs.filter((need) => need != selectedNeed),
        { ...selectedNeed, isSelected: !selectedNeed.isSelected },
      ].sort((a, b) => a.value.localeCompare(b.value))
    );
  };

  const handleNeedsCompleted = () => {
    trackEvent(
      "needs",
      needs.filter((need) => need.isSelected).map((need) => need.value)
    );
    history.push("/service-types");
  };

  //QUESTION 2 - Support Types:

  const handleSupportTypesCompleted = (selectedOptions) => {
    setSelectedSupportTypes(selectedOptions);
    trackEvent("Support Types", selectedOptions);
    history.push("/personalise");
  };

  // QUESTION 3 - Personalisations:
  const handlePersonalisationsCompleted = (selectedOptions) => {
    setSelectedPersonalisations(selectedOptions);
    trackEvent("Personalisations", selectedOptions);
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
      <TelemetryProvider
        instrumentationKey="__instrumentationKey__"
        after={() => {
          appInsights = getAppInsights();
        }}
      >
        <Switch>
          <Route exact path="/">
            <MultiChoiceQuestion
              optionsList={needs}
              onToggleItemSelected={onToggleNeedSelected}
              onComplete={handleNeedsCompleted}
              questionTitle="What can we help you with?"
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
        </Switch>
      </TelemetryProvider>
    </>
  );
};

export default withRouter(HomePageContainer);

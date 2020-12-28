import React, { useEffect, useState } from "react";
import { Route, Switch, withRouter } from "react-router-dom";
import nodeServer from "../api/nodeServer";
import MultiChoiceQuestion from "../components/MultiChoiceQuestion";
import TextBoxQuestion from "../components/TextBoxQuestion";
import Results from "../components/Results";
import { getAppInsights } from "../telemetry/TelemetryService";
import TelemetryProvider from "../telemetry/telemetry-provider";

const HomePageContainer = ({ history }) => {
  const [needs, setNeeds] = useState([]);
  const [supportTypes, setSupportTypes] = useState([]);
  const [personalisations, setPersonalisations] = useState([]);

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
      ].map((supportType) => {
        return { value: supportType, isSelected: false };
      });

      setSupportTypes(uniqueSupportTypes);
    });

    nodeServer.get("/personalisations").then((res) => {
      const personalisationsResponse = res.data
        .map((personalisation) => personalisation.UserOption)
        .filter((personalisation) => personalisation != "");
      const personalisations = personalisationsResponse.map(
        (personalisation) => {
          return { value: personalisation, isSelected: false };
        }
      );
      setPersonalisations(personalisations);
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

  const onToggleSupportTypeSelected = (selectedSupportType) => {
    const indexOfSupportType = supportTypes.findIndex(
      (supportType) => supportType === selectedSupportType
    );
    const startOfArray = supportTypes.slice(0, indexOfSupportType);
    const endOfArray = supportTypes.slice(
      indexOfSupportType + 1,
      supportTypes.length
    );
    setSupportTypes([
      ...startOfArray,
      { ...selectedSupportType, isSelected: !selectedSupportType.isSelected },
      ...endOfArray,
    ]);
  };

  const handleSupportTypesCompleted = () => {
    trackEvent(
      "Support Types",
      supportTypes
        .filter((supportType) => supportType.isSelected)
        .map((supportType) => supportType.value)
    );
    history.push("/personalise");
  };

  // QUESTION 3 - Personalisations:

  const onTogglePersonalisationSelected = (selectedPersonalisation) => {
    const indexOfPersonalisation = personalisations.findIndex(
      (personalisation) => personalisation === selectedPersonalisation
    );
    const startOfArray = personalisations.slice(0, indexOfPersonalisation);
    const endOfArray = personalisations.slice(
      indexOfPersonalisation + 1,
      personalisations.length
    );
    setPersonalisations([
      ...startOfArray,
      {
        ...selectedPersonalisation,
        isSelected: !selectedPersonalisation.isSelected,
      },
      ...endOfArray,
    ]);
  };

  const handlePersonalisationsCompleted = () => {
    trackEvent(
      "Personalisations",
      personalisations
        .filter((personalisation) => personalisation.isSelected)
        .map((personalisation) => personalisation.value)
    );
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
              optionsList={supportTypes}
              onToggleItemSelected={onToggleSupportTypeSelected}
              onComplete={handleSupportTypesCompleted}
              questionTitle="What types of support are you looking for?"
              onBackClicked={onBackClicked}
              backgroundToUse="two"
            />
          </Route>
          <Route exact path="/personalise">
            <MultiChoiceQuestion
              optionsList={personalisations}
              onToggleItemSelected={onTogglePersonalisationSelected}
              onComplete={handlePersonalisationsCompleted}
              questionTitle="Personalise your results"
              onBackClicked={onBackClicked}
              backgroundToUse="three"
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
              needs={needs}
              supportTypes={supportTypes}
              personalisations={personalisations}
              postcode={postcode}
              charities={charities}
              onToggleNeedSelected={onToggleNeedSelected}
              onToggleSupportTypeSelected={onToggleSupportTypeSelected}
              onTogglePersonalisationSelected={onTogglePersonalisationSelected}
            />
          </Route>
        </Switch>
      </TelemetryProvider>
    </>
  );
};

export default withRouter(HomePageContainer);

import React, { useEffect, useState } from "react";
import {
  BrowserRouter as Router,
  Route,
  useHistory,
  withRouter,
} from "react-router-dom";
import nodeServer from "../api/nodeServer";
// import postcodeServer from "../api/postcodeServer"
import GoogleServer from "../api/GoogleServer";
import { IoLogoFacebook } from "react-icons/io";
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

          // returns unique charities
          // const uniqueCharities = this.getUnique(charities)

          // sorts charities alphabetically
          charities.sort((a, b) => a.OrgName.localeCompare(b.OrgName));
          console.log(charities);
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
          console.log(charities);

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

    // filter by type would be called here but I think we should do all that at the end
    // history.push("/service-types");
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
    setPostcode(text);
    history.push("/results");
  };

  const getUnique = (charities) => {
    return Array.from(new Set(charities.map((charity) => charity.OrgName))).map(
      (OrgName) => {
        return charities.find((charity) => charity.OrgName === OrgName);
      }
    );
  };

  // OTHER

  //   async getNationalRating(sortedCharities) {
  //     const finalCharities =[]

  //     await Promise.all(sortedCharities.map(charity => {
  //       if(charity.NationalService === 'YES')
  //       {
  //         if(charity.PlaceID !== ""){
  //           nodeServer.get(`/googleratings/${charity.PlaceID}`).then((res) => {
  //             const rating = res.data.rating
  //             charity.googleRating = rating
  //             finalCharities.push(charity)
  //             this.setState({ finalCharities: finalCharities})
  //           })
  //         }else {
  //           finalCharities.push(charity)
  //             this.setState({ finalCharities: finalCharities})
  //         }
  //       }

  //  }))
  //   }

  // const getRating = async (charities) => {
  //   const finalCharities = [];
  //   await Promise.all(
  //     charities.map((charity) => {
  //       // console.log(charity.PlaceID);
  //       if (charity.PlaceID) {
  //         nodeServer.get(`/googleratings/${charity.PlaceID}`).then((res) => {
  //           const rating = res.data.rating;
  //           // console.log('rating', rating);
  //           charity.googleRating = rating;
  //           finalCharities.push(charity);
  //           this.setState({ finalCharities: finalCharities });
  //         });
  //       } else {
  //         // console.log('fired');
  //         this.setState({ finalCharities: finalCharities });
  //       }
  //     })
  //   );
  // };

  // }
  // async postcodeSearch(APICall) {
  //    await postcodeServer.get(`${APICall}`).then((res => {
  //     (let localPostcodes = res.data)
  //   }))};

  //TODO

  // const nationalCharities = (charities) => {
  //   const national = [];
  //   charities.map((charity) => {
  //     if (charity.NationalService === "YES") {
  //       national.push(charity);
  //     }
  //   });

  //   return national;
  // };

  // const localCharities = (charities, postcode) => {
  //   return charities.map((charity) => {
  //     if (charity.OuterCode.toLowerCase() === postcode.toLowerCase())
  //       return charity;
  //   });
  // };

  // const sortCharities = (postcode) => {
  //   this.setState({ postcode: postcode.postcode });

  //   const fullCharities = this.state.charitiesFilteredByPersonalisations.concat(
  //     this.state.charitiesFilteredByType,
  //     this.state.charityResults
  //   );

  //   if (postcode.postcode === "") {
  //     let nationalCharities = this.nationalCharities(fullCharities);
  //     let uniqueCharities = this.getUnique(nationalCharities);
  //     this.setState({ finalCharities: uniqueCharities });
  //     // this.getRating(uniqueCharities)
  //   } else {
  //     let localCharities = localCharities(
  //       uniqueCharities,
  //       postcode.postcode.slice(0, 4)
  //     );
  //     let uniqueCharities = this.getUnique(localCharities);
  //     this.setState({ finalCharities: uniqueCharities });
  //     // this.getRating(uniqueCharities)
  //   }
  // };

  const filterByPersonalisations = (selected) => {
    if (selected.length === 0) {
      this.setState({
        charitiesFilteredByPersonalisations: this.state.charitiesFilteredByType,
      });
    } else {
      this.setState({ selectedPersonalisations: selected });
      let filteredCharities = [];
      const charities = this.state.charitiesFilteredByType;
      selected.map((personalisation) => {
        charities.map((charity) => {
          if (charity.Personalisation === personalisation) {
            filteredCharities.push(charity);
          }
        });
      });
      filteredCharities.sort((a, b) => a.OrgName.localeCompare(b.OrgName));
      this.setState({ charitiesFilteredByPersonalisations: filteredCharities });
    }
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

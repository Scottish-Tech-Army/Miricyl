import React from "react";
import "./App.css";
import HomePageContainer from "./containers/HomePageContainer";
import { BrowserRouter, useHistory } from "react-router-dom";
import FlagsProvider from "./components/FlagsProvider";

function App() {
  const history = useHistory();

  return (
    <FlagsProvider defaults={{ filter: 0 }}>
      <BrowserRouter>
        <HomePageContainer history={history} />
      </BrowserRouter>
    </FlagsProvider>
  );
}

export default App;

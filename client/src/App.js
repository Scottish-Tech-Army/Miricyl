import React from "react";
import "./App.css";
import HomePageContainer from "./containers/HomePageContainer";
import NavBar from "./components/Navbar";
import { BrowserRouter, useHistory } from "react-router-dom";
import FlagsProvider from "./components/FlagsProvider";

function App() {
  const history = useHistory();

  return (
    <FlagsProvider defaults={{ filter: 0 }}>
      <BrowserRouter>
        <NavBar />
        <HomePageContainer history={history} />
      </BrowserRouter>
    </FlagsProvider>
  );
}

export default App;

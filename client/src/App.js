import React from "react";
import "./App.css";
import HomePageContainer from "./containers/HomePageContainer";
import NavBar from "./components/Navbar";
import { BrowserRouter } from "react-router-dom";
import FlagsProvider from "./components/FlagsProvider";

function App() {
  return (
    <FlagsProvider defaults={{ filter: 0 }}>
      <BrowserRouter>
        <NavBar />
        <HomePageContainer />
      </BrowserRouter>
    </FlagsProvider>
  );
}

export default App;

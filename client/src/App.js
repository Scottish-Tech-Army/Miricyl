import React from "react";
import "./App.css";
import HomePageContainer from "./containers/HomePageContainer";
import NavBar from "./components/Navbar";
import { BrowserRouter } from "react-router-dom";

function App() {
  return (
    <BrowserRouter>
      <NavBar />
      <HomePageContainer />
    </BrowserRouter>
  );
}

export default App;

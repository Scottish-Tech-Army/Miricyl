import React from "react";
import "./App.css";
import HomePageContainer from "./containers/HomePageContainer";
import NavBar from "./components/Navbar";

function App() {
  return (
    <>
      <NavBar />
      <HomePageContainer />
    </>
  );
}

export default App;

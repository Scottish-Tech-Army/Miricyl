import React from "react";
import "../styles/global.css";
import Logo from "../assets/BoostLogo.png";

const NavBar = ({ showHelpButton = true, onHelpButtonPressed }) => {
  return (
    <>
      <div className="navbar-container">
        <div className="navbar-wrapper">
          <div>
            <a href="/">
              <img className="navbar-logo" src={Logo} alt="logo" id="logo" />
            </a>
          </div>

          {showHelpButton && (
            <button
              className="help-button"
              id="help-button"
              onClick={() => onHelpButtonPressed()}
            >
              Help Now!
            </button>
          )}
        </div>
      </div>
    </>
  );
};

export default NavBar;

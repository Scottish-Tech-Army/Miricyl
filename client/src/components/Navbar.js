import React from "react";
import "../styles/global.css";
import Logo from "../assets/BoostLogo.png";

const NavBar = () => {
  return (
    <>
      <div className="navbar-container">
        <div className="navbar-wrapper">
          <div>
            <a href="/">
              <img
                className="navbar-logo"
                src={Logo}
                alt="logo"
                test-id="logo"
              />
            </a>
          </div>

          <button className="help-button" test-id="help-button">
            Help!
          </button>
        </div>
      </div>
    </>
  );
};

export default NavBar;

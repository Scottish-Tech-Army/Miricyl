import React from "react";
import "../styles/global.css";
import Logo from "../assets/BoostLogo.png";

const NavBar = () => {
  return (
    <>
      <div className="navbar-container">
        <div className="navbar-wrapper">
          <div>
            <a href="/" className="navbar-link">
              {/* <img
                className="navbar-logo"
                src={Logo}
                alt="logo"
                test-id="logo"
              /> */}
              <h1 className="navbar-logo">Miricyl</h1>
            </a>

          </div>

          <button className="help-button" id="help-button">
            Help Now!
          </button>
        </div>
      </div>
    </>
  );
};

export default NavBar;

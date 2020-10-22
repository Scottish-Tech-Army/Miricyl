import React from "react";
import "../styles/global.css";
import Logo from "../assets/BoostLogo.png";

const NavBar = () => {

    return (
        <>
        <div className="navbar-container">
            {/* <h1 className="nav-logo">LOGO HERE</h1> */}
            <img className="navbar-logo" src={Logo} alt="logo"/>
            <button className="help-button">Help!</button>

        </div>
        </>
    )
};

export default NavBar;
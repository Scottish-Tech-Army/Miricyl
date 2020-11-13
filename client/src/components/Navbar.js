import React from "react";
import "../styles/global.css";
import Logo from "../assets/BoostLogo.png";

const NavBar = () => {

    return (
        <>
        <div className="navbar-container">
                    
            <div>
            <a href='/'><img className="navbar-logo" src={Logo} alt="logo" /></a>
            </div>
            
            <button className="help-button">Help!</button>

        </div>
        </>
    )
};

export default NavBar;
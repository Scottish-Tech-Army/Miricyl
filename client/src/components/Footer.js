import React from "react";
import "../styles/global.css"

const Footer = () => {
    return (
        <div className="footer-wrapper">
            <p className="footer-feedback-text">Whilst we cannot provide support if you have any comments please email us <a href="mailto:feedback@miricyl.org" target="_blank" className="footer-feedback-link">feedback</a></p>
            <p className="footer-address-text">Miricyl SCIO Charity Number SC047522 Address 2 Eglinton Crescent, Edinburgh, EH12 5DH
    ·       <a href="https://www.miricyl.org/privacy-policy/" target="_blank" className="footer-privacy-link">Privacy Policy - Miricyl</a></p>
        </div>

    );
};

export default Footer;
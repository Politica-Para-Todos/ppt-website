import React from "react";
import PropTypes from 'prop-types';
import SocialIcon from "./SocialIcon";

const SocialSharing = ({ socialMediaList = [], theme }) => {
    return (
        <ul className="social-media-list">
            {socialMediaList.map((social, index) => (
                <li key={index}>
                    <a href={social.url} target="_blank" rel="noopener">
                        <SocialIcon icon={social.type} theme={theme} />
                    </a>
                </li>
            ))}
        </ul >
    );
}

export default SocialSharing;

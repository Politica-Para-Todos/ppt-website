import React from "react";
import PropTypes from 'prop-types';
import SocialIcon from "./SocialIcon";
import socialSharing from "../../social-sharing";

const SocialSharing = () => {
    return (
        <ul className="social-media-list">
            {socialSharing.map((social, index) => (
                <li key={index}>
                    <a href={social.url}>
                        <SocialIcon icon={social.type} />
                    </a>
                </li>
            ))}
        </ul >
    );
}

export default SocialSharing;

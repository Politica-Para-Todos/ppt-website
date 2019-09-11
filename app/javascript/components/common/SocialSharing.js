import React from "react";
import PropTypes from 'prop-types';
import SocialIcon from "./SocialIcon";

const SocialSharing = (props) => {
    const { socialMedia } = props;

    return (
        <ul className="comentar-css-social-media-list">
            {socialMedia && socialMedia.map((social, index) => (
                <li key={index}>
                    <a href={social.url}>
                        <SocialIcon icon={social.type} />
                    </a>
                </li>
            ))}
        </ul >
    );
}

SocialSharing.propTypes = {
    socialMedia: PropTypes.array.isRequired
}

export default SocialSharing;

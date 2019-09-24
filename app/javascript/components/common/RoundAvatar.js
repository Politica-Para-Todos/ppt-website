import React, { PureComponent } from "react";
import PropTypes from 'prop-types';
import Avatar from 'antd/es/avatar';


function RoundAvatar({ imageUrl, title, subtitle, link }) {
    return (
        <a className="avatar-list-item" href={link}>
            <div className="avatar-list-item__content">
                <Avatar size={120} src={imageUrl} icon="user" />
                <h3 className="avatar-list-item__content-title">{title}</h3>
                <h4 className="avatar-list-item__content-subtitle">{subtitle}</h4>
            </div>
        </a>
    )
}

RoundAvatar.propTypes = {
    imageUrl: PropTypes.string,
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string,
}

RoundAvatar.defaultProps = {
    imageUrl: null,
    subtitle: null,
};
export default RoundAvatar;

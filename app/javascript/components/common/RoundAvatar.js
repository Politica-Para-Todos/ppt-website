import React, { PureComponent } from "react";
import PropTypes from 'prop-types';
import Avatar from 'antd/es/avatar';


function RoundAvatar({ imageUrl, title, subtitle }) {
    return (
        <div className="avatar-list-item">
            <Avatar size={180} src={imageUrl} icon="user" />
            <h3 className="avatar-list-item__title">{title}</h3>
            <h4 className="avatar-list-item__subtitle">{subtitle}</h4>
        </div>
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

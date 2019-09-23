import React, { PureComponent } from "react";
import PropTypes from 'prop-types';
import Avatar from 'antd/es/avatar';


function RoundAvatar({ imageUrl, title, acronym }) {
    return (
        <a class="avatar-list-item" href={`party/${acronym}`}>
            <div className="avatar-list-item__content">
                <Avatar size={120} src={imageUrl} icon="user" />
                <h4 className="avatar-list-item__content-title">{acronym}</h4>
                <h3 className="avatar-list-item__content-subtitle">{title}</h3>
            </div>
        </a>
    )
}

RoundAvatar.propTypes = {
    imageUrl: PropTypes.string,
    title: PropTypes.string.isRequired,
    acronym: PropTypes.string,
}

RoundAvatar.defaultProps = {
    imageUrl: null,
    acronym: null,
};
export default RoundAvatar;

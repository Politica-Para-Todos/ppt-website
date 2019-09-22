import React, { PureComponent } from "react";
import PropTypes from 'prop-types';
import Avatar from 'antd/es/avatar';


function RoundAvatar({ logo, title, acronym }) {
    return (
      <a href={`party/${acronym}`}>
        <div className="avatar-list-item">
            <Avatar size={120} src={logo} icon="user" />
            <h3 className="avatar-list-item__title">{title}</h3>
            <h4 className="avatar-list-item__subtitle">{acronym}</h4>
        </div>
      </a>
    )
}

RoundAvatar.propTypes = {
    logo: PropTypes.string,
    title: PropTypes.string.isRequired,
    acronym: PropTypes.string,
}

RoundAvatar.defaultProps = {
    logo: null,
    acronym: null,
};
export default RoundAvatar;

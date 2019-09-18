import React, { Fragment } from "react";
import PropTypes from 'prop-types';
import RoundAvatar from "./RoundAvatar";
import { slugify } from "../../utils";

function AvatarList({ items, theme }) {
    return (
        <div className="avatar-list-container" className={`avatar-list-container avatar-list-container--${theme}`}>
            {items.map((data) => (
                <RoundAvatar key={slugify(data.title)} {...data} />
            ))}
        </div>
    )
}

AvatarList.propTypes = {
    items: PropTypes.array.isRequired,
    theme: PropTypes.string,
}

AvatarList.defaultProps = {
    theme: 'row'
};
export default AvatarList;

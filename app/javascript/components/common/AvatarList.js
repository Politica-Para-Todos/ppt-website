/*
Copyright 2019 Politica para Todos

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import React from "react";
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

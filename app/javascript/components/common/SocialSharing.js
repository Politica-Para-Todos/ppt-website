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
import SocialIcon from "./SocialIcon";

function getHrefFromUrl(type, url) {
    if (type === 'email') {
        return `mailto:${url}`;
    }

    return url;
}

const SocialSharing = ({ socialMediaList = [], theme }) => {
    return (
        <ul className="social-media-list">
            {socialMediaList.map((social, index) => (
                <li key={index}>
                    <a href={getHrefFromUrl(social.type, social.url)} target="_blank" rel="noopener">
                        <SocialIcon icon={social.type} theme={theme} />
                    </a>
                </li>
            ))}
        </ul >
    );
}

export default SocialSharing;

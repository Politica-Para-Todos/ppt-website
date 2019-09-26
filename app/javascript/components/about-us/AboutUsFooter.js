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
import { Link } from 'react-router-dom';
import { Layout } from "antd";
import SocialSharing from "../common/SocialSharing";
import socialSharing from "../../social-sharing";
import vertical_logo from "../../../assets/images/vertical_logo.jpg";

const Footer = Layout.Footer;

export default function AboutUsFooter() {
    return (
        <Footer className="about-us-footer footer">
            <SocialSharing socialMediaList={socialSharing} />
            <Link to="/">
                <img className="footer_logo" src={vertical_logo} />
            </Link>
        </Footer>
    );
}

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

import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import SocialSharing from "./SocialSharing";
import ContributorsList from "./ContributorsList";
import socialSharing from "../../social-sharing";
import horizontal_logo from "../../../assets/images/horizontal_logo.svg";

const Footer = Layout.Footer;

class LayoutFooter extends PureComponent {
    render() {
        return (
            <Footer className="footer">
                <div>
                    <SocialSharing socialMediaList={socialSharing} />
                    <img className="footer_logo" src={horizontal_logo} />
                </div>
                <div className="footer-info">
                    <h2>Quem Somos</h2>
                    <p>Podes consultar <a target="_blank"
                    rel="noopener" href="https://www.loomio.org/g/ZqT2uPv6/politica-para-todos">aqui</a> todo o histórico do projecto.</p>
                    <br />
                    <ContributorsList />
                </div>
            </Footer>
        );
    }
}

export default LayoutFooter;

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

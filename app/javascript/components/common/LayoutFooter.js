import React, { PureComponent } from "react";
import { Link } from 'react-router-dom';
import { Layout, Row, Col } from "antd";
import SocialSharing from "./SocialSharing";
import ContributorsList from "./ContributorsList";
import socialSharing from "../../social-sharing";
import vertical_logo from "../../../assets/images/vertical_logo.jpg";

const Footer = Layout.Footer;

class LayoutFooter extends PureComponent {
    render() {

        return (
            <Footer className="footer">
                <Row type="flex" justify="space-between">
                    <Col span={24} lg={6}>
                        <SocialSharing socialMediaList={socialSharing} />
                        <Link to="/">
                            <img className="footer_logo" src={vertical_logo} />
                        </Link>
                    </Col>
                    <Col span={24} lg={12} className="footer-info">
                        <h2>Quem Somos</h2>
                        <p>Podes consultar <a target="_blank"
                            rel="noopener" href="https://www.loomio.org/g/ZqT2uPv6/politica-para-todos">aqui</a> todo o histórico do projecto.</p>
                        <br />
                        <ContributorsList />
                    </Col>
                </Row>
            </Footer>
        );
    }
}

export default LayoutFooter;

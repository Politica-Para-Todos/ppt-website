import React, { PureComponent } from "react";
import { Layout, Row, Col } from "antd";
import Menu from 'antd/es/menu';
import { Link } from 'react-router-dom';
import { HashLink } from 'react-router-hash-link';
import SocialSharing from './SocialSharing';
import socialSharing from "../../social-sharing";
import horizontal_logo from "../../../assets/images/horizontal_logo.svg";

const Header = Layout.Header;

class LayoutHeader extends PureComponent {
    render() {
        return (
            <Header className="header">
                <Row type="flex" justify="space-between" align="middle">
                    <Col span={24} lg={24}>
                        <Link to="/">
                            <img className="header_logo" src={horizontal_logo} />
                        </Link>
                        <Menu mode="horizontal">
                            <Menu.Item key="1">
                                <Link to="/">Home</Link>
                            </Menu.Item>
                            <Menu.Item key="2">
                                <HashLink to="/#parties-section">Partidos</HashLink>
                            </Menu.Item>
                        </Menu>
                        <a
                            className="header-join-us"
                            href="https://www.loomio.org/g/ZqT2uPv6/politica-para-todos"
                            target="_blank"
                            rel="noopener"
                        >
                            Junta-te a Nós!
                    </a>
                        <div className="header-social-media">
                            <SocialSharing socialMediaList={socialSharing} />
                        </div>
                    </Col>
                </Row>
            </Header>
        );
    }
}

export default LayoutHeader;

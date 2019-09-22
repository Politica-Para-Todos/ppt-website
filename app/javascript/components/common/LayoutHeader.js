import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
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
                <img className="header_logo" src={horizontal_logo} />
                <Menu
                    mode="horizontal"
                >
                    <Menu.Item key="1">
                        <Link to="/">Home</Link>
                    </Menu.Item>
                    <Menu.Item key="2">
                        <HashLink to="/#parties-section">Partidos</HashLink>
                    </Menu.Item>
                </Menu>
                <a className="header-join-us" href="https://www.loomio.org/g/ZqT2uPv6/politica-para-todos">Junta-te a Nós!</a>
                <div className="header-social-media">
                    <SocialSharing socialMediaList={socialSharing} />
                </div>
            </Header>
        );
    }
}

export default LayoutHeader;

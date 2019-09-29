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

import React, { PureComponent, Fragment } from "react";
import { Layout, Row, Col, Drawer, Button } from "antd";
import Menu from 'antd/es/menu';
import { Link } from 'react-router-dom';
import { HashLink } from 'react-router-hash-link';
import SocialSharing from './SocialSharing';
import socialSharing from "../../social-sharing";
import horizontal_logo from "../../../assets/images/horizontal_logo.svg";
import burger_image from "../../../assets/images/burger.svg";
import { disableBodyScroll, enableBodyScroll, clearAllBodyScrollLocks } from 'body-scroll-lock';
const Header = Layout.Header;

class LayoutHeader extends PureComponent {
    state = { visible: false };

    componentDidMount() {
        this.updateMenuVisibility();
        this.targetElement = document.querySelector('.header__mobile-menu ul');
        //getSocial 
        const po = document.createElement("script"); 
        po.type = "text/javascript"; 
        po.async = true;
        po.src = "https://api.at.getsocial.io/get/v1/3404615d/gs_async.js";
        
        document.body.appendChild(po);
        window.addEventListener("resize", this.updateMenuVisibility.bind(this));
    }

    componentWillUnmount() {
        window.removeEventListener("resize", this.updateMenuVisibility.bind(this));
    }

    updateMenuVisibility() {
        if (window.innerWidth >= 992) {
            this.setState({
                visible: false,
            });
            enableBodyScroll(this.targetElement);
        }
    }

    showDrawer = () => {
        this.setState({
            visible: true,
        });
        disableBodyScroll(this.targetElement);
    };

    closeDrawer = () => {
        this.setState({
            visible: false,
        });
        enableBodyScroll(this.targetElement);
    };

    render() {
        const { visible } = this.state;

        return (
            <Fragment>
                <Header className="header">
                    <Row type="flex" justify="space-between" align="middle">
                        <Col span={24} lg={24}>
                            <Link to="/">
                                <img className="header_logo" src={horizontal_logo} />
                            </Link>

                            <Button className={"header__mobile-burger" + (visible ? " header__mobile-burger--open" : "")} type="primary" onClick={this.showDrawer}>
                                <img className="header_logo" src={burger_image} />
                            </Button>

                            <div className="header__desktop-menu">
                                <Menu mode="horizontal">
                                    <Menu.Item>
                                        <Link to="/" onClick={this.closeDrawer}>Home</Link>
                                    </Menu.Item>
                                    <Menu.Item onClick={this.closeDrawer}>
                                        <HashLink smooth to="/#parties-section" onClick={this.closeDrawer}>Partidos</HashLink>
                                    </Menu.Item>
                                    <Menu.Item>
                                        <Link to="/about-us" onClick={this.closeDrawer}>Quem Somos</Link>
                                    </Menu.Item>
                                </Menu>
                                <a
                                    className="header-join-us"
                                    href="https://www.loomio.org/g/ZqT2uPv6/politica-para-todos"
                                    target="_blank"
                                    rel="noopener"
                                >Junta-te a Nós!</a>
                                <div className="header-social-media">
                                    <SocialSharing socialMediaList={socialSharing} />
                                </div>
                            </div>
                        </Col>
                    </Row>
                    <Drawer
                        className="header__mobile-menu"
                        placement="right"
                        closable={false}
                        onClose={this.closeDrawer}
                        visible={this.state.visible}
                        getContainer={false}
                        style={{ position: 'absolute' }}
                    >
                        <Menu mode="vertical">
                            <Menu.Item>
                                <Link to="/" onClick={this.closeDrawer}>Home</Link>
                            </Menu.Item>
                            <Menu.Item>
                                <HashLink to="/#parties-section" onClick={this.closeDrawer}>Partidos</HashLink>
                            </Menu.Item>
                            <Menu.Item>
                                <Link to="/about-us" onClick={this.closeDrawer}>Quem Somos</Link>
                            </Menu.Item>
                        </Menu>
                        <a
                            className="header-join-us"
                            href="https://www.loomio.org/g/ZqT2uPv6/politica-para-todos"
                            target="_blank"
                            rel="noopener"
                        >Junta-te a Nós!</a>
                        <div className="header-social-media">
                            <SocialSharing socialMediaList={socialSharing} theme="#666" />
                        </div>
                    </Drawer>
                </Header>
            </Fragment >
        );
    }
}

export default LayoutHeader;

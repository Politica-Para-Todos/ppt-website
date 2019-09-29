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
import { Link } from 'react-router-dom'
import { Menu } from 'antd';
import Media from 'react-media';
const { SubMenu } = Menu;

class ManifestoSider extends PureComponent {
    constructor() {
        super()
        this.state = {}
    }

    render() {
        const { sections, party_acronym, section_id, selectedKey, openKey, ...props } = this.props;

        return (
            <Fragment>
                <Media query="(max-width: 768px)" render={() => (
                    <Menu
                        mode="inline"
                        defaultSelectedKeys={selectedKey}
                        defaultOpenKeys={openKey}
                        style={{ height: '100%', borderRight: 0 }}
                    >
                        <SubMenu
                            key="mobile-menu"
                            title="Capítulos"
                            className="section-mobile__chapter"
                        >
                            {sections && sections.map(section => {
                                if (section.subsections.length > 0) {
                                    return (
                                        <SubMenu
                                            key={`section-mobile-${section.id}`}
                                            title={section.title}
                                            className={`section-mobile-${section.id}`}
                                        >
                                            {section.subsections && section.subsections.map(subsection => {
                                                return (
                                                    <Menu.Item key={`section-mobile-${subsection.id}`} className={`section-${subsection.id}`}>
                                                        <Link to={`/party/${encodeURIComponent(party_acronym)}/manifesto/${subsection.id}`}>{subsection.title}</Link>
                                                    </Menu.Item>
                                                )
                                            })}
                                        </SubMenu>
                                    )
                                } else {
                                    return (
                                        <Menu.Item key={`section-mobile-${section.id}`}>
                                            <Link to={`/party/${encodeURIComponent(party_acronym)}/manifesto/${section.id}`}>{section.title}</Link>
                                        </Menu.Item>
                                    )
                                }
                            })}
                        </SubMenu>
                    </Menu >
                )} />
                <Media query="(min-width: 769px)" render={() => (
                    <Menu
                        mode="inline"
                        defaultSelectedKeys={selectedKey}
                        defaultOpenKeys={openKey}
                        style={{ height: '100%', borderRight: 0 }}
                    >
                        {sections && sections.map(section => {
                            if (section.subsections.length > 0) {
                                return (
                                    <SubMenu
                                        key={`section-${section.id}`}
                                        title={section.title}
                                        className={`section-${section.id}`}
                                    >
                                        {section.subsections && section.subsections.map(subsection => {
                                            return (
                                                <Menu.Item key={`section-${section.id}`} className={`section-${subsection.id}`}>
                                                    <Link to={`/party/${encodeURIComponent(party_acronym)}/manifesto/${subsection.id}`}>{subsection.title}</Link>
                                                </Menu.Item>
                                            )
                                        })}
                                    </SubMenu>
                                )
                            } else {
                                return (
                                    <Menu.Item key={`section-${section.id}`}>
                                        <Link to={`/party/${encodeURIComponent(party_acronym)}/manifesto/${section.id}`}>{section.title}</Link>
                                    </Menu.Item>
                                )
                            }
                        })}
                    </Menu >
                )} />
            </Fragment>
        );
    }
}

export default ManifestoSider;

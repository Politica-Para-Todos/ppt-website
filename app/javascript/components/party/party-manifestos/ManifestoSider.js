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

    renderMenuItem(id, title, party_acronym) {
        return (
            <Menu.Item key={id} className={`section-${id}`}>
                <Link to={`/party/${encodeURIComponent(party_acronym)}/manifesto/${id}`}>{title}</Link>
            </Menu.Item>
        );
    }

    renderMenuSubitems(subsections, party_acronym) {
        if (!subsections) {
            return null;
        }

        return subsections.map(({ id, title}) => {
            return this.renderMenuItem(id, title, party_acronym);
        });
    }

    renderMenuItems() {
        const { sections, party_acronym } = this.props;

        if (!sections) {
            return null;
        }

        return sections.map(section => {
            if (Array.isArray(section.subsections) && section.subsections.length > 0) {
                return (
                    <SubMenu
                        key={section.id}
                        title={section.title}
                        className={`section-mobile-${section.id}`}
                    >
                        {this.renderMenuSubitems(section.subsections, party_acronym)}
                    </SubMenu>
                )
            } else {
                return this.renderMenuItem(section.id, section.title, party_acronym);
            }
        })
    }

    render() {
        const { section_id, selectedKey, openKey } = this.props;

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
                          {this.renderMenuItems()}  
                        </SubMenu>
                    </Menu>
                )} />
                <Media query="(min-width: 769px)" render={() => (
                    <Menu
                        mode="inline"
                        defaultSelectedKeys={selectedKey}
                        defaultOpenKeys={openKey}
                        style={{ height: '100%', borderRight: 0 }}
                    >
                        {this.renderMenuItems()}
                    </Menu>
                )} />
            </Fragment>
        );
    }
}

export default ManifestoSider;

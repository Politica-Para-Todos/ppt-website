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
import { Link } from 'react-router-dom'
import { Menu } from 'antd';

const { SubMenu } = Menu;

class ProgramSider extends PureComponent {
    constructor() {
        super()
        this.state = {}
    }

    _renderMenuItem(id, title, party_acronym) {
        return (
            <Menu.Item key={id} className={`section-${id}`}>
                <Link to={`/party/${encodeURIComponent(party_acronym)}/manifesto/${id}`}>{title}</Link>
            </Menu.Item>
        )
    }
    _renderSubMenu(section, party_acronym) {
        const subsections = section.subsections || [];

        return (
            <SubMenu
                key={section.id}
                title={section.title}
                className={`section-${section.id}`}
            >
                {subsections.map(({ id, title }) => this._renderMenuItem(id, title, party_acronym))}
            </SubMenu>
        );
    }

    _renderMenuItems() {
        const party_acronym = this.props.party_acronym;
        const sections = this.props.sections || [];

        return sections.map(section => {
            if (section.subsections.length > 0) {
                return this._renderSubMenu(section, party_acronym);
            } else {
                return this._renderMenuItem(section.id, section.title, party_acronym);
            }
        });
    }
    render() {
        const { section_id, selectedKey, openKey, ...props } = this.props;

        return (
            <Menu
                mode="inline"
                defaultSelectedKeys={selectedKey}
                defaultOpenKeys={openKey}
                style={{ height: '100%', borderRight: 0 }}
            >
                {this._renderMenuItems()}
            </Menu>
        );
    }
}

export default ProgramSider;

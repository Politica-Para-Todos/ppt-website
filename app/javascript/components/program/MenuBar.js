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
import { Menu, Icon } from 'antd';

const { SubMenu } = Menu;

class MenuBar extends PureComponent {

    constructor() {
      super()
      this.state = {

      }
    }

    render() {
      const { sections, party_acronym, section_id, selectedKey, openKey, ...props } = this.props;

      return (
        <Menu
          mode="inline"
          defaultSelectedKeys={selectedKey}
          defaultOpenKeys={openKey}
          style={{ height: '100%', borderRight: 0 }}
        >
          {sections.map( (section, idx) => {
            if (section.subsections.length > 0) {
                return <SubMenu
                  key={section.id}
                  title={<span>{section.title}</span>}
                >
                {section.subsections.map( (subsection, idx) => {
                    return <Menu.Item key={subsection.id}>
                      <Link to={`/program/${party_acronym}/${subsection.id}`}>{subsection.title}</Link>
                    </Menu.Item>
                })}
              </SubMenu>
            } else {
              return <Menu.Item key={section.id}>
                <Link to={`/program/${party_acronym}/${section.id}`}>{section.title}</Link>
              </Menu.Item>
            }
          })}
        </Menu>
      );
    }
}

export default MenuBar;

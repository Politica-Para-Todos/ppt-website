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
                      <Link to={`/manifesto/${party_acronym}/${subsection.id}`}>{subsection.title}</Link>
                    </Menu.Item>
                })}
              </SubMenu>
            } else {
              return <Menu.Item key={section.id}>
                <Link to={`/manifesto/${party_acronym}/${section.id}`}>{section.title}</Link>
              </Menu.Item>
            }
          })}
        </Menu>
      );
    }
}

export default MenuBar;

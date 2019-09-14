import React, { PureComponent } from "react";
import { Link } from 'react-router-dom'
import { Menu, Icon } from 'antd';
const { SubMenu } = Menu;

export default class MenuBar extends PureComponent {

    constructor() {
      super()
      this.state = {

      }
    }

    render() {
      const { sections } = this.props;
      const { selectedSection } = this.props;
      const { selectedSubSection } = this.props;

      return (
        <Menu
          mode="inline"
          defaultSelectedKeys={[selectedSection]}
          defaultOpenKeys={[selectedSubSection]}
          style={{ width: 256 }}
        >
          {sections.map( (section, idx) => {
            if (section.subsections.length > 0) {
                return <SubMenu
                  key={section.id}
                  title={
                    <span>
                      <span>{section.title}</span>
                    </span>
                  }
                >
                {section.subsections.map( (subsection, idx) => {
                    return <Menu.Item key={subsection.id}>{subsection.title}</Menu.Item>
                })}
              </SubMenu>
            } else {
              return <Menu.Item key={section.id}>{section.title}</Menu.Item>
            }
          })}
        </Menu>
      );
    }
}

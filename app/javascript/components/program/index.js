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
import Layout from 'antd/es/layout';
const Sider = Layout.Sider;
import LayoutHeader from "../common/LayoutHeader";
import LayoutFooter from "../common/LayoutFooter";
import MenuBar from "./MenuBar";
import Section from "./Section";

class Program extends PureComponent {

    constructor() {
      super()
      this.state = {
          title: "",
          sections: [],
          items: []
      }
    }

    getItems() {
      if (this.props.match.params.section_id) {
        return fetch("/manifesto_sections/" + this.props.match.params.section_id + ".json")
        .then(res => res.json())
        .then(data => data.items)
        .catch((error) => {
            console.log(error);
        });
      }

      return []
    }

    getProgramData() {
      return fetch("/parties/" + encodeURIComponent(this.props.match.params.party_acronym) + "/manifesto.json")
      .then(res => res.json())
      .catch((error) => {
        console.log(error);
    });
    }

    componentDidMount() {
        var promise1 = this.getItems()
        var promise2 = this.getProgramData()

        Promise.all([promise1, promise2]).then((results) => {
          const [ items, data ] = results;

          this.setState({
            title: data.title,
            sections: data.sections,
            items: items
          });
        });
    }

    getSectionContent() {
      if (this.props.match.params.section_id) {
        return <Section
          section_id={this.props.match.params.section_id}
          items={this.state.items}
        />
      } else {
        return <div> introduction </div>
      }
    }

    getSelectedKey(sections, section_id) {
      return section_id ? [section_id] : []
    }

    getOpenKey(sections, section_id) {
      var openKey = []
      sections.forEach(function(section) {
        if (section.subsections.length > 0) {
          section.subsections.forEach(function(subsection) {
            if (subsection.id.toString() === section_id) {
              openKey = [section.id.toString()]
            }
          })
        }
      })

      return openKey
    }

    render() {
        let sections = this.state.sections;
        let section_id = this.props.match.params.section_id;

        return (
          <Layout>
            <LayoutHeader />
            <Layout>
              <Sider width={200}>
                <MenuBar
                  sections={sections}
                  party_acronym={this.props.match.params.party_acronym}
                  section_id={section_id}
                  selectedKey={this.getSelectedKey(sections, section_id)}
                  openKey={this.getOpenKey(sections, section_id)}//{["71"]}
                />
              </Sider>
              <Layout.Content>
                <div>{this.state.title}</div>
                <div>{this.getSectionContent()}</div>
              </Layout.Content>
            </Layout>
            <LayoutFooter />
          </Layout>
        );
    }
}

export default Program;

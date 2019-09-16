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

    componentDidMount() {
        var items = []

        if (this.props.match.params.section_id) {
          fetch("/manifesto_sections/" + this.props.match.params.section_id + ".json")
          .then(res => res.json())
          .then((data) => {
              items = data.items
          })
          .catch(console.log)
        }

        fetch("/parties/" + this.props.match.params.party_acronym + "/manifesto.json")
        .then(res => res.json())
        .then(data => {
          this.setState({
            ...this.state,
            title: data.title,
            sections: data.sections,
            items: items
          })
        })
        .catch(console.log)
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

      console.log(openKey)
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

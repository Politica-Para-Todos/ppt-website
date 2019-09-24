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
                .catch(console.log)
        }

        return []
    }

    getProgramData() {
        return fetch("/parties/" + this.props.match.params.party_acronym + "/manifesto.json")
            .then(res => res.json())
            .catch(console.log)
    }

    componentDidMount() {
        var promise1 = this.getItems()
        var promise2 = this.getProgramData()

        Promise.all([promise1, promise2]).then((results) => {
            const [items, data] = results;

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
        sections.forEach(function (section) {
            if (section.subsections.length > 0) {
                section.subsections.forEach(function (subsection) {
                    if (subsection.id.toString() === section_id) {
                        openKey = [section.id.toString()]
                    }
                })
            }
        })

        return openKey
    }

    render() {
        const sections = this.state.sections;
        const section_id = this.props.match.params.section_id;

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
                        <div className="container">
                            <div>{this.state.title}</div>
                            <div>{this.getSectionContent()}</div>
                        </div>
                    </Layout.Content>
                </Layout>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default Program;

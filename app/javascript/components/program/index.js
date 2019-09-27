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
import Layout from 'antd/es/layout';
const Sider = Layout.Sider;
import LayoutHeader from "../common/LayoutHeader";
import LayoutFooter from "../common/LayoutFooter";
import ProgramSider from "./ProgramSider";
{/* import ProgramSection from "./ProgramSection"; */}

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
        const { section_id } = this.props.match.params;

        if (section_id) {
            return fetch(`/manifesto_sections/${section_id}.json`)
                .then(res => res.json())
                .then(data => data.items)
                .catch((error) => {
                    console.log(error);
                });
        }

        return []
    }

    getProgramData() {
        const { party_acronym } = this.props.match.params;

        return fetch(`/parties/${encodeURIComponent(party_acronym)}/manifesto.json`)
            .then(res => res.json())
            .catch((error) => {
                console.log(error);
            });
    }

    componentDidMount() {
        const itemsPromise = this.getItems()
        const programDataPromise = this.getProgramData()

        Promise.all([itemsPromise, programDataPromise]).then((results) => {
            const [items, data] = results;

            this.setState({
                title: data.title,
                sections: data.sections,
                items: items
            });
        });
    }

    getSelectedKey(sections, section_id) {
        return section_id ? [section_id] : null
    }

    getOpenKey(sections, section_id) {
        let openKey = []
        sections.forEach((section) => {
            if (section.subsections.length > 0) {
                section.subsections.forEach((subsection) => {
                    if (subsection.id.toString() === section_id) {
                        openKey = [section.id.toString()]
                    }
                })
            }
        })

        return openKey.length ? openKey : null
    }

    render() {
        const { sections, title, items } = this.state;
        const { section_id, party_acronym } = this.props.match.params;

        return (
            <Layout className="party-program">
                <LayoutHeader />
                <Layout>
                    <Sider width={200} className="party-program-sider">
                        {sections.length && (
                            <ProgramSider
                                sections={sections}
                                party_acronym={party_acronym}
                                section_id={section_id}
                                selectedKey={this.getSelectedKey(sections, section_id)}
                                openKey={this.getOpenKey(sections, section_id)}
                            />
                        )}
                    </Sider>
                    <Layout.Content>
                        {/* <ProgramSection title={title} items={items} section_id={section_id} /> */}
                    </Layout.Content>
                </Layout>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default Program;

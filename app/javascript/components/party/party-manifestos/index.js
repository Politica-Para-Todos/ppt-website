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
import MetaTags from "../../MetaTags";
import LayoutHeader from "../../common/LayoutHeader";
import LayoutFooter from "../../common/LayoutFooter";
import ManifestoSider from "./ManifestoSider";
import ManifestoSection from "./ManifestoSection";
import PartyHeader from "../PartyHeader";
import { slugify } from "../../../utils";

class PartyManifesto extends PureComponent {
    constructor() {
        super()
        this.state = {
            title: "",
            sections: [],
            section: undefined,
            party: {}
        }
    }

    getItems() {
        const { section_id } = this.props.match.params;

        if (section_id) {
            return fetch(`/manifesto_sections/${section_id}.json`)
                .then(res => res.json())
                .catch((error) => {
                    console.log(error);
                });
        }

        return []
    }

    getManifestoData() {
        const { party_acronym } = this.props.match.params;

        // party_acronym is already encoded
        return fetch(`/parties/${party_acronym}/manifesto.json`)
            .then(res => res.json())
            .catch((error) => {
                console.log(error);
            });
    }

    getParty() {
        const { party_acronym } = this.props.match.params;

        // party_acronym is already encoded
        return fetch(`/parties/${party_acronym}.json`)
            .then(res => res.json())
            .catch((error) => {
                console.log(error);
            });
    }

    componentDidMount() {
        const itemsPromise = this.getItems()
        const manifestoDataPromise = this.getManifestoData()
        const partyPromise = this.getParty()

        Promise.all([itemsPromise, manifestoDataPromise, partyPromise]).then((results) => {
            const [section, manifesto, party] = results;

            this.setState({
                title: manifesto.title,
                sections: manifesto.sections,
                section: section,
                party: party
            });
        });
    }

    getSelectedKey(sections, section_id) {
        return section_id ? [section_id] : []
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

        return openKey.length ? openKey : [];
    }

    render() {
        const { sections, title, section, party } = this.state;
        const { section_id, party_acronym } = this.props.match.params;

        return (
            <Layout className="party-manifesto">
                {party.name && (
                    <MetaTags
                        pageTitle={`Programa Eleitoral - ${party.name}`}
                        pageDescription={party.description}
                        pageTitle={`Programa Eleitoral - ${party.name}`}
                        socialDescription={party.description}
                        socialImage={`/images/shareable-images/banner-${slugify(party.acronym)}.jpg`}
                    />
                )}
                <LayoutHeader />
                <Layout.Content>
                    <PartyHeader
                        party={party}
                        subtitle={`${party.acronym} - Programa`}
                    />
                    <Layout>
                        <Sider width={400} className="party-manifesto-sider">
                            {sections.length && (
                                <ManifestoSider
                                    sections={sections}
                                    party_acronym={party_acronym}
                                    section_id={section_id}
                                    selectedKey={this.getSelectedKey(sections, section_id)}
                                    openKey={this.getOpenKey(sections, section_id)}
                                />
                            )}
                        </Sider>
                        <Layout.Content>
                            {section && (
                                <ManifestoSection title={title} section={section} section_id={section_id} />
                            )}
                        </Layout.Content>
                    </Layout>
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default PartyManifesto;

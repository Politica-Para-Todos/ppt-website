import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import LayoutHeader from "../../common/LayoutHeader";
import LayoutFooter from "../../common/LayoutFooter";
import PartyHeader from "../PartyHeader";
import PartyIntro from "../PartyIntro";
import PartyCandidatesTable from "./PartyCandidatesTable";
import { Typography } from "antd";

const { Paragraph } = Typography;

class PartyCandidate extends PureComponent {
    constructor() {
        super();

        this.state = {
            party: {
                leadCandidate: {}
            },
        }
    }

    componentDidMount() {
        fetch("/parties/" + this.props.match.params.party_acronym + "/candidates/" + this.props.match.params.district + ".json")
            .then(res => res.json())
            .then(data => {
                this.setState({
                    party: data
                })
            })
            .catch((error) => {
                console.log(error);
            });
    }

    render() {
        const { party } = this.state;

        return (
            <Layout>
                <LayoutHeader />
                <Layout.Content>
                    <PartyHeader party={party} subtitle={`${party.acronym} - Distrito de ${this.props.match.params.district}`} isManifestoPage={true} />
                    <PartyIntro spokesperson={party.leadCandidate} title={party.leadCandidate.name}>
                        <Paragraph className="party-desc">{party.leadCandidate.biography}</Paragraph>
                        <Paragraph>Biografia: <a href={party.leadCandidate.biography_source} target="_blank" rel="noopener">aqui</a></Paragraph>
                    </PartyIntro>
                    {party.candidates && (
                        <PartyCandidatesTable candidates={party.candidates} />
                    )}
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default PartyCandidate;

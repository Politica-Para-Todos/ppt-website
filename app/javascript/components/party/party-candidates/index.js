import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import MetaTags from "../../MetaTags";
import LayoutHeader from "../../common/LayoutHeader";
import LayoutFooter from "../../common/LayoutFooter";
import PartyHeader from "../PartyHeader";
import PartyIntro from "../PartyIntro";
import PartyCandidatesTable from "./PartyCandidatesTable";
import { slugify } from "../../../utils";
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
                {party.name && (
                    <MetaTags
                        pageTitle={`${party.name} - Círculo eleitoral de ${this.props.match.params.district}`}
                        pageDescription={`Informações sobre o ${party.name} no círculo eleitoral de ${this.props.match.params.district}`}
                        socialTitle={`${party.name} - Círculo eleitoral de ${this.props.match.params.district}`}
                        socialDescription={`Informações sobre o ${party.name} no círculo eleitoral de ${this.props.match.params.district}`}
                        socialImage={`../images/share/banner-${slugify(party.acronym)}.jpg`}
                    />
                )}
                <LayoutHeader />
                <Layout.Content>
                    <PartyHeader party={party} subtitle={`${party.acronym} - Círculo eleitoral de ${this.props.match.params.district}`} />
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

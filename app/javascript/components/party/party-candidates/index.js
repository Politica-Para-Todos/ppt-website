import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import LayoutHeader from "../../common/LayoutHeader";
import LayoutFooter from "../../common/LayoutFooter";
import PartyHeader from "../PartyHeader";
import PartyIntro from "../PartyIntro";
import PartyCandidatesTable from "./PartyCandidatesTable";
import { Typography } from "antd";

const { Paragraph } = Typography;

const spokesperson = {
    name: "Carlos Manuel",
    responsibility: "Representante do Partido na Plataforma"
};

class PartyCandidates extends PureComponent {
    constructor() {
        super();

        this.state = {
            party: {},
            spokesperson: {}
            // TODO: Fetch spokesperson data from API
        }
    }

    componentDidMount() {
        fetch("/parties/" + this.props.match.params.id + ".json")
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
                    <PartyHeader party={party} />
                    {spokesperson && (
                        <PartyIntro title={spokesperson.name} spokesperson={spokesperson}>
                            <Paragraph>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
                                lobortis eros sit amet lorem tincidunt, a bibendum elit eleifend.
                                Quisque gravida odio ac eros varius dictum. Donec lectus mauris,
                                congue id placerat et, commodo ac sem. Curabitur consectetur ut ipsum
                                ut placerat. Cras dictum gravida nisi, eu gravida dolor semper in.
                                Vestibulum ultricies libero sit amet porta auctor. Interdum et
                                malesuada fames ac ante ipsum primis in faucibus. Duis scelerisque
                                lobortis cursus. Aenean eleifend pharetra tempor. Praesent quis odio
                                ipsum.
                            </Paragraph>
                            <Paragraph>
                                Donec et fermentum est, eu sollicitudin urna. Suspendisse cursus
                                pulvinar hendrerit. Aenean eleifend, augue in bibendum bibendum, justo
                                nisi faucibus.
                        </Paragraph>
                        </PartyIntro>
                    )}
                    {party.candidates && (
                        <PartyCandidatesTable candidates={party.candidates} />
                    )}
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default PartyCandidates;

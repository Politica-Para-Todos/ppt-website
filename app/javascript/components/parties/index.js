import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import LayoutHeader from "../common/LayoutHeader";
import LayoutFooter from "../common/LayoutFooter";
import PartiesFilter from "./PartiesFilter";
import PartiesList from "./PartiesList";

class Parties extends PureComponent {
    constructor() {
        super();
        this.state = {
            parties: [
                {
                    title: "SDP1",
                    subtitle: "Sigla do Partido 1",
                    avatarUrl: null,
                    programID: 1,
                },
                {
                    title: "SDP2",
                    subtitle: "Sigla do Partido 2",
                    avatarUrl: 'https://cdn-std.droplr.net/files/acc_682319/Qv5k0y',
                    programID: 1,
                },
                {
                    title: "SDP1",
                    subtitle: "Sigla do Partido 1",
                    avatarUrl: null,
                    programID: 1,
                },
                {
                    title: "SDP1",
                    subtitle: "Sigla do Partido 1",
                    avatarUrl: null,
                    programID: 1,
                },
                {
                    title: "SDP1",
                    subtitle: "Sigla do Partido 1",
                    avatarUrl: null,
                    programID: 1,
                },
                {
                    title: "SDP1",
                    subtitle: "Sigla do Partido 1",
                    avatarUrl: null,
                    programID: 1,
                }
            ]
        }
    }

    render() {
        const { parties } = this.state;
        return (
            <Layout>
                <LayoutHeader />
                <Layout.Content>
                    <PartiesFilter />
                    <PartiesList parties={parties} />
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default Parties;

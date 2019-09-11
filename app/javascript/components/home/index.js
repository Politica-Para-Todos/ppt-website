import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import LayoutHeader from "../common/LayoutHeader";
import LayoutFooter from "../common/LayoutFooter";
import HomeMission from "./HomeMission";
import HomePartiesList from "./HomePartiesList";
import HomeMovement from "./HomeMovement";

class Home extends PureComponent {
    constructor() {
        super();
        this.state = {
            items: [
                {
                    title: "SDP1",
                    subtitle: "Sigla do Partido 1"
                },
                {
                    title: "SDP2",
                    subtitle: "Sigla do Partido 2"
                }
            ]
        }
    }

    render() {
        const { items } = this.state;
        return (
            <Layout>
                <LayoutHeader />
                <Layout.Content>
                    <HomeMission />
                    <HomePartiesList items={items} />
                    <HomeMovement items={items} />
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default Home;

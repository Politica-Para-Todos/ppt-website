import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import LayoutHeader from "../common/LayoutHeader";
import LayoutFooter from "../common/LayoutFooter";
import HomeMission from "./HomeMission";
import HomePartiesList from "./HomePartiesList";
import HomeMovement from "./HomeMovement";
import PARTIES_LIST from '../../dummy-parties';

class Home extends PureComponent {
    constructor() {
        super();
    }

    render() {
        return (
            <Layout>
                <LayoutHeader />
                <Layout.Content>
                    <HomeMission />
                    <HomePartiesList parties={PARTIES_LIST} />
                    <HomeMovement />
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default Home;

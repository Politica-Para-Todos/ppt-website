import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import LayoutHeader from "../common/LayoutHeader";
import LayoutFooter from "../common/LayoutFooter";
import HomeMission from "./HomeMission";
import HomePartiesList from "./HomePartiesList";
import HomeMovement from "./HomeMovement";
import PARTIES_LIST from '../../dummy-parties';
import { shuffleArray } from '../../utils';

class Home extends PureComponent {
    constructor() {
        super();

        this.state = {
            parties: shuffleArray(PARTIES_LIST)
        }
    }

    render() {
        const { parties } = this.state;

        return (
            <Layout>
                <LayoutHeader />
                <Layout.Content>
                    <HomeMission />
                    <HomePartiesList parties={parties} />
                    <HomeMovement />
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default Home;

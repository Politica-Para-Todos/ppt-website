import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import LayoutHeader from "../common/LayoutHeader";
import LayoutFooter from "../common/LayoutFooter";
import HomeMission from "./HomeMission";
import HomeCountdown from "./HomeCountdown";
import HomePartiesList from "./HomePartiesList";
import HomeMotivation from "./HomeMotivation";
import { shuffleArray } from '../../utils';
import HomeInitialWarning from "./HomeInitialWarning";

class Home extends PureComponent {
    constructor() {
        super();

        this.state = {
            parties: []
        }
    }

    componentDidMount() {
        fetch("parties.json")
            .then(res => res.json())
            .then(data =>
                this.setState({
                    parties: shuffleArray(data.map(function (x) {
                        return {
                            'imageUrl': x.logo,
                            'title': x.acronym,
                            'subtitle': x.title,
                            'link': `party/${x.acronym}`
                        }
                    }))
                })
            )
            .catch(console.log)
    }

    render() {
        const { parties } = this.state;

        return (
            <Layout>
                <LayoutHeader />
                <Layout.Content>
                    <HomeInitialWarning />
                    <HomeMission />
                    <HomeCountdown />
                    <HomePartiesList parties={parties} />
                    <HomeMotivation />
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default Home;

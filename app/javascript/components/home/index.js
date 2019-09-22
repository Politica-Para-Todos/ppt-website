import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import LayoutHeader from "../common/LayoutHeader";
import LayoutFooter from "../common/LayoutFooter";
import HomeMission from "./HomeMission";
import HomePartiesList from "./HomePartiesList";
import HomeMovement from "./HomeMovement";
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
          parties: shuffleArray(data)
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
                    <HomePartiesList parties={parties} />
                    <HomeMovement />
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default Home;

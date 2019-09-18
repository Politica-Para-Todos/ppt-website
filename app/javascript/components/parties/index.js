import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import LayoutHeader from "../common/LayoutHeader";
import LayoutFooter from "../common/LayoutFooter";
import PartiesFilter from "./PartiesFilter";
import PartiesList from "../common/PartiesList";
import PARTIES_LIST from '../../dummy-parties';

class Parties extends PureComponent {
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
                    <section className="section-parties">
                        <PartiesFilter />
                        <AvatarList items={parties} theme={"column"} />
                    </section>
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default Parties;

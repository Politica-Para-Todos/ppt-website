/*
Copyright 2019 Politica para Todos

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

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
                    parties: data.map(x => {
                        return {
                            'imageUrl': x.logo,
                            'title': x.acronym,
                            'subtitle': x.title,
                            'link': `party/${encodeURIComponent(x.acronym)}`
                        }
                    })
                })
            )
            .catch((error) => {
                console.log(error);
            });
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
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default Home;

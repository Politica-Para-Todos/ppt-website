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
import Header from "./Header";
import Intro from "./Intro";
import Metrics from "./metrics";
import Candidates from "./Candidates";

export default class Party extends PureComponent {
    constructor() {
        super();

        this.state = {
            party: {
                candidates: []
            }
        }
    }

    componentDidMount() {
        fetch("/parties/" + this.props.match.params.id + ".json")
            .then(res => res.json())
            .then(data =>
                this.setState({
                    party: data
                })
            )
            .catch(console.log)
    }

    render() {
        const { party } = this.state;

        return (
            <Layout>
                <LayoutHeader />
                <Layout.Content className="party-section">
                    <Header party={party} />
                    <Intro party={party} />
                    <Candidates candidates={party.candidates} circles={circles} />
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        )
    }
}

const thematics = [
    {
        value: 10,
        icon: "build",
        color: "green"
    },
    {
        value: 30,
        icon: "build",
        color: "yellow"
    },
    {
        value: 20,
        icon: "build",
        color: "red"
    },
    {
        value: 25,
        icon: "build",
        color: "blue"
    },
    {
        value: 15,
        icon: "build",
        color: "gray"
    }
];

const analytics = {
    words: "310K",
    views: "310K",
    reading: "302 min",
    comments: "3.5K"
};

const circles = [
    {
        value: "all",
        label: "All"
    },
    {
        value: "acores",
        label: "Açores"
    },
    {
        value: "aveiro",
        label: "Aveiro"
    },
    {
        value: "beja",
        label: "Beja"
    },
    {
        value: "braga",
        label: "Braga"
    },
    {
        value: "bragança",
        label: "Bragança"
    },
    {
        value: "castelo-branco",
        label: "Castelo Branco"
    },
    {
        value: "coimbra",
        label: "Coimbra"
    },
    {
        value: "evora",
        label: "Évora"
    },
    {
        value: "europa",
        label: "Europa"
    },
    {
        value: "faro",
        label: "Faro"
    },
    {
        value: "fora-da-europa",
        label: "Fora da europa"
    },
    {
        value: "guarda",
        label: "Guarda"
    },
    {
        value: "leiria",
        label: "Leiria"
    },
    {
        value: "lisboa",
        label: "Lisboa"
    },
    {
        value: "madeira",
        label: "Madeira"
    },
    {
        value: "portalegre",
        label: "Portalegre"
    },
    {
        value: "porto",
        label: "Porto"
    },
    {
        value: "santarem",
        label: "Santarém"
    },
    {
        value: "setubal",
        label: "Setúbal"
    },
    {
        value: "viana-do-castelo",
        label: "Viana do Castelo"
    },
    {
        value: "vila-real",
        label: "Vila Real"
    },
    {
        value: "viseu",
        label: "Viseu"
    }
];

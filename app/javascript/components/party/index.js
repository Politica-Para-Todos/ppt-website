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
    render() {
        return (
            <Layout>
                <LayoutHeader />
                <Layout.Content>
                    <div className="party-section">
                        <Header party={party} />
                        <Intro party={party} />
                    </div>
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        )
    }
}

  const party = {
    name: "Partido Fictício Português",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lobortis eros sit amet lorem tincidunt, a bibendum elit eleifend. Quisque gravida odio ac eros varius dictum. Donec lectus mauris, congue id placerat et, commodo ac sem. Curabitur consectetur ut ipsum ut placerat. Cras dictum gravida nisi, eu gravida dolor semper in. Vestibulum ultricies libero sit amet porta auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis scelerisque lobortis cursus. Aenean eleifend pharetra tempor. Praesent quis odio ipsum.",
    acronym: "PFP",
    url: "https://www.partido.pt",
    spokesperson: "Carlos Manuel",
    socialMedia: [
        {
            type: 'twitter',
            url: 'https://twitter.com/politicaparatds'
        },
        {
            type: 'facebook',
            url: 'http://fb.me/politicaparatodos.pt'
        },
        {
            type: 'medium',
            url: 'https://medium.com/politica-para-todos'
        },
        {
            type: 'email',
            url: 'mailto:contacto@politicaparatodos.pt'
        }
    ]
  };

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
      value: "faro",
      label: "Faro"
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

  const candidates = [
    {
      name: "Rui Macedo",
      circle: {
        id: "lisboa",
        name: "Lisboa"
      },
      biography: "Lorem Ipsum"
    },
    {
      name: "Rui Macedo",
      circle: {
        id: "acores",
        name: "Açores"
      },
      biography: "Lorem Ipsum"
    },
    {
      name: "Rui Macedo",
      circle: {
        id: "leiria",
        name: "Leiria"
      },
      biography: "Lorem Ipsum"
    },
    {
      name: "Rui Macedo",
      circle: {
        id: "lisboa",
        name: "Lisboa"
      },
      biography: "Lorem Ipsum"
    },
    {
      name: "Rui Macedo",
      circle: {
        id: "leiria",
        name: "Leiria"
      },
      biography: "Lorem Ipsum"
    },
    {
      name: "Rui Macedo",
      circle: {
        id: "lisboa",
        name: "Lisboa"
      },
      biography: "Lorem Ipsum"
    },
    {
      name: "Rui Macedo",
      circle: {
        id: "lisboa",
        name: "Lisboa"
      },
      biography: "Lorem Ipsum"
    }
  ];

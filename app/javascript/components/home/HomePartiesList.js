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
import { Row, Col, Switch, Select } from "antd";
import AvatarList from "../common/AvatarList";
import { shuffleArray, sortArrayByKey } from '../../utils';

const { Option } = Select;

class HomePartiesList extends PureComponent {
    constructor(props) {
        super(props);
        this.state = {
            parties: [],
            ordered: false,
            circle: "all"
        }
    }

    onChange = (checked) => {
        this.setState({ ordered: checked });
    }

    updateCircle = value => {
        const circle = value || "all";
        this.setState({ circle });
    };

    componentDidMount() {
        fetch("parties.json")
            .then(res => res.json())
            .then(data =>
                this.setState({
                    parties: data.map(function (x) {
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
        let { parties } = this.state;
        let { ordered } = this.state;

        if (ordered) {
            parties = sortArrayByKey(parties, 'title');
        } else {
            parties = shuffleArray(parties);
        };
        return (
            <section id="parties-section" className="section-home-parties-list section--grey">
                <Row>
                    <Col span={24} lg={24}>
                        <p className="home-parties-list_disclaimer">
                            A ordem dos partidos a seguir é feita de forma aleatória.
                            <br />
                            Sempre que voltares a carregar esta página a ordem será diferente.
                        </p>
                        <Row >
                            <Col span={8}>
                                <h2>Lista de Partidos</h2>
                            </Col>
                            <Col lg={7} span={24} className="party-candidates__circles">
                                <Select
                                    style={{ width: "100%" }}
                                    placeholder="Escolha o Círculo Eleitoral"
                                    onChange={this.updateCircle}
                                >
                                    {circles.map((circle) => (
                                        <Option key={circle.value} value={circle.value}>{circle.label}</Option>
                                    ))}
                                </Select>
                            </Col>
                            <Col span={8} offset={8}>
                                <div className="home-alphaetic-order"  >
                                    <Switch className="home-alpha-order-switch"
                                        size="small"
                                        onChange={this.onChange}
                                    />  Ordenar alfabeticamente</div>
                            </Col>
                        </Row>
                        <AvatarList items={parties} theme={"4x3"} />
                    </Col>
                </Row>
            </section>
        );
    }
}

const circles = [
    {
        value: "all",
        label: "Todos"
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
        value: "braganca",
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


export default HomePartiesList;

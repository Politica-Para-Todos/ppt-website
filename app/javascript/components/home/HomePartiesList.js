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
import { Row, Col, Switch } from "antd";
import AvatarList from "../common/AvatarList";
import { shuffleArray, sortArrayByKey } from '../../utils';

class HomePartiesList extends PureComponent {
    constructor(props) {
        super(props);
        this.state = {
            ordered: false
        }
    }

    onChange = (checked) => {
        this.setState({ ordered: checked });
    }

    render() {
        let { parties } = this.props;
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
                            <Col span={8} offset={8}>
                                <div  className="home-alphaetic-order"  >
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

export default HomePartiesList;

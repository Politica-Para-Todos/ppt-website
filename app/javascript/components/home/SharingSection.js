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
import { Row, Col, Card, Divider } from "antd";
import share_me from "../../../assets/images/share_me.png";

class SharingSection extends PureComponent {
    constructor(props) {
        super(props);
        this.state = {
        }
    }

    render() {
        return (
            <section>
                <Row type="flex" justify="center">
                    <Col>
                        <h2>Apela ao voto informado</h2>
                    </Col>
                </Row>
                <Row type="flex" justify="center">
                    <Col span={12}>
                        <Card
                            hoverable
                            style={{ width: "100%" }}
                            cover={<img alt="example" src={share_me} />}
                        >
                            <Divider />
                     {/*            <p>Eu já me informei para votar, e tu?</p>
                                <p>Dia 6 de Outubro vou votar nas Eleições Legislativas.</p>
                                <p>Informa-te também em www.politicaparatodos.pt e exerce o teu dever de voto de forma informada.</p>
                            <Divider /> */}
                            <div className="getsocial gs-inline-group"></div>
                        </Card>

                    </Col>
                </Row>
            </section>
        );
    }
}

export default SharingSection;

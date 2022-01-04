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
import { Row, Col } from "antd";
import infographic from "../../../assets/images/infographic.svg";

class HomeMission1 extends PureComponent {
    render() {
        return (
            <section className="home-our-mission">
                <Row type="flex" justify="space-between" align="middle">
                    <Col span={24} md={{ offset: 4, span: 16 }} lg={{ offset: 0, span: 10 }} className="home-our-mission-text">
                        <h2>A nossa missão</h2>
                        <p>Promover a participação activa dos cidadãos nos processos eleitorais em Portugal.</p>
                    </Col>
                    <Col span={24} lg={10} className="home-our-mission-img">
                        <img src={infographic} />
                    </Col>
                </Row>
            </section>
        );
    }
}

class HomeMission2 extends PureComponent {
    render() {
        return (
            <section className="home-our-mission home-our-mission-border" >
                <Row type="flex" justify="space-between" align="middle">
                    <Col span={24} lg={24} className="home-our-mission-text">
                        <p>Aproximam-se as <b>Eleições Legislativas de 30 de janeiro de 2022</b> e o Política Para Todos, enquanto grupo de cidadãos independentes, decidiu dar continuidade ao trabalho iniciado nas Eleições Legislativas de 2019.</p>
                        <br />
                        <p>Estamos a trabalhar para reunir o máximo de informação relevante sobre as diferentes candidaturas: programa eleitoral, lista de candidatos em cada círculo eleitoral, dados relevantes sobre os cabeças de lista e contactos.</p>
                        <br />
                        <p>Esperamos que seja útil para promover decisões informadas e conscientes. Estamos disponíveis através das nossas redes sociais ou em contacto@politicaparatodos.pt.</p>
                    </Col>
                </Row>
            </section>
        );
    }
}

export { HomeMission1, HomeMission2 };

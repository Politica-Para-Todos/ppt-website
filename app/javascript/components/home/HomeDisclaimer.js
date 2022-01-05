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
import { Row, Col, Alert } from "antd";

class HomeDisclaimer extends PureComponent {
    render() {
        return (
            <section className="home-disclaimer">
                <Row type="flex" justify="space-between" align="middle">
                    <Col span={24} lg={24} className="home-our-mission-text">
                        <Alert
                            message="Atenção"
                            description="Neste momento, a plataforma PPT ainda se encontra com os dados de 2019. Estamos a trabalhar para disponibilizar a informação sobre as Legislativas 2022 durante os próximos dias. Obrigado."
                            type="info"
                        />
                    </Col>
                </Row>
            </section>
        );
    }
}

export default HomeDisclaimer;
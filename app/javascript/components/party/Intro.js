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

import React from "react";
import { Row, Col, Typography, Avatar } from "antd";

const { Title, Paragraph } = Typography;

const Intro = ({ party }) => (
    <section className="party-intro">
        <Row>
            <Col span={24} lg={17}>
                <Title level={2}>Descrição do Partido</Title>
                {party.description}
                <p>Fonte: <a href={party.description_source} target="_blank" rel="noopener">Wikipedia</a></p>
            </Col>
            {/* <Col span={24} lg={7} className="party-intro__spokesperson">
          <Avatar size={160} icon="user" />
          <Title level={3}>{party.spokesperson}</Title>
          <Paragraph strong>Representante do Partido na Plataforma</Paragraph>
          </Col> */}
        </Row>
    </section>
);

export default Intro;

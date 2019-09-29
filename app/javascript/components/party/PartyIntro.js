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

const PartyIntro = ({ title, spokesperson, children }) => (
    <section className="party-intro">
        <Row>
            <Col md={{ offset: 4, span: 16 }} lg={{ offset: 0, span: 16 }}>
                <Title level={2}>{title}</Title>
                <div className="party-intro__text">
                    {children}
                </div>
            </Col>
            {spokesperson && (<Col span={24} lg={8} className="party-intro__spokesperson">
                <Avatar size={160} src={spokesperson.photo} icon="user" />
                <Title className="party-intro__spokesperson-name" level={3}>{spokesperson.name}</Title>
                <Paragraph className="party-intro__spokesperson-description">{spokesperson.responsibility}</Paragraph>
            </Col>
            )}
        </Row>
    </section>
);

export default PartyIntro;

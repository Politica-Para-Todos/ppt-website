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
import { Layout, Row, Col, Typography, Divider, Avatar, Button } from "antd";
import SocialSharing from "../common/SocialSharing";

const { Title, Paragraph } = Typography;

const Header = ({ party }) => (
    <section className="party-header">
        <Row>
            <Col span={24}>
                <Title>{party.name}</Title>
                <Divider />
                <Paragraph strong>{party.acronym}</Paragraph>
            </Col>
        </Row>
        <Row type="flex" justify="center">
            <Col>
                <Avatar size={120} src={party.logo} icon="user" />
            </Col>
        </Row>
        {/* <Row type="flex" justify="center">
        <Col>
          <Button className="button--grey">Ver Programa</Button>
        </Col>
        </Row> */}
        <Row type="flex" justify="end" align="middle">
            <a href={party.website} rel="noopener" target="_blank">{party.website}</a>
            <SocialSharing socialMediaList={party.socialMedia} theme={"#c4c4c4"} />
        </Row>
    </section>
);

export default Header;

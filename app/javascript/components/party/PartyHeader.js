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
import { Row, Col, Typography, Divider, Avatar, Button } from "antd";
import SocialSharing from "../common/SocialSharing";
import partyProgram from "./party_programs.json";

const { Title, Paragraph } = Typography;

function getPartyProgram(acronym) {
    const programLink = partyProgram[acronym];

    if (!programLink) {
        return (
            <p>
                Este partido não apresentou programa eleitoral. <br />
                Para qualquer correção entra em contacto connosco via <a href="mailto:contacto@politicaparatodos.pt">e-mail.</a>
            </p>
        );
    }

    return (
        <Button className="button--grey">
            <a href={programLink} target="_blank" rel="noopener">
                Ver Programa
            </a>
        </Button>
    );
}
const PartyHeader = ({ party, subtitle }) => (
    <section className="party-header">
        <Row>
            <Col span={24}>
                <Title>{party.name}</Title>
                <Divider />
                <Paragraph strong>{subtitle}</Paragraph>
            </Col>
        </Row>
        <Row type="flex" justify="center">
            <Col>
                <Avatar size={200} src={party.logo} icon="user" />
            </Col>
        </Row>
        <Row type="flex" justify="center">
        <Col>
          {getPartyProgram(party.acronym)}
        </Col>
        </Row>
        <Row type="flex" justify="end" align="middle" className="party-header__social">
            <a href={party.website} rel="noopener" target="_blank">{party.website}</a>
            <SocialSharing socialMediaList={party.socialMedia} theme={"#c4c4c4"} />
        </Row>
    </section>
);

export default PartyHeader;

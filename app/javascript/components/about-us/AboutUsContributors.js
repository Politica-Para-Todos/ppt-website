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
import { Row, Col } from "antd";
import { shuffleArray } from "../../utils";
import contributorsList from "../../contributors-list";

export default function AboutUsContributors() {
    return (
        <section className="about-us-contributors">
            <Row type="flex" justify="space-between" align="middle">
                <Col span={24}>
                    <h2 className="about-us-contributors-title">Quem Somos</h2>
                    <p>A comunidade Política Para Todos nasceu no verão de 2019 com o objetivo de promover a participação ativa dos cidadãos nos processos eleitorais em Portugal. É composta por voluntários de várias partes do país e diferentes áreas profissionais. Adotamos princípios de transparência radical na nossa forma de trabalho: toda a comunicação interna está disponível numa plataforma aberta , as reuniões são gravadas e também de acesso livre. A adesão à comunidade é aberta para qualquer cidadão.</p>
                    <p>Podes consultar <a target="_blank" rel="noopener" href="https://www.loomio.org/g/ZqT2uPv6/politica-para-todos">aqui</a> todo o histórico do projecto.</p>
                    <p className="about-us-contributors-list">{shuffleArray(contributorsList).join(", ")}.</p>
                </Col>
            </Row>
        </section >
    )
}

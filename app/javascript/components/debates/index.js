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
import { Layout, Icon, Row, Col, Alert, Table, Card } from 'antd';
import MetaTags from "../MetaTags";
import LayoutHeader from "../common/LayoutHeader";
import LayoutFooter from "../common/LayoutFooter";

import { columns, data } from "./debates";

export default function Debates() {
    return (
        <Layout>
            <MetaTags
                pageTitle="Debates Legislativas 2022"
                pageDescription="A comunidade Política Para Todos nasceu no verão de 2019 com o objetivo de promover a participação ativa dos cidadãos nos processos eleitorais em Portugal. É composta por voluntários de várias partes do país e diferentes áreas profissionais."
                socialTitle="Debates Legilativas 2022"
                socialDescription="A comunidade Política Para Todos nasceu no verão de 2019 com o objetivo de promover a participação ativa dos cidadãos nos processos eleitorais em Portugal. É composta por voluntários de várias partes do país e diferentes áreas profissionais."
                socialImage="/images/share/banner-PPT.jpg"
            />
            <LayoutHeader />
            <Layout.Content>
                <section className="debates">
                    <Row type="flex" justify="space-between" align="middle">
                        <Col span={24} lg={24} className="home-our-mission-text">
                            <Alert
                                message="Atenção"
                                description="Esta é a programação conhecida de momento. A agenda poderá ser alterada pelos partidos e televisões."
                                type="info"
                            />
                        </Col>
                    </Row>
                    <Row type="flex" justify="space-between" align="middle" className="debates_list">
                        <Col span={24} lg={24} className="home-our-mission-text">
                            <h1>Debates televisivos</h1>
                            <p>Participam nos debates televisivos todos os partidos que, nas últimas eleições Legislativas (2019), conquistaram lugares parlamentares em várias rondas frente a frente. No final, ainda serão realizados dois debates com todos os partidos eleitos em 2019 (televisão e rádio) e outro com partidos não eleitos há dois anos.</p>
                            <p>Subscreve o nosso calendário com horários dos debates actualizados: <a target="_blank" rel="noreferrer" rel="noopener" href="https://bit.ly/debates22-PPT">Calendário Google de debates 2022 <Icon type="link" /></a></p>
                            <Table dataSource={data} columns={columns} className="debates__table" />
                            <Card title="Perdeste um debate?">
                                <p>A RTP Play disponibiliza todos os debates independentemente do canal que tenha exibido. Aproveita para rever o debate que procuras:</p>
                                <ul>
                                    <li>
                                        <a href="https://www.rtp.pt/play/p9711/legislativas-2022-debates-rtp" target="_blank" rel="noreferrer" rel="noopener">Debates RTP/RTP3 <Icon type="link" /></a>
                                    </li>
                                    <li>
                                        <a href="https://www.rtp.pt/play/p9787/legislativas-2022-debates-sic-sic-noticias" target="_blank" rel="noreferrer" rel="noopener">Debates SIC/SIC Notícias <Icon type="link" /></a>
                                    </li>
                                    <li>
                                        <a href="https://www.rtp.pt/play/p9788/legislativas-2022-debates-tvi-cnn" target="_blank" rel="noreferrer" rel="noopener">Debates TVI/CNN Portugal <Icon type="link" /></a>
                                    </li>
                                    <li>
                                        <a href="https://www.rtp.pt/play/p9596/eleicoes-legislativas-2022-entrevistas-lideres-partidarios" target="_blank" rel="noreferrer" rel="noopener">Entrevista a lideres partidários <Icon type="link" /></a>
                                    </li>
                                </ul>
                            </Card>
                        </Col>
                    </Row>
                </section>
            </Layout.Content>
            <LayoutFooter />
        </Layout>
    );
}

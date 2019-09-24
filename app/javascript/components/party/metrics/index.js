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
import { Layout, Row, Col, Typography, Button } from "antd";
import Chart from "./chart";
import Summary from "./summary.js";
const { Title } = Typography;

const Metrics = ({ thematics, analytics }) => (
  <Layout>
    <Layout.Content className="metrics">
      <Row>
        <Col span={24}>
          <Title level={2}>Programa do Partido e Métricas</Title>
        </Col>
      </Row>
      <Row>
        <Col span={24} className="metrics__container">
          <Title level={3}>Distribuição Tématica do Programa</Title>
          <Chart>
            {thematics.map((thematic, index) => (
              <Chart.Line
                key={index}
                color={thematic.color}
                icon={thematic.icon}
                percentage={thematic.value}
              />
            ))}
          </Chart>
          <Summary>
            <Summary.Data title="Número de Palavras" value={analytics.words} />
            <Summary.Data title="Número de Views" value={analytics.views} />
            <Summary.Data
              title="Minutos de Leitura"
              value={analytics.reading}
            />
            <Summary.Data title="Comentários" value={analytics.comments} />
          </Summary>
          <Button
            className="button--generic"
            type="primary"
            size="large"
            href="#"
          >
            Ver Programa
          </Button>
        </Col>
      </Row>
    </Layout.Content>
  </Layout>
);

export default Metrics;

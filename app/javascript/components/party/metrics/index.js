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

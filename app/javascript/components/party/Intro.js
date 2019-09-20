import React from "react";
import { Layout, Row, Col, Typography, Avatar } from "antd";

const { Title, Paragraph } = Typography;

const Intro = ({ party }) => (
  <Layout>
    <Layout.Content className="party-intro">
      <Row>
        <Col span={24} lg={17}>
          <Title level={2}>Descrição do Partido</Title>
          {party.description}
        </Col>
        {/* <Col span={24} lg={7} className="party-intro__spokesperson">
          <Avatar size={160} icon="user" />
          <Title level={3}>{party.spokesperson}</Title>
          <Paragraph strong>Representante do Partido na Plataforma</Paragraph>
          </Col> */}
      </Row>
    </Layout.Content>
  </Layout>
);

export default Intro;
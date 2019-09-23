import React from "react";
import { Layout, Row, Col, Typography, Divider, Avatar, Button } from "antd";
import SocialSharing from "../common/SocialSharing";

const { Title, Paragraph } = Typography;

const Header = ({ party }) => (
  <Layout>
    <Layout.Header className="party-header">
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
        <Col>
            <a href={party.website} rel="noopener" target="_blank">{party.website}</a>
        </Col>
        <Col>
          <SocialSharing socialMediaList={party.socialMedia} theme={"#c4c4c4"}/>
        </Col>
      </Row>
    </Layout.Header>
  </Layout>
);

export default Header;

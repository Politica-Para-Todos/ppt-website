import React from "react";
import { Layout, Row, Col, Typography, Avatar } from "antd";

const { Title, Paragraph } = Typography;

const CandidateIntro = ({ spokesperson, children }) => (
    <Layout>
        <Layout.Content className="intro">
            <Row>
                <Col span={24} lg={16}>
                    <Title level={2}>{spokesperson.name}</Title>
                    {children}
                </Col>
                <Col span={24} lg={8} className="spokesperson">
                    <Avatar size={160} icon="user" />
                    <Title className="spokesperson-name" level={3}>{spokesperson.name}</Title>
                    <Paragraph className="spokesperson-description">{spokesperson.responsibility}</Paragraph>
                </Col>
            </Row>
        </Layout.Content>
    </Layout>
);

export default CandidateIntro;

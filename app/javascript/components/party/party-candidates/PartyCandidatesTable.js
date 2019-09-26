import React from "react";
import { Row, Col, Typography, List } from "antd";

const { Title } = Typography;

const PartyCandidatesTable = ({ candidates }) => {
    // TODO: When endpoint is ready, we will need to .filter() the data
    // const mainCandidates = candidates.filter(is_lead_candidate === true);
    // const secondaryCandidates = candidates.filter(is_lead_candidate === false);
    const candidatesNames = [];

    candidates.map(value => {
        candidatesNames.push(value.name)
    });

    return (
        <section className="party-candidates-table">
            <div className="party-candidates-table__list">
                <Row>
                    <Col span={24}>
                        <Title level={3}>Lista Principal</Title>
                    </Col>
                    <Col span={24}>
                        <List
                            bordered={false}
                            dataSource={candidatesNames}
                            renderItem={item => <List.Item>{item}</List.Item>}
                            className="party-candidates-table__items"
                        />
                    </Col>
                </Row>
            </div>
            <div className="party-candidates-table__list">
                <Row>
                    <Col span={24}>
                        <Title level={3}>Lista de Suplentes</Title>
                    </Col>
                    <Col span={24}>
                        <List
                            bordered={false}
                            dataSource={candidatesNames}
                            renderItem={item => <List.Item>{item}</List.Item>}
                            className="party-candidates-table__items"
                        />
                    </Col>
                </Row>
            </div>
        </section>
    )
};

export default PartyCandidatesTable;

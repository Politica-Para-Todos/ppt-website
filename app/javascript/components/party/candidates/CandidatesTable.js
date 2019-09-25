import React from "react";
import { Row, Col, Typography, List } from "antd";

const { Title } = Typography;

const CandidatesTable = ({ candidates }) => {
    const mainCandidates = candidates.filter(is_lead_candidate === true);
    const secondaryCandidates = candidates.filter(is_lead_candidate === false);

    return (
        <section className="candidates-table">
            <div className="candidates-table__list">
                <Row>
                    <Col span={24}>
                        <Title level={3}>Lista Principal</Title>
                    </Col>
                    <Col span={24}>
                        <List
                            bordered={false}
                            dataSource={candidates.main}
                            renderItem={mainCandidates => <List.Item>{candidate}</List.Item>}
                            className="candidates-table__items"
                        />
                    </Col>
                </Row>
            </div>
            <div className="candidates-table__list">
                <Row>
                    <Col span={24}>
                        <Title level={3}>Lista de Suplentes</Title>
                    </Col>
                    <Col span={24}>
                        <List
                            bordered={false}
                            dataSource={candidates.alternates}
                            renderItem={secondaryCandidates => <List.Item>{candidate}</List.Item>}
                            className="candidates-table__items"
                        />
                    </Col>
                </Row>
            </div>
        </section>
    )
};

export default CandidatesTable;

import React from "react";
import { Row, Col, Typography, List } from "antd";
import { sortArrayByKey } from '../../../utils';

const { Title } = Typography;

const PartyCandidatesTable = ({ candidates }) => {
  console.log(candidates)
    const mainCandidates = sortArrayByKey(candidates.filter(c => c.type === "main"), "position");
    const secondaryCandidates = sortArrayByKey(candidates.filter(c => c.type === "secundary"), "position");

    return (
        <section className="party-candidates-table">
            <div className="party-candidates-table__list">
                <Row>
                    <Col span={24}>
                        <Title level={3}>Efetivos</Title>
                    </Col>
                    <Col span={24}>
                        <List
                            bordered={false}
                            dataSource={mainCandidates}
                            renderItem={item => <List.Item>{`${item.position} - ${item.name}`}</List.Item>}
                            className="party-candidates-table__items"
                        />
                    </Col>
                </Row>
            </div>
            <div className="party-candidates-table__list">
                <Row>
                    <Col span={24}>
                        <Title level={3}>Suplentes</Title>
                    </Col>
                    <Col span={24}>
                        <List
                            bordered={false}
                            dataSource={secondaryCandidates}
                            renderItem={item => <List.Item>{`${item.position} - ${item.name}`}</List.Item>}
                            className="party-candidates-table__items"
                        />
                    </Col>
                </Row>
            </div>
        </section>
    )
};

export default PartyCandidatesTable;

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
import PropTypes from "prop-types";
import { Row, Col, Typography, Select, Avatar } from "antd";

const { Title, Paragraph } = Typography;
const { Option } = Select;

class PartyCandidatesList extends React.Component {
    static propTypes = {
        candidates: PropTypes.array
    }

    static defaultProps = {
        candidates: []
    }

    constructor(props) {
        super(props);
        this.state = {
            circle: "all"
        };
    }

    updateCircle = value => {
        const circle = value || "all";
        this.setState({ circle });
    };

    render() {
        const { circles, candidates } = this.props;

        return (
            <section className="party-candidates">
                <Row>
                    <Col lg={17} span={24}>
                        <Title level={2}>Cabeças de Lista</Title>
                    </Col>
                    <Col lg={7} span={24} className="party-candidates__circles">
                        <Select
                            style={{ width: "100%" }}
                            placeholder="Escolha o Círculo Eleitoral"
                            onChange={this.updateCircle}
                        >
                            {circles.map((circle) => (
                                <Option key={circle.value} value={circle.value}>{circle.label}</Option>
                            ))}
                        </Select>
                    </Col>
                </Row>
                <Row type="flex" className="party-candidates__list">
                    {candidates
                        .filter(
                            candidate =>
                                candidate.circle.id === this.state.circle ||
                                this.state.circle === "all"
                        )
                        .map((candidate, index) => {
                            return (
                                <Col
                                    key={index}
                                    span={12}
                                    sm={8}
                                    lg={6}
                                    xl={4}
                                    className="party-candidate"
                                >
                                    <div className="party-candidate__content">
                                        <Avatar size={120} icon="user" />
                                        {candidate.circle.name && (
                                            <Paragraph className="party-candidate__content-circle">{candidate.circle.name}</Paragraph>
                                        )}
                                        {candidate.name && (
                                            <Title className="party-candidate__content-title" level={3}>{candidate.name}</Title>
                                        )}
                                        {candidate.biography && (
                                            <Paragraph className="party-candidate__content-biography">{candidate.biography}</Paragraph>
                                        )}
                                    </div>
                                </Col>
                            );
                        })}
                </Row>
            </section>
        );
    }
}

export default PartyCandidatesList;

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
import { getName } from '../../utils';

const { Title, Paragraph } = Typography;
const { Option } = Select;

class Candidates extends React.Component {
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
            <section className="candidates">
                <Row>
                    <Col lg={17} span={24}>
                        <Title level={2}>Cabeças de Lista</Title>
                    </Col>
                    <Col lg={7} span={24} className="candidates__circles">
                        <Select
                            style={{ width: "100%" }}
                            placeholder="Escolha o Círculo Eleitoral"
                            onChange={this.updateCircle}
                        >
                            {circles.map((circle, index) => (
                                <Option key={circle.value} value={circle.value}>{circle.label}</Option>
                            ))}
                        </Select>
                    </Col>
                </Row>
                <Row className="candidates__list">
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
                                    className="candidate"
                                >
                                    <Avatar size={160} icon="user" />
                                    <Title level={4}>{getName(candidate.name)}</Title>
                                    <Paragraph>{candidate.circle.name}</Paragraph>
                                    <Paragraph>{candidate.biography}</Paragraph>
                                </Col>
                            );
                        })}
                </Row>
            </section>
        );
    }
}

export default Candidates;

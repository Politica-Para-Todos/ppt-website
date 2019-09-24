
import React, { PureComponent } from "react";
import { Row, Col } from "antd";
import Button from "antd/es/button";
import Countdown from 'react-countdown-now';
import CountdownRenderer from "./CountdownRenderer";
import voting from "../../../assets/images/voting.svg";

class HomeCountdown extends PureComponent {
    render() {
        return (
            <section className="home-voting-countdown" >
                <Row>
                    <Col span={24} lg={24}>
                        <img src={voting} />
                        <Countdown date="2019-10-06T09:00:00" renderer={CountdownRenderer} />
                        <Button className="button--grey" size="large">
                            <a
                                href="https://www.portaldoeleitor.pt/Default.aspx"
                                target="_blank"
                                rel="noopener"
                            >
                                Como votar?
                        </a>
                        </Button>
                    </Col>
                </Row>
            </section >
        );
    }
}

export default HomeCountdown;

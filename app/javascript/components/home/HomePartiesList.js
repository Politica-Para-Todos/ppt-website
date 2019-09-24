import React, { PureComponent } from "react";
import { Row, Col } from "antd";
import AvatarList from "../common/AvatarList";

class HomePartiesList extends PureComponent {
    constructor(props) {
        super(props);
    }

    render() {
        const { parties } = this.props;

        return (
            <section id="parties-section" className="section-home-parties-list section--grey">
                <Row>
                    <Col span={24} lg={24}>
                        <p className="home-parties-list_disclaimer">
                            A ordem dos partidos a seguir é feita de forma aleatória.
                            <br />
                            Sempre que voltares a carregar esta página a ordem será diferente.
                        </p>
                        <h2>Lista de Partidos</h2>
                        <AvatarList items={parties} theme={"4x3"} />
                    </Col>
                </Row>
            </section>
        );
    }
}

export default HomePartiesList;

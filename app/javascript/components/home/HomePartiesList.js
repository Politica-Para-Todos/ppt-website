import React, { PureComponent } from "react";
import PartiesList from "../common/PartiesList";

class HomePartiesList extends PureComponent {
    constructor(props) {
        super(props);
    }

    render() {
        const { parties } = this.props;

        return (
            <section className="section-home-parties-list section--grey">
                <h2>Lista de Partidos</h2>
                <PartiesList theme="row" parties={parties} />
            </section>
        );
    }
}

export default HomePartiesList;

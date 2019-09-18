import React, { PureComponent } from "react";
import AvatarList from "../common/AvatarList";

class HomePartiesList extends PureComponent {
    constructor(props) {
        super(props);
    }

    render() {
        const { parties } = this.props;

        return (
            <section className="section-home-parties-list section--grey">
                <h2>Lista de Partidos</h2>
                <AvatarList items={parties} theme={"4x3"} />
            </section>
        );
    }
}

export default HomePartiesList;

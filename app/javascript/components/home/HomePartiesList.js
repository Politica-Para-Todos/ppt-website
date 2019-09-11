import React, { PureComponent } from "react";
import AvatarList from "../common/AvatarList";

class HomePartiesList extends PureComponent {
    constructor(props) {
        super(props);
    }

    render() {
        const { items } = this.props;

        return (
            <section className="section-parties-list section--grey">
                <h2>Lista de Partidos</h2>
                <AvatarList items={items} />
            </section>
        );
    }
}

export default HomePartiesList;

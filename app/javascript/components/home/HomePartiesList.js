import React, { PureComponent } from "react";
import AvatarList from "../common/AvatarList";

class HomePartiesList extends PureComponent {
    constructor(props) {
        super(props);
    }

    render() {
        const { parties } = this.props;

        return (
            <section id="parties-section" className="section-home-parties-list section--grey">
                <h4 style={{ width: '600px', marginLeft: 'auto', marginRight: 'auto', fontWeight: 'lighter'}}>De forma a evitar enviesamentos, a lista de partidos aparece de forma aleatória.</h4>
                <h2>Lista de Partidos</h2>
                <AvatarList items={parties} theme={"4x3"} />
            </section>
        );
    }
}

export default HomePartiesList;

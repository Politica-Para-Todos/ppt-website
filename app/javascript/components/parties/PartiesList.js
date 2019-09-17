import React, { PureComponent } from "react";
import PartyElement from "./PartyElement";

class PartiesList extends PureComponent {
    constructor(props) {
        super(props);
    }

    render() {
        const { parties } = this.props;

        return (
            <section className="section-parties-list">
                {parties.map((data, index) => (
                    <PartyElement key={index} data={data} />
                ))}
            </section>
        );
    }
}

export default PartiesList;

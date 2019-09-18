import React, { PureComponent } from "react";
import PartyElement from "./PartyElement";

class PartiesList extends PureComponent {
    constructor(props) {
        super(props);
    }

    render() {
        const { parties, theme } = this.props;

        return (
            <div className={`parties-list parties-list--${theme}`}>
                {parties.map((party, index) => (
                    <PartyElement key={index} party={party} theme={theme} />
                ))}
            </div>
        );
    }
}

export default PartiesList;

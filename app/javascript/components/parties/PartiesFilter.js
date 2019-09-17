import React, { PureComponent } from "react";

class PartiesFilter extends PureComponent {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <section className="section-parties-filter">
                <form action="">
                    <div className="field">
                        <input type="text" placeholder="Procure aqui por um partido" />
                    </div>
                    <div className="field">
                        <select>
                            <option value="alphabetical">Ordem Alfabética</option>
                            <option value="random">Randomizado</option>
                        </select>
                    </div>
                </form>
            </section>
        );
    }
}

export default PartiesFilter;

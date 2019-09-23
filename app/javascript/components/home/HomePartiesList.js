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
                <p className="home-parties-list_disclaimer">
                A ordem dos partidos a seguir é feita de forma aleatória. Sempre que voltares a carregar esta página a ordem será diferente.
                </p>
                <h2>Lista de Partidos</h2>
                <AvatarList items={parties} theme={"4x3"} />
            </section>
        );
    }
}

export default HomePartiesList;

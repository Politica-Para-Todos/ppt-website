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

import React from 'react';
import { Route, Switch } from 'react-router-dom';
import { withRouter } from 'react-router';
import Home from "./home";
import Party from "./party";
import PartyCandidate from "./party/party-candidates";
import PartyManifesto from "./party/party-manifestos";
import AboutUs from './about-us';
import Debates from './debates';

class App extends React.Component {
    constructor() {
        super();
    }

    render() {
        return (
            <Switch>
                <Route exact path="/" component={Home} />
                <Route exact path="/party/:party_acronym" component={withRouter(Party)} />
                <Route exact path="/party/:party_acronym/candidates/:district" component={withRouter(PartyCandidate)} />
                <Route exact path="/party/:party_acronym/manifesto/:section_id?" component={withRouter(PartyManifesto)} />
                <Route exact path="/debates-2022" component={Debates} />
                <Route exact path="/about-us" component={AboutUs} />
            </Switch >
        )
    }
}

export default App;

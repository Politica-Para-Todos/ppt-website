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
import Program from "./program";
import Party from "./party";
import Candidate from "./party/candidate";

class App extends React.Component {
    constructor() {
        super();
    }

    render() {
        return (
            <Switch>
                <Route exact path="/" component={Home} />
                <Route exact path="/manifesto/:party_acronym/:section_id?" component={withRouter(Program)} />
                <Route exact path="/party/:id" component={withRouter(Party)} />
                <Route exact path="/party/:id/:candidate_id" component={withRouter(Candidate)} />
            </Switch>
        )
    }
}

export default App

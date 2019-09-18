import React from 'react';
import { Route, Switch } from 'react-router-dom';
import { withRouter } from 'react-router';
import Home from "./home";
import Parties from "./parties";
import Program from "./program";

class App extends React.Component {
    constructor() {
        super();
    }

    render() {
        return (
            <Switch>
                <Route exact path="/" component={Home} />
                <Route exact path="/partidos" component={Parties} />
                <Route exact path="/programa/:party_acronym/:section_id?" component={withRouter(Program)} />
            </Switch>
        )
    }
}

export default App

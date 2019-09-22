import React from 'react';
import { Route, Switch } from 'react-router-dom';
import { withRouter } from 'react-router';
import Home from "./home";
import Program from "./program";
import Party from "./party";

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
            </Switch>
        )
    }
}

export default App

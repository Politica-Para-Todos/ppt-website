import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Home from "./home";
import Program from "./program";
import Section from "./program";

class App extends React.Component {
  render() {
    return (
      <Switch>
          <Route exact path="/" component={Home} />
          <Route exact path="/programa/:id" component={Program} />
          <Route exact path="/programa/:id/section/:section_id" component={Section} />
      </Switch>
    )
  }
}

export default App

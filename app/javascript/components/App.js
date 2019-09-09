import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Home from "./home";
import Program from "./program";

class App extends React.Component {
  render() {
    return (
      <Switch>
          <Route exact path="/" component={Home} />
          <Route exact path="/programa/:id" component={Program} />
      </Switch>
    )
  }
}

export default App
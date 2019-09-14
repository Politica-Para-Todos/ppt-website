import React, { PureComponent } from "react";
import { Link } from 'react-router-dom'
import MenuBar from "./MenuBar";

class Program extends PureComponent {

    constructor() {
      super()
      this.state = {
          title: "",
          sections: []
      }
    }

    componentDidMount() {
        fetch("/manifestos/" + this.props.match.params.id + ".json")
        .then(res => res.json())
        .then((data) => {
          this.setState({
            ...this.state,
            title: data.title,
            sections: data.sections
          })
        })
        .catch(console.log)
    }

    render() {
        return (
          <div>
            <div>{this.state.title}</div>
            <MenuBar sections={this.state.sections} />
          </div>
        );
    }
}

import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import LayoutHeader from "../common/LayoutHeader";
import LayoutFooter from "../common/LayoutFooter";
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
          <Layout>
              <LayoutHeader />
              <Layout.Content>
                  <div>
                    <div>{this.state.title}</div>
                    <MenuBar
                      sections={this.state.sections}
                    />
                  </div>
          </Layout.Content>
          <LayoutFooter />
      </Layout>
        );
    }
}

export default Program;

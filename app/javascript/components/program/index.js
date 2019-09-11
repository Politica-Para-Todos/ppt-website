import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import LayoutHeader from "../common/LayoutHeader";
import LayoutFooter from "../common/LayoutFooter";

class Program extends PureComponent {
    render() {
        return (
            <Layout>
                <LayoutHeader />
                <Layout.Content>
                    <div>Hello</div>
                </Layout.Content>
                <LayoutFooter />
            </Layout>
        );
    }
}

export default Program;

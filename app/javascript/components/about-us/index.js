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

import React from "react";
import { Layout, Divider } from 'antd';
import MetaTags from "../MetaTags";
import LayoutHeader from "../common/LayoutHeader";
import AboutUsContributors from "./AboutUsContributors";
import AboutUsMotivation from "./AboutUsMotivation";
import AboutUsJoinUs from "./AboutUsJoinUs";
import AboutUsFooter from "./AboutUsFooter";
import rowsPeople from "../../../assets/images/rows-people.svg";

export default function AboutUs() {
    return (
        <Layout>
            <MetaTags
                pageTitle="Quem somos"
                pageDescription="A comunidade Política Para Todos nasceu no verão de 2019 com o objetivo de promover a participação ativa dos cidadãos nos processos eleitorais em Portugal. É composta por voluntários de várias partes do país e diferentes áreas profissionais."
                socialTitle="Quem somos"
                socialDescription="A comunidade Política Para Todos nasceu no verão de 2019 com o objetivo de promover a participação ativa dos cidadãos nos processos eleitorais em Portugal. É composta por voluntários de várias partes do país e diferentes áreas profissionais."
                socialImage="/images/share/banner-PPT.jpg"
            />
            <LayoutHeader />
            <Layout.Content className="about-us-section">
                <img src={rowsPeople} className="about-us__header-img" />
                <AboutUsContributors />
                <Divider />
                <AboutUsMotivation />
                <AboutUsJoinUs />
            </Layout.Content>
            <AboutUsFooter />
        </Layout>
    );
}

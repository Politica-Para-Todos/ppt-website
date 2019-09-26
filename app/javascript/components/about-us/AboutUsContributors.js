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
import { shuffleArray } from "../../utils";
import contributorsList from "../../contributors-list";

export default function AboutUsContributors() {
    return (
        <section className="about-us-contributors">
            <h2>Quem Somos</h2>
            <p>Podes consultar <a target="_blank" rel="noopener" href="https://www.loomio.org/g/ZqT2uPv6/politica-para-todos">aqui</a> todo o histórico do projecto.</p>
            <p className="about-us-contributors-list">{shuffleArray(contributorsList).join(", ")}.</p>
        </section>
    )
}

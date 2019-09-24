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
import { Typography } from "antd";

const { Title, Paragraph } = Typography;
const Summary = ({ children }) => (
  <ul className="metrics__summary">{children}</ul>
);

const Data = ({ title, value }) => (
  <li>
    <Title level={4}>{title}</Title>
    <Paragraph className="summary__value">{value}</Paragraph>
  </li>
);

Summary.Data = Data;

export default Summary;

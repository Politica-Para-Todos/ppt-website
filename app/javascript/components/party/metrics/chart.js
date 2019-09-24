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
import { Icon, Typography } from "antd";

const { Paragraph } = Typography;

const Chart = ({ children }) => <ul className="metrics__chart">{children}</ul>;

const ChartLine = ({ icon, color = "yellow", percentage }) => {
  return (
    <li style={{ width: `${percentage}%` }}>
      <Icon
        type={icon}
        size={42}
        theme="filled"
        style={{ fontSize: "42px", color: "#666666" }}
      />
      <span className={`chart__line chart__line--${color}`} />
      <Paragraph strong>{`${percentage} %`}</Paragraph>
    </li>
  );
};
Chart.Line = ChartLine;
export default Chart;

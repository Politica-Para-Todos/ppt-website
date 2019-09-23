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

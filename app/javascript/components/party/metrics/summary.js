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

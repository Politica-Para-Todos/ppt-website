import React, { PureComponent } from "react";
import Avatar from 'antd/es/avatar';


export default function RoundAvatar({ picURL, title, subtitle }) {
    return (
        <div>
            <Avatar size={64} icon="user"/>
            <h3>{title}</h3>
            <h4>{subtitle}</h4>
        </div>
    )
}
import React from "react";
import { Link } from 'react-router-dom'
import Avatar from 'antd/es/avatar';

export default function PartyElement({ data }) {
    return (
        <div className="party-element">
            <Avatar className="party-element__avatar" size={140} icon="user" />
            <h2 className="party-element__title">{data.title}</h2>
            <div className="party-element__cta">
                <Link to={`/programa/${data.programID}`}>Ver Programa</Link>
            </div>
        </div>
    )
}

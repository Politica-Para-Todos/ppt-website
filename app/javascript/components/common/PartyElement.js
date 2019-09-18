import React from "react";
import { Link } from 'react-router-dom';
import Avatar from 'antd/es/avatar';
import Button from 'antd/es/button';

export default function PartyElement({ party, theme }) {
    return (
        <div className="party-element">
            {(() => {
                if (party.avatarUrl) {
                    return <Avatar className="party-element__avatar" size={140} src={party.avatarUrl} />
                } else {
                    return <Avatar className="party-element__avatar" size={140} icon="user" />
                }
            })()}
            {theme === 'row' && (
                <h3 className="party-element__subtitle">{party.title}</h3>
            )}
            {party.party_acronym && (
                <h2 className="party-element__title">{party.party_acronym}</h2>
            )}
            {theme === 'column' && (
                <div className="party-element__cta">
                    <Link className="button button--grey" to={`/programa/${party.party_acronym}`}>Ver Programa</Link>
                </div>
            )}
        </div>
    )
}

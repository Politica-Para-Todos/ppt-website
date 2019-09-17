import React from "react";
import CountdownUnit from "./CountdownUnit";

export default function CountdownRenderer({ days, hours, minutes, seconds, completed }) {
    return (
        <div className="countdown-container">
            <CountdownUnit label="Dias" value={days} />
            <span className="countdown-unit-separator">:</span>
            <CountdownUnit label="Horas" value={hours} />
            <span className="countdown-unit-separator">:</span>
            <CountdownUnit label="Minutos" value={minutes} />
            <span className="countdown-unit-separator">:</span>
            <CountdownUnit label="Segundos" value={seconds} />
        </div>
    )
}
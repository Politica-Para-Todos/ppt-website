import React from "react";
import { zeroPad } from "react-countdown-now";

export default function CountdownUnit({ label, value }) {
    return (
        <div className="countdown-unit">
            <div className="countdown-unit-value">{zeroPad(value, 2)}</div>
            <div className="countdown-unit-label">{label}</div>
        </div>
    )
}
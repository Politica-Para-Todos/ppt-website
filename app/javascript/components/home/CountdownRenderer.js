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

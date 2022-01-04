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
import {Button, Icon, Modal} from "antd";
import useLocalStorage from "../common/hooks/useLocalStorage";


export default function HomeInitialWarning() {

    const [firstTime, setFirstTime] = useLocalStorage('firstTime', true);

    return (
        <Modal
            visible={firstTime}
            footer={null}
            className="home-warning-container"
            onCancel={() => setFirstTime(false)}
            maskClosable={false}
            closeIcon={
                <Icon className="home-warning-close-icon" type="close-circle" theme="filled"/>
            }
        >
            <h1>Atenção!</h1>
            <div className="home-warning-content-wrapper">
                <p>Neste momento, a plataforma PPT ainda se encontra com os dados das Legislativas 2019.</p>
                <p>Estamos a processar alguns dos programas eleitorais e à espera que as restantes candidaturas disponibilizem a respectiva informação.</p>
            </div>
            <div className="home-warning-footer-wrapper">
                <Button onClick={() => setFirstTime(false)} className="button--grey">Compreendi!</Button>
            </div>
        </Modal>
    )
}

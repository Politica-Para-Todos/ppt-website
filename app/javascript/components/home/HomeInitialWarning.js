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
                <p>Neste momento, esta plataforma ainda não se encontra 100% completa.</p>
                <p>Estamos a processar alguns dos programas eleitorais e à espera que as restantes candidaturas disponibilizem a respectiva informação.</p>
            </div>
            <div className="home-warning-footer-wrapper">
                <Button onClick={() => setFirstTime(false)} className="button--grey">Compreendi!</Button>
            </div>
        </Modal>
    )
}

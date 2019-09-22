import React, { PureComponent } from "react";
import Button from "antd/es/button";
import Countdown from 'react-countdown-now';
import CountdownRenderer from "./CountdownRenderer";
import infographic from "../../../assets/images/infographic.svg";
import voting from "../../../assets/images/voting.svg";

class HomeMission extends PureComponent {
    render() {
        return (
            <section>
                <div className="home-our-mission">
                    <div>
                        <h2>A nossa missão</h2>
                        <p>Missão: promover a participação activa dos cidadãos nos processos eleitorais em Portugal.</p>
                        <br />
                        <p>As eleições legislativas de 6 de Outubro de 2019 aproximam-se. Como um grupo de cidadãos independentes, decidimos criar esta página para agregar toda a informação relevante para estas eleições.</p>
                        <br />
                        <p>Para cada candidatura, e nos casos em que os programas eleitorais estejam disponíveis, é apresentada informação para ajudar a perceber as diferentes propostas, tais como: nomes dos cabeças de lista, contato de email da candidatura, programa eleitoral, e lista de candidatos.</p>
                        <br />
                        <p>Para além de listar as candidaturas, está ser desenvolvida a funcionalidade de comentar os programas eleitorais. Esta funcionalidade permitirá discutir medidas ou fazer perguntas para esclarecimento por parte dos partidos políticos. Permitirá ainda um envolvimento direto da comunidade com cada parágrafo de cada programa apresentado, o que facilita um maior esclarecimento e literacia na hora da decisão.</p>
                    </div>
                    <div className="home-our-mission-img">
                        <img src={infographic} />
                    </div>
                </div>
                <div className="home-voting-countdown">
                    <img src={voting} />
                    <Countdown date="2019-10-06T09:00:00" renderer={CountdownRenderer} />
                    <Button className="button--grey">Como Votar?</Button>
                </div>
            </section>
        );
    }
}

export default HomeMission;

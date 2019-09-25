import React, { PureComponent } from "react";
import { Row, Col } from "antd";

class HomeMotivation extends PureComponent {
    render() {
        return (
            <section className="home-motivation">
                <Row type="flex" justify="space-between">
                    <Col span={24} lg={14} className="home-motivation__text">
                        <h2>O que nos move</h2>
                        <ol>
                            <li>
                                Acreditamos que um sistema governativo melhora quando a participação dos cidadãos aumenta. A nossa missão é aumentar a participação dos cidadãos.
                                </li>
                            <li>
                                Acreditamos que uma cidadania mais informada tem uma maior capacidade de contribuir no processo e desenvolvimento democrático.
                                </li>
                            <li>
                                Acreditamos que um sistema governativo melhora quando é transparente em todos os níveis, desde o indivíduo até ao governo, passando pelas iniciativas de cidadãos e pelos partidos.
                                </li>
                            <li>
                                Acreditamos que é importante que este projecto seja politicamente neutro, para evitar que não seja apropriado por forças políticas e porque acreditamos que deve ser estimulado o debate de ideias. Este projecto não é iniciativa de nenhum partido político.
                                </li>
                            <li>
                                Acreditamos que o cidadão informado permite um maior escrutínio das ideias dos vários partidos, permitindo assim a criação de programas eleitorais mais esclarecedores para o cidadão.
                                </li>
                            <li>
                                O acto de escrutínio político leva não só a melhores decisões políticas como a um aumento do espiríto crítico dos cidadãos.
                                </li>
                            <li>
                                Acreditamos que para informar não precisamos de estar dependentes de pressões externas, sejam elas económicas, financeiras, partidárias, religiosas ou culturais. Informar é um dever e um direito do cidadão, participamos neste projecto voluntariamente.
                                </li>
                            <li>
                                Enquanto voluntários desta iniciativa, reconhecemos que somos pessoas, e que todas as pessoas têm as suas próprias inclinações. Devemos garantir que estas inclinações têm o menor impacto possível e, em caso de existência destas, que sejam geridas de forma totalmente responsável e transparente.
                                </li>
                            <li>
                                Aplicamos a nossa preferência pelo espírito crítico ao nosso próprio trabalho, e recebemos de bom grado sugestões e críticas para melhorar.
                                </li>
                        </ol>
                    </Col>
                    <Col span={24} lg={8} className="home-motivation__cta">
                        <h2>Junta-te a nós!</h2>
                        <p>Este projecto é aberto a todos os que se identifiquem com os valores do nosso manifesto. Trabalhamos de acordo com os princípios de transparência radical: todas as nossas decisões são públicas e é clara qual a contribuição de cada indivíduo. Toda a comunicação deste projecto passa pela nossa página na plataforma Loomio. Entra <a target="_blank" rel="noopener" href="https://www.loomio.org/g/ZqT2uPv6/politica-para-todos">neste link</a> para ver toda a nossa comunicação, e caso queiras contribuir, vai até à conversa "Como Contribuir". Ficamos à espera!</p>
                    </Col>
                </Row>
            </section>
        );
    }
}

export default HomeMotivation;

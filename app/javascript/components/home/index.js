import React, { PureComponent } from "react";
import Layout from 'antd/es/layout';
import Menu from 'antd/es/menu';
import Button from "antd/es/button";
import AvatarList from "../common/AvatarList";

const { Header, Footer, Content } = Layout;

export default class Home extends PureComponent {

    static defaultProps = {
        items: [{ title: "Partido A", subtitle: "Cenas do partido A"}]
    }

    renderHeader() {
        return (
            <Header className="comentar-css-header">
                <div className="logo" />
                <Menu
                    mode="horizontal"
                >
                    <Menu.Item key="1">Home</Menu.Item>
                    <Menu.Item key="2">Partidos</Menu.Item>
                </Menu>
                <div className="comentar-css-social-media">
                    <ul className="comentar-css-social-media-list">
                        <li>
                            <a href="https://twitter.com/politicaparatds">
                                <svg className="comentar-css-social-media__icon" viewBox="0 0 40 40">
                                    <path d="M36.3,10.2c-1,1.3-2.1,2.5-3.4,3.5c0,0.2,0,0.4,0,1c0,1.7-0.2,3.6-0.9,5.3c-0.6,1.7-1.2,3.5-2.4,5.1 c-1.1,1.5-2.3,3.1-3.7,4.3c-1.4,1.2-3.3,2.3-5.3,3c-2.1,0.8-4.2,1.2-6.6,1.2c-3.6,0-7-1-10.2-3c0.4,0,1.1,0.1,1.5,0.1 c3.1,0,5.9-1,8.2-2.9c-1.4,0-2.7-0.4-3.8-1.3c-1.2-1-1.9-2-2.2-3.3c0.4,0.1,1,0.1,1.2,0.1c0.6,0,1.2-0.1,1.7-0.2 c-1.4-0.3-2.7-1.1-3.7-2.3s-1.4-2.6-1.4-4.2v-0.1c1,0.6,2,0.9,3,0.9c-1-0.6-1.5-1.3-2.2-2.4c-0.6-1-0.9-2.1-0.9-3.3s0.3-2.3,1-3.4 c1.5,2.1,3.6,3.6,6,4.9s4.9,2,7.6,2.1c-0.1-0.6-0.1-1.1-0.1-1.4c0-1.8,0.8-3.5,2-4.7c1.2-1.2,2.9-2,4.7-2c2,0,3.6,0.8,4.8,2.1 c1.4-0.3,2.9-0.9,4.2-1.5c-0.4,1.5-1.4,2.7-2.9,3.6C33.8,11.2,35.1,10.9,36.3,10.2L36.3,10.2z"></path>
                                </svg>
                            </a>
                        </li>
                        <li>
                            <a href="http://fb.me/politicaparatodos.pt">
                                <svg className="comentar-css-social-media__icon" viewBox="0 0 40 40">
                                    <path d="M27.2,4.7v4.9h-2.9c-1.1,0-1.8,0.2-2.1,0.6c-0.4,0.5-0.6,1.1-0.6,2v3.5H27l-0.7,5.4h-4.7v14H16v-14h-4.7v-5.4H16v-4.1 c0-2.3,0.6-4.1,1.9-5.3s2.9-1.9,5.2-1.9C24.8,4.4,26.2,4.5,27.2,4.7L27.2,4.7z"></path>
                                </svg>
                            </a>
                        </li>
                        <li>
                            <a href="https://medium.com/politica-para-todos">
                                <svg className="comentar-css-social-media__icon" viewBox="0 0 40 40">
                                    <path d="M5.9,12c0-0.4-0.1-0.9-0.5-1.2l-3.4-4V6.1h10.4l8.1,17.7l7.1-17.7h9.9v0.6l-2.9,2.8c-0.2,0.2-0.4,0.5-0.3,0.8v20.2 c-0.1,0.3,0.1,0.6,0.3,0.8l2.8,2.8v0.6H23.4v-0.6l2.9-2.8c0.3-0.3,0.3-0.4,0.3-0.8V14.1l-8.1,20.5h-1.1L8,14.1v13.8 C8,28.4,8.2,29,8.6,29.4l3.8,4.6v0.6H1.6V34l3.8-4.6c0.4-0.4,0.6-1,0.5-1.6V12z"></path>
                                </svg>
                            </a>
                        </li>
                        <li>
                            <a href="mailto:contacto@politicaparatodos.pt">
                                <svg className="comentar-css-social-media__icon" viewBox="0 0 40 40">
                                    <path d="M37.3,15.3v15.3c0,0.8-0.3,1.6-0.9,2.2c-0.6,0.6-1.4,0.9-2.2,0.9H5.8c-0.8,0-1.6-0.3-2.2-0.9s-0.9-1.4-0.9-2.2V15.3 c0.5,0.6,1.2,1.1,2,1.7c4.7,3.1,7.9,5.4,9.6,6.7c0.7,0.5,1.4,0.9,1.8,1.2c0.4,0.3,1,0.6,1.9,0.9c0.7,0.3,1.5,0.5,2.1,0.5l0,0 c0.6,0,1.4-0.2,2.1-0.5c0.7-0.3,1.4-0.6,1.9-0.9c0.4-0.3,1-0.7,1.8-1.2c2.2-1.6,5.4-3.8,9.6-6.7C36.1,16.5,36.7,15.9,37.3,15.3 L37.3,15.3z M37.3,9.6c0,1-0.3,2-0.9,2.9c-0.6,0.9-1.5,1.8-2.4,2.4c-4.9,3.3-7.9,5.4-9,6.2c-0.1,0.1-0.4,0.3-0.8,0.6 c-0.4,0.3-0.7,0.5-1,0.7c-0.3,0.2-0.6,0.4-1,0.6c-0.4,0.2-0.7,0.4-1.1,0.5c-0.4,0.1-0.6,0.2-0.9,0.2l0,0c-0.3,0-0.6-0.1-0.9-0.2 c-0.3-0.1-0.7-0.3-1.1-0.5c-0.4-0.2-0.7-0.4-1-0.6c-0.3-0.2-0.6-0.4-1-0.7c-0.4-0.3-0.7-0.5-0.8-0.6c-1.1-0.8-2.8-2-5.1-3.5 c-2.3-1.6-3.3-2.4-3.7-2.7c-0.8-0.5-1.6-1.2-2.3-2.2s-1-1.9-1-2.6c0-1,0.3-1.9,0.8-2.5c0.5-0.6,1.2-1,2.3-1h28.4 c0.8,0,1.6,0.3,2.2,0.9C37.1,8.1,37.3,8.8,37.3,9.6L37.3,9.6z"></path>
                                </svg>
                            </a>
                        </li>
                    </ul>
                </div>
            </Header>
        )
    }

    renderContent() {
        return (
            <Content>
                <section>
                    <div className="comentar-css-our-mission">
                        <h2>A nossa missão</h2>
                        <ol className="comentar-css-our-mission-list">
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
                    </div>
                    <div className="comentar-css-voting-countdown">
                        <div>Counter here</div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet efficitur ipsum. Sed dapibus nibh eu ex pretium scelerisque.
                        </p>
                        <Button type="primary">Como Votar?</Button>
                    </div>
                </section>
                <section>
                    <h2>Lista de Partidos</h2>
                    <AvatarList items={this.props.items}/>
                </section>
                <section className="comentar-css-join">
                    <div className="comentar-css-join-container">
                        <h2>O que nos move</h2>
                        <p>
                            New had happen unable uneasy. Drawings can followed improved out sociable not. Earnestly so do instantly pretended. See general few civilly amiable pleased account carried. Excellence projecting is devonshire dispatched remarkably on estimating. Side in so life past. Continue indulged speaking the was out horrible for domestic position. Seeing rather her you not esteem men settle genius excuse. Deal say over you age from. Comparison new ham melancholy son themselves. 
                        </p>
                    </div>
                    <div className="comentar-css-join-container">
                        <h2>Junta-te a nós!</h2>
                        <p>
                        Este projecto é aberto a todos os que se identifiquem com os valores do nosso manifesto. Trabalhamos de acordo com os princípios de transparência radical: todas as nossas decisões são públicas e é clara qual a contribuição de cada indivíduo. Toda a comunicação deste projecto passa pela nossa página na plataforma Loomio. Entra <a href="https://www.loomio.org/g/ZqT2uPv6/politica-para-todos">neste link</a> para ver toda a nossa comunicação, e caso queiras contribuir, vai até à conversa "Como Contribuir". Ficamos à espera!
                        </p>
                    </div>
                </section>
            </Content>
        );
    }

    renderFooter() {
        return (
            <Footer>
                <div>
                </div>
                <div>
                    <h2>Quem Somos</h2>
                    <p>
                        ...
                    </p>
                </div>
            </Footer>
        );
    }

    render() {
        return (
            <Layout>
                {this.renderHeader()}
                {this.renderContent()}
                {this.renderFooter()}      
            </Layout>
        );
    }
}

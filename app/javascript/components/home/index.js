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
            <Header>
                <div className="logo" />
                <Menu
                    mode="horizontal"
                >
                    <Menu.Item key="1">Home</Menu.Item>
                    <Menu.Item key="2">Partidos</Menu.Item>
                </Menu>
                <div className="comentar-css-social-media">
                    <ul>
                        <li></li>
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

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

import React, { PureComponent, Fragment } from "react";
import PropTypes from 'prop-types';
import { Row, Col, Divider, Avatar, Button } from "antd";
import SocialSharing from "../common/SocialSharing";

class PartyHeader extends PureComponent {
    constructor(props) {
        super(props)
    }

    render() {
        const { party, subtitle } = this.props;
        //const hasManifesto = party.manifestos.length > 0;
        //const hasNoManifesto = party.manifestos.length == 0;

        return (
            <section className="party-header">
                <Row>
                    <Col span={24}>
                        <h1 className="party-header-title">{party.name}</h1>
                        {subtitle && (
                            <Fragment>
                                <Divider />
                                <p className="party-header-subtitle">{subtitle}</p>
                            </Fragment>
                        )}
                    </Col>
                </Row>
                <Row type="flex" justify="center">
                    <Col>
                        <Avatar size={200} src={party.logo} icon="user" />
                        {party.manifestos && party.manifestos.length > 0 && (
                            <div className="party-header__program-cta">
                                {party.manifestos.map((manifesto, index) => {
                                    return (
                                        <Button className="button--grey party-header__program-button" key={index}>
                                            <a href={`/party/${encodeURIComponent(manifesto)}/manifesto`} rel="noopener">
                                                {`Ver Programa ${manifesto}`}
                                            </a>
                                        </Button>
                                    );
                                })}
                            </div>
                        )}
                        {party.manifestos && party.manifestos.length == 0 && (
                            <div className="party-header__program-cta">
                                <p>
                                    Este partido não apresentou programa eleitoral. <br />
                                    Para qualquer correção entra em contacto connosco via <a href="mailto:contacto@politicaparatodos.pt">e-mail.</a>
                                </p>
                            </div>
                        )}
                    </Col>
                </Row>
                <Row type="flex" justify="end" align="middle" className="party-header__social">
                    <a href={party.website} rel="noopener" target="_blank">{party.website}</a>
                    <SocialSharing socialMediaList={party.socialMedia} theme={"#c4c4c4"} />
                </Row>
            </section>
        )
    }
}

PartyHeader.propTypes = {
    party: PropTypes.object.isRequired,
    subtitle: PropTypes.string,
}

PartyHeader.defaultProps = {
    subtitle: null,
};

export default PartyHeader;

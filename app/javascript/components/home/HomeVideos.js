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

import React, { PureComponent } from "react";
import { Row, Col, Button } from "antd";
import YouTubePlayer from 'react-player/lib/players/YouTube'
import AwesomeSlider from 'react-awesome-slider';
import video_mask from "../../../assets/images/video_mask.jpg";

class HomeVideos extends PureComponent {
    constructor(props) {
        super(props);
        this.state = {
            currentEpisode: 0
        }

        this.videos = [
            {
                url: "https://www.youtube.com/watch?v=up0Gfd5c0cM",
                caption: "Mas afinal para que serve votar? Este é o primeiro de uma série de vídeos que explicam como funcionam as eleições legislativas e a nossa Assembleia da República."
            },
            {
                url: "https://www.youtube.com/watch?v=2nBGppKe1z4",
                caption: "Em semana de eleições continuamos a desconstruir o que está em causa no próximo dia 6 de Outubro, com este episódio a focar-se na Assembleia da República e os Círculos Eleitorais."
            }
        ]
    }

    renderEpisodeButtons() {
        return this.videos.map((video, index) => {
            let classNames = "home-videos__episode-button";
            
            if (this.state.currentEpisode === index) {
                classNames += " button--grey";
            } else {
                classNames += " button--white"
            }
            return (
                <Button
                    key={`episode-${index}`}
                    className={classNames}
                    onClick={() => this.setState({ currentEpisode: index })}>
                    Ep. {index + 1}
                </Button>
            );
        });
    }
    render() {
        const { url, caption } = this.videos[this.state.currentEpisode];
        return (
            <section className="home-videos">
                <Row >
                    <Col span={24} className="home-videos-title">
                        <h2>Como funcionam as Eleições Legislativas</h2>
                    </Col>
                    <Col span={24} lg={18}>
                        <div className='home-videos-player-wrapper'>
                            <YouTubePlayer
                                className='home-videos-react-player'
                                url={url}
                                poster={video_mask}
                                width='100%'
                                height='100%'
                                controls
                            />
                        </div>
                    </Col>
                    <Col span={24} md={16}>
                        <p>{caption}</p>
                    </Col>
                    <Col>
                        {this.renderEpisodeButtons()}
                    </Col>
                </Row>
            </section>
        );
    }
}

export default HomeVideos;

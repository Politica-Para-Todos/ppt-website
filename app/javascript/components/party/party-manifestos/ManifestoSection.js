import React, { PureComponent, Fragment } from "react";
import PropTypes from "prop-types";
import { Tooltip } from "antd";
import ReactHtmlParser from 'react-html-parser';
import Popover from "react-text-selection-popover";
import twitterImg from "../../../../assets/images/twitter_icon.svg";

class ManifestoSection extends PureComponent {
    constructor(props) {
        super(props);

        this.sectionContentRef = React.createRef();
    }

    static propTypes = {
        title: PropTypes.string,
        section: PropTypes.object,
        section_id: PropTypes.string,
        party_acronym: PropTypes.string
    }

    onClickTwitterShare(e, id) {
        e.preventDefault();

        const { section_id, party_acronym } = this.props;
        const text = `https://www.politicaparatodos.pt/party/${party_acronym}/manifesto/${section_id}%23${id}`;
        console.log(text);
        window.open(`https://twitter.com/intent/tweet?text=${text}`, "Twitter", "height=285,width=550,resizable=1");
        e.stopPropagation();
    }

    renderTooltipContent() {
        return (
            <div onClick={(e) => this.onClickTwitterShare(e)}>
                <img src={twitterImg} />
            </div>
        )
    }
    renderSectionItem(item) {
        if (item.content.length === 1) {
            return null;
        }

        return (
            <div key={item.id} id={item.id} className="party-manifesto-item">
                <div className="party-manifesto-item__bar" onClick={(e) => this.onClickTwitterShare(e, item.id)}></div>
                {ReactHtmlParser(item.content)}
            </div>
        );
    }

    renderSectionContent() {
        const { section, section_id } = this.props;

        if (!section_id || !section) {
            return null;
        }

        return section.items.map(item => this.renderSectionItem(item));
    }

    renderSectionTitle() {
        const section = this.props.section;

        if (!section) {
            return null;
        }

        return <h2>{this.props.section.title}</h2>;
    }

    render() {
        const { title } = this.props;

        return (
            <section className="party-manifesto-body">
                <h1 className="party-manifesto-body__title">{title}</h1>
                {this.renderSectionTitle()}
                <div
                    className="party-manifesto-body__content">
                    {this.renderSectionContent()}
                </div>
            </section>
        )
    }
}

export default ManifestoSection;

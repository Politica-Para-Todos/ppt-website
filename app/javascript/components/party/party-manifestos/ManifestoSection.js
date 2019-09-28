import React, { PureComponent, Fragment } from "react";
import { Tooltip } from "antd";
import ReactHtmlParser from 'react-html-parser';
import Popover from "react-text-selection-popover";
import twitterImg from "../../../../assets/images/glyph_twitter.svg";

class ManifestoSection extends PureComponent {
    constructor(props) {
        super(props);

        this.sectionContentRef = React.createRef();
    }

    onClickTwitterShare() {
        const text = window.getSelection().toString();

        window.open(`https://twitter.com/intent/tweet?text=${text}`, "Twitter", "height=285,width=550,resizable=1");
    }

    renderSectionItem(item) {
        return (
            <Fragment key={item.id}>
                {ReactHtmlParser(item.content)}
            </Fragment>
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
                    ref={this.sectionContentRef}
                    className="party-manifesto-body__content">
                    {this.renderSectionContent()}
                </div>
                <Popover
                    selectionRef={this.sectionContentRef}
                    className="party-manifesto__share-popover">
                    <a
                        onClick={this.onClickTwitterShare}>
                        <img src={twitterImg} />
                    </a>
                </Popover>
            </section>
        )
    }
}

export default ManifestoSection;

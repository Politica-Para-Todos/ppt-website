import React, { PureComponent, Fragment } from "react";
import ReactHtmlParser from 'react-html-parser';

class ProgramSection extends PureComponent {
    constructor(props) {
        super(props)
    }

    getSectionContent() {
        const { items, section_id } = this.props;

        if (section_id && items) {
            return (
                items.map(item => {
                    return (
                        <Fragment key={item.id}>
                            {ReactHtmlParser(item.content)}
                        </Fragment>
                    )
                })
            )
        } else {
            return (
                <div>Introduction</div>
            )
        }
    }

    render() {
        const { title } = this.props;

        return (
            <section className="party-program-body">
                <h1 className="party-program-body__title">{title}</h1>
                <div className="party-program-body__content">
                    {this.getSectionContent()}
                </div>
            </section>
        )
    }
}

export default ProgramSection;

import React, { PureComponent } from "react";
import { Link } from 'react-router-dom'

class Section extends PureComponent {

    constructor() {
      super()
      this.state = {

      }
    }

    render() {
        const { items } = this.props;

        return (
          <div>
            {items.map( (item, idx) => {
                return <p key={item.id}>{item.content}</p>
            })}
          </div>
        );
    }
}

export default Section;

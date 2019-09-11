import React from "react";
import RoundAvatar from "./RoundAvatar";

export default function AvatarList({ items }) {
    return (
        <div>
            {items.map(data => <RoundAvatar key={data.title.replace(" ", "_")} {...data} />)}
        </div>
    )
}

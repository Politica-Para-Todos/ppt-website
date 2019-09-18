import React from "react";
import { shuffleArray} from "../../utils";
import contributorsList from "../../contributors-list";

export default function ContributorsList() {
    return (
        <p>Quem esteve envolvido no projecto: {shuffleArray(contributorsList).join(", ")}</p>
    )
}
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

// Slugify a string
function slugify(string) {
    string = string.replace(/^\s+|\s+$/g, '');

    // Make the stringing lowercase
    string = string.toLowerCase();

    // Remove accents, swap ñ for n, etc
    var from = "ÁÄÂÀÃÅČÇĆĎÉĚËÈÊẼĔȆÍÌÎÏŇÑÓÖÒÔÕØŘŔŠŤÚŮÜÙÛÝŸŽáäâàãåčçćďéěëèêẽĕȇíìîïňñóöòôõøðřŕšťúůüùûýÿžþÞĐđßÆa·/_,:;";
    var to = "AAAAAACCCDEEEEEEEEIIIINNOOOOOORRSTUUUUUYYZaaaaaacccdeeeeeeeeiiiinnooooooorrstuuuuuyyzbBDdBAa------";
    for (var i = 0, l = from.length; i < l; i++) {
        string = string.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
    }

    // Remove invalid chars
    string = string.replace(/[^a-z0-9 -]/g, '')
        // Collapse whitespace and replace by _
        .replace(/\s+/g, '_')
        // Collapse dashes
        .replace(/-+/g, '_');

    return string;
}

// Shuffle array
function shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }

    return array;
}

// Get first and last name
function getName(str) {
    var names = str.split(' ');
    return names[0] + ' ' + names[names.length-1];
}

// Sort array by key
function sortArrayByKey(array, key) {
  return array.sort(function(a, b) {
        var x = a[key];
        var y = b[key];
        return ((x < y) ? -1 : ((x > y) ? 1 : 0));
    });
}

export { slugify, shuffleArray, getName, sortArrayByKey };

export const circles = [
    {
        value: "all",
        label: "Todos"
    },
    {
        value: "acores",
        label: "Açores"
    },
    {
        value: "aveiro",
        label: "Aveiro"
    },
    {
        value: "beja",
        label: "Beja"
    },
    {
        value: "braga",
        label: "Braga"
    },
    {
        value: "braganca",
        label: "Bragança"
    },
    {
        value: "castelo-branco",
        label: "Castelo Branco"
    },
    {
        value: "coimbra",
        label: "Coimbra"
    },
    {
        value: "evora",
        label: "Évora"
    },
    {
        value: "europa",
        label: "Europa"
    },
    {
        value: "faro",
        label: "Faro"
    },
    {
        value: "fora-da-europa",
        label: "Fora da Europa"
    },
    {
        value: "guarda",
        label: "Guarda"
    },
    {
        value: "leiria",
        label: "Leiria"
    },
    {
        value: "lisboa",
        label: "Lisboa"
    },
    {
        value: "madeira",
        label: "Madeira"
    },
    {
        value: "portalegre",
        label: "Portalegre"
    },
    {
        value: "porto",
        label: "Porto"
    },
    {
        value: "santarem",
        label: "Santarém"
    },
    {
        value: "setubal",
        label: "Setúbal"
    },
    {
        value: "viana-do-castelo",
        label: "Viana do Castelo"
    },
    {
        value: "vila-real",
        label: "Vila Real"
    },
    {
        value: "viseu",
        label: "Viseu"
    }
];

// Ex 4 - As Aranhas 
class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`${this.nome} lança um ataque de aura contra ${alvo.nome}!`);
    }
}

class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} fortalece o corpo e dá um soco poderoso em ${alvo.nome}!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} transforma a aura em eletricidade e atinge ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} cria correntes de aura para prender ${alvo.nome}!`);
    }
}

class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`--- Aranhas avistadas em ${this.cidade} ---`);
        this.#aranhas.forEach(a => {
            console.log(`Número ${a.numero} - ${a.nome}`);
        });
    }

    buscarAranha(numero) {
        return this.#aranhas.find(a => a.numero === numero);
    }
}

// --- main ---

const feitan = new Aranha('Feitan', 5);
const nobunaga = new Aranha('Nobunaga', 11);

const trupe = new TrupeFantasma('Yorknew', [feitan, nobunaga]);
trupe.revelarAranhas();

const alvo = trupe.buscarAranha(11);

const hunters = [
    new Intensificador('Gon'),
    new Transmutador('Killua'),
    new Materializador('Kurapika')
];

console.log('\n--- Os Hunters atacam ---');
hunters.forEach(h => {
    h.atacar(alvo);
});
// Ex 1 - Duelo

class Pokemon {
    // atributo privado
    #vida;

    constructor(apelido, tipo, vidaInicial) {
        this.apelido = apelido; // público
        this.tipo = tipo;       // público
        this.#vida = vidaInicial;
    }

    get vida() {
        return this.#vida;
    }

    sofrerDano(pontos) {
        this.#vida -= pontos;
        // mantendo o limite min da vida pra 0
        if (this.#vida < 0) {
            this.#vida = 0;
        }
        console.log(`${this.apelido} ficou com ${this.#vida} de vida.`);
    }

    atacar(alvo) {
        console.log(`${this.apelido} dá um ataque genérico em ${alvo.apelido}!`);
        alvo.sofrerDano(10);
    }
}

class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Água', vidaInicial); 
    }

    atacar(alvo) {
        console.log(`${this.apelido} usa Jato de Água em ${alvo.apelido}!`);
        alvo.sofrerDano(20);
    }
}

class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial); 
    }

    atacar(alvo) {
        console.log(`${this.apelido} usa Chicote de Vinha em ${alvo.apelido}!`);
        alvo.sofrerDano(15);
    }
}

// --- main ---

const squirtle = new Squirtle('Zeca', 50);
const bulbasaur = new Bulbasaur('Folhinha', 30);

console.log('--- Duelo no Ginásio ---');
bulbasaur.atacar(squirtle);
squirtle.atacar(bulbasaur);
squirtle.atacar(bulbasaur);

console.log('\n--- Vida final com o getter ---');
console.log(`${squirtle.apelido}: ${squirtle.vida}`);
console.log(`${bulbasaur.apelido}: ${bulbasaur.vida}`)
// console.log(squirtle.#vida);
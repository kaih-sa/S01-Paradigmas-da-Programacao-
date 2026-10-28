// Ex 2 - Esquadrão 

class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error('As classes filhas devem implementar usarHabilidade()');
    }

    entrarEmCombate() {
        console.log(`${this.codinome} entra em combate com a pistola ${this.#pistola.modelo}. Habilidade: ${this.usarHabilidade()}`);
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return 'lança uma cortina de fumaça para bloquear a visão dos inimigos.';
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'dispara um dardo que revela a posição dos inimigos.';
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'avança em alta velocidade para eliminar os inimigos.';
    }
}

class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`--- Esquadrão ${this.nome} inicia a partida ---`);
        this.#agentes.forEach(a => {
            a.entrarEmCombate();
        });
    }

    listarControladores() {
        return this.#agentes.filter(a => a instanceof Controlador);
    }
}

// --- main ---

const brimstone = new Controlador('Brimstone', 'Classic');
const omen = new Controlador('Omen', 'Ghost');
const sova = new Iniciador('Sova', 'Sheriff');
const jett = new Duelista('Jett', 'Frenzy');

const esquadrao = new Esquadrao('Alfa', [brimstone, omen, sova, jett]);
esquadrao.iniciarPartida();

console.log('\n--- Controladores do esquadrão ---');
esquadrao.listarControladores().forEach(c => console.log(c.codinome));


const generico = new AgenteProtocolo('Agente Genérico', 'Classic');
// generico.entrarEmCombate();
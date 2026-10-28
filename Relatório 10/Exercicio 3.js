// Ex 3 - Cabana do Stan 

class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `Criatura: ${this.criatura} | Nível de perigo: ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas = []; 
    constructor(numero) {
        this.numero = numero;
    }

    anotar(criatura, nivelDePerigo) {
        // a Ficha é criada DENTRO do método
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`--- Diário número ${this.numero} ---`);
        this.#fichas.forEach(f => {
            console.log(f.descrever());
        });
    }
}
class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios = []; 

    constructor(dono) {
        this.dono = dono;
    }
    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`--- Cabana do Mistério, dono: ${this.dono} ---`);
        this.#funcionarios.forEach(f => {
            console.log(`${f.nome} - ${f.cargo}`);
        });
    }
}

// --- main ---

const diario = new DiarioMisterioso(3);
diario.anotar('Gnomos', 3);
diario.anotar('Manotauro', 4);
diario.anotar('Zumbis', 2);
diario.exibirFichas();

const soos = new Funcionario('Soos', 'Ajudante "faz tudo"');
const wendy = new Funcionario('Wendy', 'Caixa');

console.log('');
const cabana = new CabanaDoMisterio('Stan Pines');
cabana.contratar(soos);
cabana.contratar(wendy);
cabana.abrirAsPortas();

// COMPOSIÇÃO: As fichas são criadas dentro do método anotar() de DiarioMisterioso
// Elas só existem dentro do diário e vão sumir com com ele
// AGREGAÇÃO: Os funcionários (o Soos e a Wendy) são criados fora da Cabana e só recebidos no contratar()
// A Cabana guarda apenas as referências, então eles continuam existindo mesmo sem a Cabana
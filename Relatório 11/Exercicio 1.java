// Ex 1 - Castelo Animado

public class Main {
    public static void main(String[] args) {
        Morador howl = new Mago("Howl", "Transformação");
        Morador calcifer = new DemonioDoFogo("Calcifer");

        howl.apresentar();
        calcifer.apresentar();

        // Morador generico = new Morador("Generico");
    }
}

abstract class Morador {
    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void apresentar();
}

class Mago extends Morador {
    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome);
        this.feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println("Eu sou o mago " + getNome() + " e meu feitiço é " + feitico + ".");
    }
}

class DemonioDoFogo extends Morador {
    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println("Eu sou o demônio do fogo " + getNome() + " e faço o castelo andar!");
    }
}
// Ex 4 - Dungeon

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        // os monstros sendo feitos antes do cozinheiro
        Slime slime = new Slime("Slime Verde");
        Mandragora mandragora = new Mandragora("Mandrágora da Masmorra");

        Cozinheiro senshi = new Cozinheiro("Senshi", "ferro");
        senshi.adicionarIngrediente(slime);
        senshi.adicionarIngrediente(mandragora);

        senshi.servirBanquete();

        // Composição: A Panela é criada dentro do construtor do Cozinheiro, this.panela = new Panela(). Ela vai nascer com ele e dependente dele
        
        /* Agregação: Os monstros são criados fora de Cozinheiro e só recebidos em adicionarIngrediente(). 
           Assim O Cozinheiro guarda apenas as referencias, aí os monstros continuam existindo sem depender dele 
        */
    }
}

abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    // cada monstro tem uma receita
    public abstract String receita();
}

class Slime extends Monstro {
    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Cozinhar em fogo baixo até virar uma geleia doce";
    }
}

class Mandragora extends Monstro {
    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Cortar em fatias e fritar como temporá";
    }
}

class Panela {
    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}

class Cozinheiro {
    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        this.panela = new Panela(materialDaPanela); // a composição
        this.ingredientes = new ArrayList<>();      
    }

    public void adicionarIngrediente(Monstro monstro) {
        ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println("O cozinheiro " + nome + " usa uma panela de " + panela.getMaterial());
        for (Monstro monstro : ingredientes) {
            System.out.println(monstro.getNome() + ": " + monstro.receita());
        }
    }
}
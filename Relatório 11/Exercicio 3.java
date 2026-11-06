// Ex 3 - Avistamentos

import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        Alienigena serpo = new Alienigena("Serpo");
        EspiritoYoukai vovo = new EspiritoYoukai("Vovó Turbo");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();
        mapa.registrar("Hospital Abandonado", serpo);
        mapa.registrar("Túnel Antigo", vovo);

        mapa.investigar("Hospital Abandonado");
        mapa.investigar("Túnel Antigo");
        mapa.investigar("Praça Central"); 
    }
}

// definir o contrato
interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println("O alienígena " + nome + " surge e tenta levar alguém para a nave!");
    }
}

class EspiritoYoukai implements Sobrenatural {
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println("O espírito " + nome + " aparece correndo e assusta todo mundo!");
    }
}

class MapaDeAvistamentos {
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural ser = avistamentos.get(local);
        if (ser == null) {
            System.out.println("O local " + local + " está tranquilo.");
        } else {
            ser.manifestar();
        }
    }
}
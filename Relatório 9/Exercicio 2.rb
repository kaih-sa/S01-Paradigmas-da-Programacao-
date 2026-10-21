# Ex 2 - Orquestra 

# classe base
class Instrumentista
    attr_reader :nome, :instrumento
  
    def initialize(nome, instrumento)
      @nome = nome
      @instrumento = instrumento
    end
  
    def interpretar(peca)
      raise NotImplementedError, "As filhas devem implementar interpretar"
    end
  end
  
  # Não usa initialize próprio, já tem do pai
  class Solista < Instrumentista
    def interpretar(peca)
      puts "#{nome} toca #{instrumento} na peça #{peca} e conduz a melodia principal."
    end
  end
  
  # Também sem initialize
  class Acompanhador < Instrumentista
    def interpretar(peca)
      puts "#{nome} toca #{instrumento} na peça #{peca} e acompanha o ritmo do solista."
    end
  end
  
  class Regente
    def initialize(nome)
      @nome = nome
      @orquestra = []
    end
  
    def convocar(instrumentista)
      @orquestra << instrumentista
    end
  
    def reger(peca)
      puts "O regente #{@nome} rege a peça #{peca}."
      
      @orquestra.each do |i|
        i.interpretar(peca)
      end
    end
  
    # Devolvendo um novo array de textos
    def escalacao
      @orquestra.map { |i| "#{i.class}: #{i.nome}" }
    end
  end
  
  # --- main ---
  
  kousei = Solista.new("Kousei Arima", "Piano")
  kaori = Acompanhador.new("Kaori Miyazono", "Violino")
  regente = Regente.new("Sr. Takeshi")
  
  regente.convocar(kousei)
  regente.convocar(kaori)
  
  regente.reger("Sonata nº 1")
  
  puts "\n--- Escalação ---"
  regente.escalacao.each do |texto|
    puts texto
  end
  
 
  generico = Instrumentista.new("Fulano", "Flauta")
  # generico.interpretar("Sonata nº 1") 
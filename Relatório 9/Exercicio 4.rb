# Ex 4 - Depoimentos 

module Depoente
    def depor
      raise NotImplementedError
    end
  end
  
  module Detivel
    def ser_detido
      puts "#{nome} foi levado pela Scotland Yard."
    end
  end
  
  # Classe base, não está incluindo nenhum módulo
  class Envolvido
    attr_reader :nome
  
    def initialize(nome)
      @nome = nome
    end
  end
  
  class TestemunhaOcular < Envolvido
    include Depoente
  
    def depor
      puts "#{nome} diz: vi um homem de capa escura saindo da casa."
    end
  end
  
  class SuspeitoDoCrime < Envolvido
    include Depoente
    include Detivel
  
    def depor
      puts "#{nome} diz: na hora do crime eu estava jantando em outro bairro."
    end
  end
  
  class Investigacao
    def initialize(caso)
      @caso = caso
      @envolvidos = []
    end
  
    def registrar(envolvido)
      @envolvidos << envolvido
    end
  
    def ouvir_todos
      puts "--- Caso: #{@caso} ---"
      @envolvidos.each do |e|
        e.depor
      end
    end
  
    def acionar_scotland_yard
      puts "\n--- Scotland Yard ---"
      detiveis = @envolvidos.select { |e| e.respond_to?(:ser_detido) }
      detiveis.each do |e|
        e.ser_detido
      end
    end
  end
  
  # --- main ---
  
  testemunha = TestemunhaOcular.new("Sra. Hudson")
  suspeito1 = SuspeitoDoCrime.new("Moriarty")
  suspeito2 = SuspeitoDoCrime.new("Coronel Moran")
  
  investigacao = Investigacao.new("O Mistério de Baker Street")
  investigacao.registrar(testemunha)
  investigacao.registrar(suspeito1)
  investigacao.registrar(suspeito2)
  
  investigacao.ouvir_todos
  investigacao.acionar_scotland_yard
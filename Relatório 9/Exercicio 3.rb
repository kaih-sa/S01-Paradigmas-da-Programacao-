# Ex 3 - D-Mail 

class PhoneWave
    def enviar_dmail(mensagem)
      puts "D-Mail: #{mensagem}"
      puts "A mensagem foi enviada para o passado!"
    end
  end
  
  class MembroDoLab
    attr_reader :numero, :nome
  
    def initialize(numero, nome)
      @numero = numero
      @nome = nome
    end
  end
  
  class LaboratorioDeGadgets
    def initialize
      @phonewave = PhoneWave.new # Tá dentro do lab
      @membros = []
    end
  
    # Recebe um membro que já foi criado fora
    def admitir(membro)
      @membros << membro
      puts "Admitido: Lab Mem #{membro.numero} - #{membro.nome}"
    end
  
    def experimento(mensagem)
      puts "\n--- Experimento ---"
      @membros.each do |m|
        puts "Presente: Lab Mem #{m.numero} - #{m.nome}"
      end
      @phonewave.enviar_dmail(mensagem)
    end
  end
  
  # --- main ---
  
  okabe = MembroDoLab.new(1, "Rintaro Okabe")
  mayuri = MembroDoLab.new(2, "Mayuri Shiina")
  
  lab = LaboratorioDeGadgets.new
  lab.admitir(okabe)
  lab.admitir(mayuri)
  
  lab.experimento("Não vá ao laboratório hoje!")
  
  # Composição: O PhoneWave é criado dentro do initialize de LaboratorioDeGadgets 
  # (@phonewave = PhoneWave.new). Só existe dentro do laboratório e some com ele
  # Agregação: Os membros (okabe e mayuri) são criados fora do laboratório
  # O laboratório só vai guardar as referências, por isso os membros continuam existindo 
  # mesmo sem o laboratório.
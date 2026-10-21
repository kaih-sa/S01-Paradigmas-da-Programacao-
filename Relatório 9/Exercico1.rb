# Ex 1 - O Cardápio 
class CoquetelAfterlife
  # nome lido, mas não alterado
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    @_preco = preco # não passa pelo setter
  end

  # getter 
  def preco
    @_preco
  end

  # setter limitado
  def preco=(valor)
    if valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preço inválido!"
    end
  end


  def ficha
    "Drink: #{@nome} | Preço: #{@_preco}"
  end
end

class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

 
  def ficha
    super + " | Lenda: #{@lenda}"
  end
end

# --- main ---

drinks = []
drinks << CoquetelAfterlife.new("Cerveja Night City", 20)
drinks << DrinkDeLenda.new("Johnny Silverhand", 150, "Johnny Silverhand")
drinks << DrinkDeLenda.new("Rogue Special", 90, "Rogue Amendiares")

puts "--- Cardápio ---"
drinks.each do |d|
  puts d.ficha
end

puts "\n--- Reajustando o preço de um drink de lenda ---"
drink = drinks[1]
drink.preco = 500 
drink.preco = 80  
puts drink.ficha


# drinks[0].nome = "Outro nome"
print ("Insira a quantidade de números da tabela: ")
local N = tonumber(io.read())
local tabela = {}

function filtrarMaiores(tabela, limite) 
    local tabela_de_maiores = {}
    for i = 1, #tabela do
        if tabela[i] > limite then
            table.insert(tabela_de_maiores, tabela[i])
        end
    end 
    return tabela_de_maiores
end

for i = 1, N do
    print("Insira " .. i .. "º " .. " número: ")
    local entrada = tonumber(io.read())
    table.insert(tabela, entrada)
end 

print("Insira o valor de limite: ")
local K = tonumber(io.read())

resultado = filtrarMaiores(tabela, K) 

print("Números maiores que ".. K .. ":")
for i = 1, #resultado do
    print(resultado[i])
end 




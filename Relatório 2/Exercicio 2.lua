print ("Insira a quantidade de elementos da tabela: ")
local N = tonumber(io.read())
local tabela = {}

function contarOcorrencias(tabela, alvo) 
    local contador = 0
    for i = 1, #tabela do
        if tabela[i] == alvo then
            contador = contador + 1
        end
    end 
    return contador
end

for i = 1, N do
    print("Insira " .. i .. "º " .. " número: ")
    local entrada = tonumber(io.read())
    table.insert(tabela, entrada)
end 

print("Insira número a ser buscado: ")
local X = tonumber(io.read())

resultado = contarOcorrencias(tabela, X) 

print("O número " .. X .. " aparece " .. resultado .. " vez(es) na tabela.")


print ("Insira o expoente inicial:")
local M = tonumber(io.read()) 
print ("Insira o expoente final:")
local N = tonumber(io.read())
print ("Insira a base:")
local base = tonumber(io.read())

function gerarTabelaPotencias(inicio, fim, base)

    for i = inicio, fim do 
        local resultado = base ^ i
        print (base ..' ^ '.. i .. " = " .. resultado)
    end
    return
end 

gerarTabelaPotencias(M, N, base)


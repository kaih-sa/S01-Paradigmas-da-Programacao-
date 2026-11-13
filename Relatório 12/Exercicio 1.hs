-- Ex 1 O Café
data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco _) = nome ++ " - R$ " ++ show preco

forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise        = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido leite (Cafe _ preco _) =
  if leite
    then preco + 2.0
    else preco

main :: IO ()
main = do
  let forte = Cafe "Expresso Sumi" 18.0 9
  let equilibrado = Cafe "Café da Casa" 14.5 6
  let suave = Cafe "Café Suave Futaba" 12.0 3

  putStrLn "--- Cafés do dia ---"
  putStrLn (descrever forte ++ " | " ++ forca forte)
  putStrLn (descrever equilibrado ++ " | " ++ forca equilibrado)
  putStrLn (descrever suave ++ " | " ++ forca suave)

  putStrLn "--- Preço do Café da Casa ---"
  print (precoDoPedido True equilibrado)
  print (precoDoPedido False equilibrado)
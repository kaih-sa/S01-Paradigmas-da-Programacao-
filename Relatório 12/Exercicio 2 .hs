-- Ex 2 Kiki 

pesoMaximo :: Double
pesoMaximo = 20.0
-- pesoMaximo = 30.0

data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }

descrever :: Encomenda -> String
descrever e = destinatario e ++ " - " ++ show (peso e) ++ " kg - frete R$ " ++ show (frete e)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\e -> peso e <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
  let encomendas =
        [ Encomenda { destinatario = "Padaria do Osono", peso = 5.0, frete = 12.0 }
        , Encomenda { destinatario = "Sra. da Torta", peso = 25.0, frete = 30.0 }
        , Encomenda { destinatario = "Tombo", peso = 8.5, frete = 15.0 }
        , Encomenda { destinatario = "Pintora Ursula", peso = 40.0, frete = 45.0 }
        ]
  let leves = cabemNaVassoura encomendas

  putStrLn "--- Todas as encomendas ---"
  mapM_ putStrLn (map descrever encomendas)
  putStrLn "--- Cabem na vassoura ---"
  mapM_ putStrLn (map descrever leves)
  putStrLn ("Total de fretes: R$ " ++ show (totalDeFretes leves))
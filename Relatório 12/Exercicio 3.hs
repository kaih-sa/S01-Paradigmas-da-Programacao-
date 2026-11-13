-- Ex 3 Caderninho

data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "O caderno está vazio."
esbocoMaisRecente (e:_) = titulo e ++ " (" ++ tecnica e ++ ")"

contarEsbocos :: [Esboco] -> Int
contarEsbocos []        = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando []        = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

main :: IO ()
main = do
  let caderno =
        [ Esboco "Ruínas da Torre" "Nanquim" 5
        , Esboco "Criatura do Pântano" "Carvão" 8
        , Esboco "Paisagem Sombria" "Grafite" 3
        ]

  putStrLn "--- Caderno ---"
  putStrLn ("Mais recente: " ++ esbocoMaisRecente caderno)
  putStrLn ("Esboços: " ++ show (contarEsbocos caderno))
  putStrLn ("Horas desenhando: " ++ show (horasDesenhando caderno))

  putStrLn "--- Caderno vazio ---"
  putStrLn (esbocoMaisRecente [])

  let cadernoNovo = Esboco "Gárgula" "Carvão" 4 : caderno

  putStrLn "--- Caderno novo ---"
  putStrLn ("Mais recente: " ++ esbocoMaisRecente cadernoNovo)
  putStrLn ("Esboços: " ++ show (contarEsbocos cadernoNovo))
  putStrLn "--- Caderno anterior (continua igual) ---"
  putStrLn ("Mais recente: " ++ esbocoMaisRecente caderno)
  putStrLn ("Esboços: " ++ show (contarEsbocos caderno))

  -- putStrLn (titulo (head []))





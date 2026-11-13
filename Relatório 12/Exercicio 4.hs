-- Ex 4 Chihiro


data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)

data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }

descrever :: Atendimento -> String
descrever a = cliente a ++ " - " ++ servico a ++ " - " ++ show (etapa a)

concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
  let semRosto = Atendimento { cliente = "Sem Rosto", servico = "Banho de Ervas", valor = 50.0, etapa = NaFila }
  let deusDoRio = Atendimento { cliente = "Deus do Rio", servico = "Banho Especial ", valor = 120.0, etapa = NoBanho }
  let rabanete = Atendimento { cliente = "Espírito do Rabanete", servico = "Banho Simples", valor = 30.0, etapa = NaFila }

  let original = [semRosto, deusDoRio, rabanete]
  let depois = [semRosto, concluir deusDoRio, concluir rabanete]

  putStrLn "--- Lista original ---"
  mapM_ putStrLn (map descrever original)
  putStrLn ("Arrecadado: R$" ++ show (arrecadado original))

  putStrLn "--- Lista depois de concluir ---"
  mapM_ putStrLn (map descrever depois)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado depois))


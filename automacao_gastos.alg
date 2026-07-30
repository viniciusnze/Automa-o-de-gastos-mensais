algoritmo "AutomacaoDeGastos"
// Versão em pseudocódigo (VisuAlg) da lógica do projeto de
// automação de gastos. Como o VisuAlg não lê arquivos CSV,
// as transações estão fixas em vetores para simular o extrato.

var
   descricoes: vetor[1..10] de caractere
   valores: vetor[1..10] de real
   categorias: vetor[1..10] de caractere
   i, n: inteiro
   totalGasto, totalCategoria: real
   descricaoMaiuscula: caractere

inicio

   n <- 10

   // --- Simulando o extrato (na v1 em Python isso vem do CSV) ---
   descricoes[1] <- "IFOOD RESTAURANTE XYZ"
   valores[1] <- -45.90

   descricoes[2] <- "UBER TRIP"
   valores[2] <- -18.50

   descricoes[3] <- "SUPERMERCADO PAO DE ACUCAR"
   valores[3] <- -230.45

   descricoes[4] <- "NETFLIX.COM"
   valores[4] <- -39.90

   descricoes[5] <- "POSTO IPIRANGA"
   valores[5] <- -150.00

   descricoes[6] <- "FARMACIA SAO JOAO"
   valores[6] <- -67.30

   descricoes[7] <- "99 APP"
   valores[7] <- -22.00

   descricoes[8] <- "AMAZON MARKETPLACE"
   valores[8] <- -89.99

   descricoes[9] <- "ALUGUEL IMOVEL"
   valores[9] <- -1200.00

   descricoes[10] <- "CINEMARK SHOPPING"
   valores[10] <- -60.00

   // --- Categorização por palavra-chave ---
   para i de 1 ate n faca
      descricaoMaiuscula <- maiusc(descricoes[i])

      se (pos("IFOOD", descricaoMaiuscula) > 0) ou (pos("RESTAURANTE", descricaoMaiuscula) > 0) entao
         categorias[i] <- "Alimentacao"
      senao
         se (pos("UBER", descricaoMaiuscula) > 0) ou (pos("99", descricaoMaiuscula) > 0) ou (pos("POSTO", descricaoMaiuscula) > 0) entao
            categorias[i] <- "Transporte"
         senao
            se (pos("SUPERMERCADO", descricaoMaiuscula) > 0) entao
               categorias[i] <- "Mercado"
            senao
               se (pos("NETFLIX", descricaoMaiuscula) > 0) ou (pos("SPOTIFY", descricaoMaiuscula) > 0) entao
                  categorias[i] <- "Assinaturas"
               senao
                  se (pos("FARMACIA", descricaoMaiuscula) > 0) entao
                     categorias[i] <- "Saude"
                  senao
                     se (pos("ALUGUEL", descricaoMaiuscula) > 0) ou (pos("CONDOMINIO", descricaoMaiuscula) > 0) entao
                        categorias[i] <- "Moradia"
                     senao
                        se (pos("CINEMARK", descricaoMaiuscula) > 0) ou (pos("SHOPPING", descricaoMaiuscula) > 0) entao
                           categorias[i] <- "Lazer"
                        senao
                           categorias[i] <- "Outros"
                        fimse
                     fimse
                  fimse
               fimse
            fimse
         fimse
      fimse
   fimpara

   // --- Exibindo cada transação já categorizada ---
   escreva("=== Transacoes categorizadas ===")
   escreval("")
   para i de 1 ate n faca
      escreva(descricoes[i], " | ", categorias[i], " | R$ ", valores[i])
      escreval("")
   fimpara

   // --- Somando o total gasto ---
   totalGasto <- 0
   para i de 1 ate n faca
      totalGasto <- totalGasto + valores[i]
   fimpara

   escreval("")
   escreva("TOTAL GASTO: R$ ", totalGasto*(-1))

fimalgoritmo

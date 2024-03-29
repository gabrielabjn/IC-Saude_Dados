# Instale e carregue os pacotes
install.packages("dplyr")
install.packages("readr")
install.packages("readxl")
install.packages("openxlsx")
library(readxl)
library(dplyr)
library(readr)
library(openxlsx)

setwd("C:/Users/55229/Desktop/bolsa_alfredo")
getwd()

# # Leia a tabela de rela��o de c�digos de munic�pios e regi�es de sa�de
# tabela_ibge <- read_excel("codigos_ibge.xlsx") # Substitua pelo caminho do seu arquivo
# 
# # Leia o arquivo do Excel
# dados_municipios <- read_excel("idh_ivs.xlsx") # Substitua pelo caminho do seu arquivo
# 
# # Fa�a a jun��o dos dados
# dados_com_regiao <- left_join(dados_municipios, tabela_ibge, by = c("Munic�pio com 6 d�gitos" = ""))
# 
# # Agora, 'dados_com_regiao' conter� as linhas identificadas pelos c�digos de munic�pios, juntamente com a informa��o da regi�o de sa�de.
# 
# 


# Ler os arquivos
codigo_ibge <- read_excel("codigos_ibge.xlsx")
macrorregiao <- read_excel("macrorreg.xlsx")
idh_ivs <- read_excel("idh_ivs.xlsx")

idh_ivs$`Munic�pio com 6 d�gitos`<-as.numeric(idh_ivs$`Munic�pio com 6 d�gitos`)
macrorregiao$Regiao<-as.numeric(macrorregiao$Regiao)


# Juntar os data frames
result <- idh_ivs %>%
  left_join(codigo_ibge, by = c("Munic�pio com 6 d�gitos" = "municipio")) %>%
  left_join(macrorregiao, by = c("regiao de saude" = "Regiao"))

# Salvar o resultado
write.xlsx(result, "idh_ivs_com_codigos_atualizado.xlsx")

# Programando em R 

Tradução do Curso R_Programming_E-swirl

Primeira versão em português para uso em curso introdutório de programação em R. A versão desse repo contem uma alteração para submissão do log da sessão para uma planilha do Google Docs. 

#Para configurar o envio. 
O envio é feito usando o pacote googlesheets. É necessário obter o número gs.key da planilha e substituir no arquivo CustomTests.R


#### Lições originais - versões - (tradutores) - data da tradução

* Basic_Building_Blocks - Blocos Básicos (traduzido por Ariel Levy - Rev. Rog B Alves)
* Workspace_and_Files - Espaço de Trabalho e Arquivos (trad. por Rog B Alves) - 02nov2016
* Sequences_of_Numbers - Sequências Numéricas (trad. por Rog B Alves) - 03nov2016
* Vectors - Vetores - Vetores (trad. Ariel Levy - Rev. Rog B Alves) - 07nov2016
* Missing_Values
* Subsetting_Vectors
* Matrices_and_Data_Frames
* Logic- Lógica (trad. Carlos Tonhatti) 18julho2018 
* Functions
* lapply_and_sapply
* vapply_and_tapply
* Looking_at_Data- Olhando os dados (trad. Carlos Tonhatti) 18jul2018
* Simulation
* Dates_and_Times
* Base_Graphics



#### Versão para teste:

Para testar a versão em português:
# instalar o pacote swirl e outros pacotes necessários.
install.packages("swirl")
install.packages("googlesheets")
install.packages("base64enc")
install.packages("httr")

# instalar o curso diretamente do gitHub
library(swirl)
install_course_github("tomatebio","Programando_em_R")



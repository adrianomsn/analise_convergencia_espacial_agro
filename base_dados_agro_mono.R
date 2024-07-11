### ---------- Teste da base de dados da monografia ----------
#
#
# Limpa o ambiente

rm(list = ls())

#
#
# Criando vetor com o nome dos pacotes necessarios 
pacotes = c(
  "dplyr",   
  "rio",     
  "stringr", 
  "tidyr",  
  "gtools",
  "ipeadatar",
  "tidyverse",
  "REAT",
  "spatialreg",
  "spdep",
  "sf")  

# Carrega ou instala os pacotes
for (x in pacotes) {
  if(!x %in% installed.packages()) {
    install.packages(x, repos = "http://cran.us.r-project.org")
  }
}

lapply(pacotes, require, character.only = T)

rm(pacotes, x)



# Criando caminho dos dados da mono
monografia<- ("C:/Users/super/OneDrive - Universidade Federal do Ceará/Área de Trabalho/Miscc/Misc/Monografia/db/")

# Importa a base em .xls extraida do IPEA E IBGE
# Essa base esta com preços a nivel do ano de 2010 por isso a escolha da base contida no IPEA
# Ao em vez da base que estava contida no IPECE que tinha anos correntes
vab_agro <- import(paste0(monografia, "PIB_Municipal_(valor_adicionado _a_preços básicos)-agropecuária-(IPC2010).xls"))
pop_ce <- import(paste0(monografia, "populacao_residente_estimada_ce.xlsx"))


# Checagem de valores NA nas bases
sum(is.na(pop_ce))
sum(is.na(vab_agro))

# temos valores NAs para as bases 12, 9 e 84 respectivamente
#
#

# ------------ Preparando os dados de 2022 sobre populacao -------------- 
# Seleciona e renomeia apenas as variaveis necessarias
#
#
#
#
#
#
#
#

# Use o merge para combinar os data frames com base na coluna "municipio"


# teste<- cbind(pop_ce, vab_agro)


base_unida<- full_join(x = vab_agro, y = pop_ce, by = "Codigo")

base_unida<- base_unida %>% 
  select(-Municipio, -Sigla) %>% 
  rename(municipio = "Município") %>% 
  relocate(municipio, .before = Codigo)


# Obtendo o VA per capita (vab) agropecuario para municipios do ceará
base_per_cap <- base_unida %>% 
  mutate(vab_per_cap_02 = vab_2002/pop_2002,vab_per_cap_03 = vab_2003/pop_2003,
         vab_per_cap_04 = vab_2004/pop_2004,vab_per_cap_05 = vab_2005/pop_2005,
         vab_per_cap_06 = vab_2006/pop_2006,vab_per_cap_07 = vab_2007/pop_2007,
         vab_per_cap_08 = vab_2008/pop_2008,vab_per_cap_09 = vab_2009/pop_2009,
         vab_per_cap_10 = vab_2010/pop_2010,vab_per_cap_11 = vab_2011/pop_2011,
         vab_per_cap_12 = vab_2012/pop_2012,vab_per_cap_13 = vab_2013/pop_2013,
         vab_per_cap_14 = vab_2014/pop_2014,vab_per_cap_15 = vab_2015/pop_2015,
         vab_per_cap_16 = vab_2016/pop_2016,vab_per_cap_17 = vab_2017/pop_2017,
         vab_per_cap_18 = vab_2018/pop_2018,vab_per_cap_19 = vab_2019/pop_2019,
         vab_per_cap_20 = vab_2020/pop_2020) %>% 
  select(municipio, Codigo, vab_per_cap_02:vab_per_cap_20)

# Como todos os valores monetarios da variavel VA do setor agropecuario
# sao valores na casa de mil reais, farei multiplicacao para retificar o valor
base_final<- base_per_cap %>% 
  mutate(vab_pc_02 = vab_per_cap_02*1000,vab_pc_03 = vab_per_cap_03*1000,
         vab_pc_04 = vab_per_cap_04*1000,vab_pc_05 = vab_per_cap_05*1000,
         vab_pc_06 = vab_per_cap_06*1000,vab_pc_07 = vab_per_cap_07*1000,
         vab_pc_08 = vab_per_cap_08*1000,vab_pc_09 = vab_per_cap_09*1000,
         vab_pc_10 = vab_per_cap_10*1000,vab_pc_11 = vab_per_cap_11*1000,
         vab_pc_12 = vab_per_cap_12*1000,vab_pc_13 = vab_per_cap_13*1000,
         vab_pc_14 = vab_per_cap_14*1000,vab_pc_15 = vab_per_cap_15*1000,
         vab_pc_16 = vab_per_cap_16*1000,vab_pc_17 = vab_per_cap_17*1000,
         vab_pc_18 = vab_per_cap_18*1000,vab_pc_19 = vab_per_cap_19*1000,
         vab_pc_20 = vab_per_cap_20*1000) %>% 
  select(municipio, Codigo, vab_pc_02:vab_pc_20) %>% 
  rename(codigo = "Codigo")
# Defina os nomes das colunas a serem transformadas
colunas <- paste0("vab_per_cap_", sprintf("%02d", 2:20))

# # Crie uma função para multiplicar por 1000 e alterar o nome da coluna
# multiplicar_e_renomear <- function(df, colunas) {
#   df %>%
#     mutate(across(all_of(colunas), ~ . * 1000, .names = "vab_pc_{str_extract(.col, '\\d{2}')}")
#     ) %>%
#     select(municipio, Codigo, starts_with("vab_pc_")) %>%
#     rename(codigo = "Codigo")
# }
# 
# # Aplique a função ao seu dataframe
# base_final <- multiplicar_e_renomear(base_per_cap, colunas)

# uniao das bases de populacao e pib per per capita apenas para fins de visualizacao

base_unida<- full_join(x = base_per_cap, y = pop_ce, by = "Codigo")

base_unida<- base_unida %>% 
  select(-Municipio) %>% 
  rename(codigo = "Codigo") %>% 
  relocate(municipio, .before = codigo)



# Calcula a taxa de crescimento do VA do setor agropecuario
# Growth rate = ((Present value (vab_pc_20) - Past value(vab_pc_02))/ Past Value(vab_pc_02) * 100)/ Number of years (18))
# N = periodo analisado 2002 a 2020 = 19 anos
# Valor Presente = valor adicionado 2020 (fim do periodo)
# Valor passado = valor adicionado 2002 (inicio do periodo)

# Como estava nao muito claro no artigo base sobre como era calculada a taxa de crescimento usada/
# como variavel dependente, nao havia certeza da decisao de usar taxa de crescimento simples ou media 
# do periodo mas apos ler a monografia da Analice, na secao de metodologia ela utiliza 
# "log natural da razao da produtividade MEDIA do periodo (var depepente do modelo dela)
# como estamos fazendo analises semelhantes, usando o mesmo modelo e mudando basicamente a variavel
# decidi com base nisso utilizar a taxa de crescimento media do periodo

# variacao media anual
# tx_var <- base_final %>%
#   mutate(tx_var = (((vab_pc_20 - vab_pc_02) / vab_pc_02) *100 )/19) %>%
#   select(municipio, codigo, tx_var)

# variacao total entre tempo t e tempo t-1
tx_var <- base_final %>%
  mutate(tx_var = (((vab_pc_20 - vab_pc_02) / vab_pc_02) *100 )) %>%
  select(municipio, codigo, tx_var)
tx_var[, 3] <- round(tx_var[, 3], digits = 2)

# Agora tirei outra duvida, segundo o trabalho da ufscar sobre analise conv espacial
# a autora utiliza como variavel dependente, como dito na secao de metodologia da mesma
# a variavel dependente e a sua taxa de crescimento do Valor adicionado per cap do setor para o periodo analisado
# e a variavel explicativa e o Valor adicionado per cap do setor no ano inicial do periodo
# Dessa forma,
# na equacao do modelo estimado, temos que ela descreve: 
#
#       ln(VA t/ VA t-n) = α + β  ln( VA𝑖, t-n) + 𝜀𝑖
# 
#
# Entao dessa forma, eu so preciso fazer o calculo abaixo para obter ln(VA t/ VA t-n)
# que seria a nossa variavel dependente aqui nesse caso?
# Creio que sim, mas nao tenho 100% ctz

ln_razao_va <- base_final %>% 
  mutate(razao_va = (vab_pc_20/vab_pc_02)) %>%
  select(municipio, codigo, razao_va)

# log da razao dos valores adicionados per capita 2020/2002

ln_razao_va<- ln_razao_va %>% 
  mutate(ln_razao_va = log(razao_va)) %>% 
  select(municipio, codigo, razao_va, ln_razao_va)

# Checar com o professor se esta ok, e se estiver ok substituiremos o que foi calculado
# no objeto acima em `tx_cresc`


# Teste da funcao rca que estima a convergencia beta entre duas variaveis per capitas
# a<- rca(base_final$vab_pc_02, 2002, base_final$vab_pc_20, 2020)
# print(a)

# Nao irei utilizar essa funcao para estimacao da convergencia beta pelo fato de
# a funcao utiliza a variavel pib pc em dois pontos separados no tempo
# para esse modelo do sala i martin, os autores nao fazem uso apenas da variavel pc
# mas sim da taxa de crescimento como variavel dependente e a variavel pc como explicativa

# Cria um resultado de variaveis descritivas basicas
resumo<- summary(ln_razao_va)

# Imprime o resultado criado anteriormente
print(resumo)



# DUVIDA
# Se o ponto levantado na linha 137 estiver correto, so precisarei calcular 
# o log da var per capita inicial
# calculando ln das variaveis para estimar

# ln_tx <-base_final %>% 
#   mutate( ln_tx = log(base_final$vab_pc_02)) %>% 
#   select( municipio, codigo, ln_tx)

ln_va_pc_2002 <- base_final %>% 
  mutate( ln_va_pc_2002 = log(vab_pc_02)) %>% 
  select( municipio, codigo, vab_pc_02, ln_va_pc_2002)

# ln_tx[, 3] <- round(ln_tx[, 3], digits = 3)            
# ln_va_2002[, 3] <- round(ln_va_2002[, 3], digits = 3)            


# openxlsx::write.xlsx(ln_tx, paste0(monografia, 'ln_tx.xlsx'))
# openxlsx::write.xlsx(ln_va_02, paste0(monografia, 'ln_va_02.xlsx'))


# exportando as bases

list  <- list('base_final'  = base_final)
list2 <- list('base_unida'  = base_unida)
list3 <- list('ln_razao_va' = ln_razao_va)
list4 <- list('ln_va_2002'  = ln_va_pc_2002)
list5 <- list('tx_var'  = tx_var)

# openxlsx::write.xlsx(list, paste0(monografia, 'base_final.xlsx'))
# openxlsx::write.xlsx(list2, paste0(monografia, 'base_unida.xlsx'))
# openxlsx::write.xlsx(list3, paste0(monografia, 'ln_razao_va.xlsx'))
# openxlsx::write.xlsx(list4, paste0(monografia, 'ln_va_2002.xlsx'))
# openxlsx::write.xlsx(list5, paste0(monografia, 'taxa_var_2002_2020.xlsx'))

# removendo bases para limpar ambiente
rm(base_unida, base_per_cap, list, list2, list3, list4)









# A PARTIR DAQUI VOU TENTAR REPLICAR A MODELAGEM E ESTIMAÇAO DO MODELO ESPACIAL DA MONO
# POR MEIO DO R AO EM VEZ DO GEODA




# carrega a matriz de pesos espaciais gerada no geoda
matriz_pesos <-
  read.gal(
    "C:/Users/super/OneDrive - Universidade Federal do Ceará/Área de Trabalho/Miscc/Misc/Monografia/Arquivos da mono revisados/CE_Municipios_2022_Atualizado/CE_Municipios_2022.gal"
  )


# carrega o shapefile
dados <-
  st_read(
    "C:/Users/super/OneDrive - Universidade Federal do Ceará/Área de Trabalho/Miscc/Misc/Monografia/Arquivos da mono revisados/CE_Municipios_2022_Atualizado/CE_Municipios_2022.shp"
  )


# ------ Criando uma matriz de pesos ------

# carregando dados espaciais
dados_sf <- st_read("C:/Users/super/OneDrive - Universidade Federal do Ceará/Área de Trabalho/Miscc/Misc/Monografia/Arquivos da mono revisados/CE_Municipios_2022_Atualizado/CE_Municipios_2022.shp")

# Cria uma vizinhança baseada na proximidade rainha
vizinhanca <- poly2nb(dados_sf, queen = TRUE)






# Resumo do modelo
summary(modelo)



# Leia a matriz de pesos espaciais do arquivo .gal
matriz_pesos <- read.gal("seu_arquivo_weights.gal")

# Análise de disparidades regionais do setor agrpecuário no Ceará: Um processo de Convergência Espacial

## Objetivo Geral
- Investigar se ao longo do período de 2002 a 2020 houve redução das disparidades regionais do PIB no setor agropecuário;

## Objetivos específicos
- Conduzir uma análise exploratória dos dados espaciais (AEDE) do setor:
    - Analisar e entender tendências ao longo do tempo do PIB per capita do setor agropecuário;
    - Analisar e entender como se comporta as taxas de crescimento do PIB per capita do setor agropecuário;
    - Entender como o PIB per capita e a taxa de crescimento do PIB do setor varia de acordo com a região;
    - Analisar e investigar tendências de produção do setor agropecuário e como eles se comportaram ao longo do tempo;
- Investigar a hipótese de autocorrelação espacial local ou/e global utilizando I de Moran;
- Identificar Clusters Espaciais utilizando Indicador Local de Associação Espacial (LISA);
- Estimar modelos de regressão espacial, afim verificar se houve um processo de convergência-β absoluta, e portanto, redução das disparidades regionais.


## Metodologia utilizada
Inicialmente foi executada um análise exploratória a fim de investigar e entender tendências e extrair insighs sobre a variável PIB do setor agropecuário ao longo do período de 2002 a 2020. Tão como, identifica possíveis pontos de agrupamentos espaciais (clusters) e suas peculiaridades.
Posteriormente, determina-se o tipo de matriz de peso espacial a ser utilizada, com o objetivo de verificar existe alguma influência ou impacto espacial de regiões i e suas regiões vizinhas j. Essa matriz utiliza o critério de próximidade do tipo Rainha de ordem 1 (Alusão ao tipo de movimentação da peça Rainha no Xadrez).

### Representação visual da matriz Rainha de Ordem 1
![image](https://github.com/user-attachments/assets/8f749884-86bf-4929-94bc-a43bd551f6d0)

### Notação matemática da matriz Rainha de Ordem 1 (para Nerds)
![image](https://github.com/user-attachments/assets/a0e53a37-44c7-437c-841c-debf2ab72458)

Onde, temos: 1 = Vizinhos e 0 = Não vizinhos.

Tendo a matriz espacial definida, podemos de fato prosseguir para a aplicação da estatistíca I de Moran. Esse teste é utilizado com objetivo de verificar a existência de um fenômeno chamado autocorrelação espacial através do grau de intensidade de associação espacial da variável em questão para aquele espaço geográfico.
### Notação matemática do I de Moran (para Nerds)

![image](https://github.com/user-attachments/assets/ae81c98e-a12d-4858-827e-e8d53cbc5599)

Dessa forma, temos:
- n é quantidade de municípios;
- Wz é o valor determinado de regiões vizinhas;
- z é a variável de análise, no caso o PIB per capita agropecuário;
- S₀ é um somatório dos elementos da matriz espacial (W).

A partir do teste da estatística I de Moran podemos avaliar o resultados, caso o valor observa seja superior ao valor esperado temos autocorrelação espacial positiva, do contrário autocorrelação espacial negativa.
O que isso significa de fato? Caso haja autocorrelação espacial positiva, isso determina basicamente que, municípios que tenham PIB per capita agropecuário  elevado estarão agrupados com outros municípios de PIB elevado. No caso de autocorrelação espacial negativa, os municípios de diferentes valores de PIB estarão agrupados de forma mais heterogênea.

Com a conclusão dos testes de Moran, iniciamos a ultima etapa dessa AEDE que é a aplicação dos Indicadores Locais de Associação Espacial (LISA), que nada mais é que uma forma de investigar padrões espaciais de maneira local, associações estas que não podem ser captadas por testes globais como o I de Moran. Esse agrupamentos ou padrões espaciais seguem a seguinte premissa:

## Representação gráfica dos agrupamentos com base no Diagrama de dispersão espacial de Moran

![image](https://github.com/user-attachments/assets/56ff1505-f5bc-4907-b8f8-642f700aa4bd)

Por fim, após toda análise exploratória de estatísticas descritivas, medidas de dispersão para encontrar padrões nos dados, além dos testes de interação espacial para entender a intensidade que o território se relaciona ou influência as variáveis, podemos finalmente passar para análise final que é feita através da estimação de modelos de regressão espacial, nada mais é que algoritmos de regressão linear que incorporam o fator espacial, ou seja, conseguem verificar a presença de autocorrelação espacial das variáveis analisadas.

A análise será feita através da estimação de 3 modelos de regressão, a partir disso feito um comparativo para entender o cenário e necessidades específicas a partir dos resultados e qual direcionamento será escolhido da a situação.

### Representação matemática do algoritmo de Mínimos Quadrados Ordinários - MQO 
![image](https://github.com/user-attachments/assets/52ad576e-9971-4da3-ab99-9a2a752b436a)


### Representação matemática do algoritmo de Erro Espacial - SEM

![image](https://github.com/user-attachments/assets/c29e266d-2071-4c4a-aa7f-dfd39ea50d62)

### Representação matemática do algoritmo de Defasagem Espacial - SAR 

![image](https://github.com/user-attachments/assets/6914183f-edb2-4814-b20d-e263b725ba65)


# Análise Exploratória dos Dados Espaciais

## Distribuição Espacial do PIB per capita agro em 2002
![image](https://github.com/user-attachments/assets/4f459253-ca8d-4d87-92dd-8484a6e18fc9)

Observando o comportamento de distribuição do VAB a nível de indivíduo no início do período (2002). Pode-se perceber uma lacuna considerável entre o menor e o maior valor de VAB per capita encontrado, confirmando um cenário de grande disparidade inter-regional inicialmente. Entre os municípios com as tonalidades mais escuras do mapa, tem-se os maiores patamares encontrados para o VAB per capita. De acordo com a separação por regiões de planejamento conforme IPECE (2015), observa-se os principais agrupamentos de altos valores nas seguintes regiões: Serra da Ibiapaba com 4 municípios (Tianguá, Ibiapina, Guaraciaba do Norte e Ubajara), Vale do Jaguaribe com 5 munícipios (Jaguaretama, Jaguaribara, Alto Santo, São João do Jaguaribe e Potiretama) e por fim Sertão de Crateús/Inhamuns com 4 municípios (Independência, Novo Oriente, Quiterianópolis e Parambu). A seguir, citando as regiões contendo os menores valores, temos diversos municípios da região da Grande Fortaleza (Fortaleza, Maracanaú, Caucaia, Itaitinga, Pacatuba), mas também na região do Sertão de Sobral (Sobral, Massapê, Irauçuba, Miraíma). Respectivamente das regiões citadas, a região metropolitana da Grande Fortaleza demonstra alto grau de urbanização, já em relação a região do Sertão de Sobral temos diversos municípios situados em áreas com processo de desertificação avançado, dessa forma espera-se uma tendência de baixos níveis de VAB per capita agropecuária como demonstrado.

## Distribuição Espacial do PIB per capita agro em 2020
![image](https://github.com/user-attachments/assets/25e262a5-b941-453b-ae36-d83f5f483991)

Com base no gráfico de 2020, observa-se trechos do mapa com tonalidade mais escura representam regiões municipais contendo patamares superiores para VAB per capita agropecuário de 2020. Já regiões demonstrando tonalidade mais clara são municípios apresentando patamares menores para VAB per capita agropecuário, ou seja, regiões com valores menos representativos. Ainda, observando a Figura 3, visualizamos grandes agrupamentos espaciais de municípios contendo patamar elevado para VAB per capita do setor agropecuário, com destaque principal para duas regiões: Situada mais a Noroeste do estado, temos a Serra da Ibiapaba como uma das principais regiões observadas, contendo 5 municípios (Guaraciaba do Norte, Croatá, Ibiapina, Ubajara e Tianguá) do total de 37 dos maiores valores obtidos para VAB per capita agropecuária, com forte produção agrícola tendo destaque para plantio de acerola, flores, pitaia, tomate, maracujá e mirtilo. Já mais ao Leste do estado temos o Vale do Jaguaribe como outra região de grande relevância no setor, também com 5 do total de 37 municípios (Limoeiro do Norte, São João do Jaguaribe, Quixeré, Potiretama, Alto Santo), com cultivo destaque em mamão, banana, milho e produção de leite. Seguidos por regiões contendo menor representatividade no total de municípios com alto valor para o VAB per capita, como: Sertão de Sobral, Sertão de Crateús, Sertão Central, Região do Cariri, Maciço do Baturité e Litoral Leste.
## Taxa de Crescimento do PIB per capita agro
![image](https://github.com/user-attachments/assets/4f9586b0-bd92-4d38-ac24-bd437c7e333a)

A taxa de crescimento do VAB per capita agropecuário entre os anos de 2002 e 2020, das regiões analisadas no gráfico acima, as que apresentaram maiores taxas no que concerne à crescimento no período analisado foram: Varjota situada no Sertão de Sobral, que apresentou grande recuperação no cultivo da mandioca e milho mesmo após longo período de seca que perdurou de 2012 a 2018 diminuindo assim drasticamente sua produção, porém o município tornou a recuperar um alto patamar de produção, e no que diz respeito ao crescimento de produção em relação ao início do período, demonstrando patamares altíssimos para o nível de produção em sementes de urucum e produção de banana. Na região do Cariri com o município de Missão Velha apresentando crescimento notável para produção de goiaba, limão e coco-da-baía, em seguida Farias Brito evidenciando um grande crescimento de sua produção em grãos de fava, tomate, goiaba e banana, seguido por Barbalha expondo também um crescimento notável na sua produção de milho e melancia. Na Serra da Ibiapaba, temos Guaraciaba do Norte e Croatá, destacando-se através de sua produção de cebola, melancia e principalmente tomate. Por fim temos Beberibe no Litoral Leste com a maior produção de Castanha de Caju do estado, além de grandes produções de limão, manga e coco-da-baía. Ou seja, pode-se concluir que esses ganhos expressivos no crescimento das produções agrícolas desses municípios foram resultantes dos altos níveis de crescimento do VAB per capita apresentados durante o período de análise.

# Resultados

MODELO MÍNIMOS QUADRADOS ORDINÁRIOS

```
SUMMARY OF OUTPUT: ORDINARY LEAST SQUARES ESTIMATION
Data set            :  CE_Municipios_2022
Dependent Variable  :  ln_VA_0220  Number of Observations:  184
Mean dependent var  :    0,108216  Number of Variables   :    2
S.D. dependent var  :    0,500667  Degrees of Freedom    :  182 

R-squared           :    0,043423  F-statistic           :     8,26168
Adjusted R-squared  :    0,038167  Prob(F-statistic)     :  0,00453141
Sum squared residual:       44,12  Log likelihood        :    -129,707
Sigma-square        :    0,242418  Akaike info criterion :     263,413
S.E. of regression  :    0,492359  Schwarz criterion     :     269,843
Sigma-square ML     :    0,239783
S.E of regression ML:    0,489676

-------------------------------------------------------------------------
    Variable      Coefficient      Std.Error    t-Statistic   Probability
-------------------------------------------------------------------------
         CONSTANT       1,06123       0,333545        3,18169     0,00172
       ln_VAPC_02     -0,147327      0,0512563       -2,87431     0,00453
-------------------------------------------------------------------------
REGRESSION DIAGNOSTICS  
MULTICOLLINEARITY CONDITION NUMBER   18,323949
TEST ON NORMALITY OF ERRORS
TEST                  DF           VALUE             PROB
Jarque-Bera            2             0,8197          0,66377

DIAGNOSTICS FOR HETEROSKEDASTICITY  
RANDOM COEFFICIENTS
TEST                  DF           VALUE             PROB
Breusch-Pagan test     1             1,6123          0,20416
Koenker-Bassett test   1             1,5670          0,21065

DIAGNOSTICS FOR SPATIAL DEPENDENCE   
FOR WEIGHT MATRIX : CE_Municipios_2022
   (row-standardized weights)
TEST                          MI/DF        VALUE          PROB
Moran's I (error)             0,2518        5,6648        0,00000
Lagrange Multiplier (lag)       1          25,0526        0,00000
Robust LM (lag)                 1           3,3794        0,06601
Lagrange Multiplier (error)     1          29,0749        0,00000
Robust LM (error)               1           7,4017        0,00652
Lagrange Multiplier (SARMA)     2          32,4543        0,00000
```

 

MODELO DO ERRO ESPACIAL - Spatial Error Model (SEM)

```
SUMMARY OF OUTPUT: SPATIAL ERROR MODEL - MAXIMUM LIKELIHOOD ESTIMATION 
Data set            : CE_Municipios_2022
Spatial Weight      : CE_Municipios_2022
Dependent Variable  :  ln_VA_0220  Number of Observations:  184
Mean dependent var  :    0,108216  Number of Variables   :    2
S.D. dependent var  :    0,500667  Degrees of Freedom    :  182
Lag coeff. (Lambda) :    0,488882

R-squared           :    0,208115  R-squared (BUSE)      : - 
Sq. Correlation     : -            Log likelihood        : -117,103040
Sigma-square        :      0,1985  Akaike info criterion :     238,206
S.E of regression   :    0,445533  Schwarz criterion     :     244,636
-------------------------------------------------------------------------
    Variable       Coefficient     Std.Error       z-value    Probability
-------------------------------------------------------------------------
         CONSTANT       1,34454       0,360404        3,73064     0,00019
       ln_VAPC_02     -0,196857      0,0547365       -3,59644     0,00032
           LAMBDA      0,488882      0,0853188        5,73007     0,00000
-------------------------------------------------------------------------
REGRESSION DIAGNOSTICS
DIAGNOSTICS FOR HETEROSKEDASTICITY 
RANDOM COEFFICIENTS
TEST                                     DF      VALUE        PROB
Breusch-Pagan test                       1         0,5981     0,43929

DIAGNOSTICS FOR SPATIAL DEPENDENCE 
SPATIAL ERROR DEPENDENCE FOR WEIGHT MATRIX : CE_Municipios_2022
TEST                                     DF      VALUE        PROB
Likelihood Ratio Test                    1        25,2074     0,00000
```

MODELO DE DEFASAGEM ESPACIAL - Spatial Auto Regressive (SAR)

```
SUMMARY OF OUTPUT: SPATIAL LAG MODEL - MAXIMUM LIKELIHOOD ESTIMATION
Data set            : CE_Municipios_2022
Spatial Weight      : CE_Municipios_2022
Dependent Variable  :  ln_VA_0220  Number of Observations:  184
Mean dependent var  :    0,108216  Number of Variables   :    3
S.D. dependent var  :    0,500667  Degrees of Freedom    :  181
Lag coeff.   (Rho)  :    0,459163

R-squared           :    0,188289  Log likelihood        :    -118,753
Sq. Correlation     : -            Akaike info criterion :     243,506
Sigma-square        :     0,20347  Schwarz criterion     :      253,15
S.E of regression   :    0,451076
-------------------------------------------------------------------------
    Variable       Coefficient     Std.Error       z-value    Probability
-------------------------------------------------------------------------
     W_ln_VA_0220      0,459163      0,0862274        5,32502     0,00000
         CONSTANT      0,965818       0,311622        3,09933     0,00194
       ln_VAPC_02     -0,143158      0,0477077       -3,00072     0,00269
------------------------------------------------------------------------- 
REGRESSION DIAGNOSTICS
DIAGNOSTICS FOR HETEROSKEDASTICITY 
RANDOM COEFFICIENTS
TEST                                     DF      VALUE        PROB
Breusch-Pagan test                       1         0,7172     0,39707

DIAGNOSTICS FOR SPATIAL DEPENDENCE
SPATIAL LAG DEPENDENCE FOR WEIGHT MATRIX : CE_Municipios_2022
TEST                                     DF      VALUE        PROB
Likelihood Ratio Test                    1        21,9079     0,00000
```

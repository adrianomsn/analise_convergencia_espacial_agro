# Análise de disparidades regionais do setor agrpecuário no Ceará: O processo de Convergência Espacial

## Objetivo Geral
- Investigar se ao longo do período de 2002 a 2020 houve redução das disparidades regionais do PIB no setor agropecuário;

## Objetivos específicos
- Conduzir uma análise exploratória dos dados do setor:
    - Analisar e entender tendências ao longo do tempo do PIB per capita do setor agropecuário;
    - Entender como o PIB per capita do setor varia de acordo com a região;
- Investigar a hipótese de autocorrelação espacial local ou/e global;
- Estimar modelos de regressão espacial, afim verificar se houve um processo de convergência-β absoluta 



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

 

MODELO DO ERRO ESPACIAL (SEM)

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

MODELO DE DEFASAGEM ESPACIAL (SAR)

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

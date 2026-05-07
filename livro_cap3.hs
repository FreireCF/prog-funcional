dobro x = x*2

quadruplo x = dobro(dobro x)

areaCirculo r = pi * r^2

--cláusula where para definir valores e funções auxiliares em uma denição principal

areaQ a b c = sqrt(s*(s-a)*(s-b)*(s-c))
  where
    s = (a+b+c)/2

{-a ordem das atribuições de variáveis/funções locais não importam
cada atribuição deve iniciar na mesma coluna-}

myFunct x = 3 + f x + f a + f b
  where 
    f y = y + c*7 --usando a var. c antes de defini-la
    a =3*c
    b = f 2
    c = 10
  
{-se uma definição for escrita em mais de uma linha, as linhas subsequentes devem começar em uma
coluna identada à coluna que começa a definição-}
a = 20 + 20 + 
  20 + 7;

--exercícios 

n = a `div` length xs --o erro era definição de var com caractere maiúsculo e no uso de apóstrofo ' quando deveria ser acento grave `
  where 
    a = 10
    xs = [1, 2, 3, 4, 5]

--Defina uma função para calcular o quadrado do dobro do seu argumento.

quaDobro x = (x*2)^2 

--Defina uma função para calcular o dobro do quadrado do seu argumento.
dobroQuad x = (x^2)*2 

{-Os lados de qualquer triângulo respeitam a seguinte restrição:
A soma dos comprimentos de quaisquer dois lados de um triângulo é superior ao comprimento
do terceiro lado.
Escreva uma função que receba o comprimento de três segmentos de reta e resulte em um valor lógico
indicando se satisfazem esta restrição.-}

--isTri:: Int->Int->Int->Bool 
isTri a b c 
  |(a+b) > c && (b+c) > a && (a+c) > b = True
  |otherwise = False

{-A força requerida para comprimir uma mola linear é dada pela equação
F = kx
onde F é a força em N (Newton), x é a compressão da mola em m (metro), e k é a constante da mola em N/m.

A energia potencial armazenada na mola comprimida é dada pela equação
E = 1/2 * kx^2
onde E é a energia em J (joule).

Defina funções para calcular a compressão e a energia potencial armazenada em uma mola, dadas a
constante elástica da mola e a força usada para comprimi-la.-}

compressao:: Int->Int->Int --retornar o X
compressao f k = f `div` k 

--energia:: Int->Int->Int --retornar o E usando o k e x da anterior
energia k x = 1`div`2 * k * x^2 

{-Sabe-se que o quilowatt de energia elétrica custa um quinto do salário mínimo. Defina uma função que
receba o valor do salário mínimo e a quantidade de quilowatts consumida por uma residência, e resulta no
valor a ser pago com desconto de 15%-}

--valorEnergia:: Int->Int->Int
valorEnergia salario consumo = salario/5 consumo * 0.85

frequencia l c = 1 / (2*pi * sqrt(l*c))

areaTriangulo a b c 
    |not (isTri a b c) = 0
    |otherwise = c*h/2
    where
      cos = (b^2 + c^2 - a^2) / (2*b*c)
      sin = sqrt(1 - cos^2)
      h = b*sin 

{-Defina uma função que recebe o salário base de um funcionário e resulta no salário líquido a receber,
sabendo-se que o funcionário tem gratificação de 10% sobre o salário base e paga imposto de 7% sobre
o salário base.-}

salarioLiq::Double->Double
salarioLiq salBase = salBase + salBase*0.1 - salBase*0.07
Claro, Clecio. Aqui vai uma **lista nova de exercícios sobre listas com recursão em Haskell**, sem repetir essas questões.

## Lista de exercícios — Listas com recursão em Haskell

### 1. Soma dos elementos pares

Faça uma função que recebe uma lista de inteiros e retorna a soma apenas dos números pares.

```haskell
somaPares :: [Int] -> Int
```

Exemplo:

```haskell
somaPares [1,2,3,4,5,6] -- 12
```

---

### 2. Contar números ímpares

Faça uma função que conta quantos números ímpares existem em uma lista.

```haskell
contaImpares :: [Int] -> Int
```

Exemplo:

```haskell
contaImpares [1,2,3,4,5] -- 3
```

---

### 3. Maior elemento da lista

Faça uma função que retorna o maior elemento de uma lista de inteiros.

```haskell
maiorLista :: [Int] -> Int
```

Exemplo:

```haskell
maiorLista [4,9,2,10,3] -- 10
```

---

### 4. Menor elemento da lista

Faça uma função que retorna o menor elemento de uma lista de inteiros.

```haskell
menorLista :: [Int] -> Int
```

Exemplo:

```haskell
menorLista [4,9,2,10,3] -- 2
```

---

### 5. Verificar se um elemento pertence à lista

Faça uma função que recebe um elemento e uma lista, retornando `True` se o elemento estiver na lista.

```haskell
pertence :: Eq a => a -> [a] -> Bool
```

Exemplo:

```haskell
pertence 3 [1,2,3,4] -- True
pertence 8 [1,2,3,4] -- False
```

---

### 6. Contar ocorrências de um elemento

Faça uma função que conta quantas vezes um elemento aparece em uma lista.

```haskell
contaOcorrencias :: Eq a => a -> [a] -> Int
```

Exemplo:

```haskell
contaOcorrencias 2 [1,2,3,2,4,2] -- 3
```

---

### 7. Dobrar os elementos da lista

Faça uma função que recebe uma lista de inteiros e retorna outra lista com todos os valores multiplicados por 2.

```haskell
dobrarLista :: [Int] -> [Int]
```

Exemplo:

```haskell
dobrarLista [1,2,3] -- [2,4,6]
```

---

### 8. Filtrar maiores que N

Faça uma função que recebe um número `n` e uma lista, retornando apenas os elementos maiores que `n`.

```haskell
maioresQue :: Int -> [Int] -> [Int]
```

Exemplo:

```haskell
maioresQue 5 [1,7,3,9,5,10] -- [7,9,10]
```

---

### 9. Remover todas as ocorrências de um elemento

Faça uma função que remove todas as ocorrências de um elemento em uma lista.

```haskell
removeTodos :: Eq a => a -> [a] -> [a]
```

Exemplo:

```haskell
removeTodos 2 [1,2,3,2,4,2] -- [1,3,4]
```

---

### 10. Substituir elementos

Faça uma função que recebe dois valores `a` e `b` e uma lista. A função deve substituir todas as ocorrências de `a` por `b`.

```haskell
substituir :: Eq a => a -> a -> [a] -> [a]
```

Exemplo:

```haskell
substituir 2 9 [1,2,3,2,4] -- [1,9,3,9,4]
```

---

### 11. Somar duas listas posição por posição

Faça uma função que recebe duas listas de inteiros e retorna uma lista com a soma dos elementos de mesma posição.

```haskell
somaListas :: [Int] -> [Int] -> [Int]
```

Exemplo:

```haskell
somaListas [1,2,3] [4,5,6] -- [5,7,9]
```

Se uma lista acabar antes, pare a soma.

---

### 12. Intercalar duas listas

Faça uma função que recebe duas listas e retorna uma nova lista intercalando seus elementos.

```haskell
intercalar :: [a] -> [a] -> [a]
```

Exemplo:

```haskell
intercalar [1,2,3] [10,20,30] -- [1,10,2,20,3,30]
```

---

### 13. Verificar se a lista está ordenada

Faça uma função que verifica se uma lista de inteiros está em ordem crescente.

```haskell
ordenada :: [Int] -> Bool
```

Exemplo:

```haskell
ordenada [1,2,3,4] -- True
ordenada [1,3,2,4] -- False
```

---

### 14. Gerar lista de quadrados

Faça uma função que recebe uma lista de inteiros e retorna uma lista com o quadrado de cada elemento.

```haskell
quadrados :: [Int] -> [Int]
```

Exemplo:

```haskell
quadrados [1,2,3,4] -- [1,4,9,16]
```

---

### 15. Separar positivos

Faça uma função que recebe uma lista de inteiros e retorna apenas os números positivos.

```haskell
positivos :: [Int] -> [Int]
```

Exemplo:

```haskell
positivos [-2,0,4,-1,7] -- [4,7]
```

---

### 16. Contar elementos maiores que zero

Faça uma função que conta quantos elementos positivos existem em uma lista.

```haskell
contaPositivos :: [Int] -> Int
```

Exemplo:

```haskell
contaPositivos [-2,0,4,-1,7] -- 2
```

---

### 17. Multiplicar todos os elementos por N

Faça uma função que recebe um número `n` e uma lista, retornando uma nova lista com todos os elementos multiplicados por `n`.

```haskell
multiplicaPor :: Int -> [Int] -> [Int]
```

Exemplo:

```haskell
multiplicaPor 3 [1,2,4] -- [3,6,12]
```

---

### 18. Último elemento da lista

Faça uma função que retorna o último elemento de uma lista.

```haskell
ultimo :: [a] -> a
```

Exemplo:

```haskell
ultimo [1,2,3,4] -- 4
```

---

### 19. Penúltimo elemento da lista

Faça uma função que retorna o penúltimo elemento de uma lista.

```haskell
penultimo :: [a] -> a
```

Exemplo:

```haskell
penultimo [1,2,3,4] -- 3
```

---

### 20. Duplicar cada elemento da lista

Faça uma função que recebe uma lista e duplica cada elemento.

```haskell
duplicaElementos :: [a] -> [a]
```

Exemplo:

```haskell
duplicaElementos [1,2,3] -- [1,1,2,2,3,3]
```

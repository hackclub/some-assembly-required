# La Sección de Matemáticas

Hasta ahora, con el aprendizaje sobre CPUs y assembly, no hemos necesitado sumergirnos en grandes conceptos matemáticos. Sin embargo, para una comprensión más profunda de cómo funcionan nuestros ordenadores, hay algunos fundamentos de los que vale la pena hablar.

Por ejemplo, cómo se forman los números. Ya lo he dicho.

Pero en realidad, los números en los que tú y yo pensamos (1, 2, 3, etc.) son símbolos que hemos creado para representar las cosas que vemos a nuestro alrededor. Lo más habitual es que representemos estos números en algo llamado **base 10**, lo que significa que tenemos 10 dígitos para representar nuestros números.

<p align="center">
  <br />
  <img height="250" src="https://cloud-qs4ujxdmd-hack-club-bot.vercel.app/0hands.png">
  <br />
  <span>
    <em>
      Why 10? Well, it's because we have 10 fingers!
    </em>
  </span>
</p>
<br />

## Decimal (Base 10)

La base 10, también conocida como decimal, es algo que se denomina sistema numérico. La forma más común de referirnos a los números es en base 10, y significa que tenemos 10 dígitos que podemos utilizar para representar cualquier número.

Esos dígitos son del 0 al 9. ¿Qué ocurre cuando nos quedamos sin dígitos? Nos desplazamos 1 posición a la izquierda y volvemos a empezar. Por ejemplo:
```js
  0
  1
  2
  3
  4
  5
  6
  7
  8
  9
 10 // Fijate que nos desplazamos 1 posición
 11
 12
...
 98
 99
100 // Fijate que nos desplazamos 1 posición
101
102
...
108
109
110 // Como nos quedamos sin dígitos en el lugar de las "unidades", incrementamos el lugar de las "decenas" y empezamos de nuevo en el lugar de las "unidades"
111
```

Esto te parece obvio, lo sé. Todos lo hacemos sin pensar en ello. Pero cómo funciona es importante, porque como seguro que has adivinado, hay más de un sistema numérico. De hecho, has oído hablar mucho de uno a lo largo de esta guía. ¿Recuerdas todos los **1**s y **0**s de los que hemos estado hablando?

## Binario (Base 2)

Es útil ser capaz de decodificar binario cuando estamos hablando a un nivel tan bajo. Tú y yo sabemos comunicarnos en base 10, pero el binario es base 2, que es lo que entiende el ordenador.

Como ya sabemos con el binario, sólo hay dos dígitos representados: **0** y **1**. Lo bueno de las bases numéricas es que todas funcionan igual. Una vez que nos quedamos sin dígitos, nos desplazamos un lugar. Así que vamos a probarlo:

```js
  0 // 0
  1 // 1
 10 // 2 - Fijate que nos desplazamos 1 posición
 11 // 3
100 // 4 - Fijate que nos desplazamos 1 posición
101 // 5
110 // 6 - Como nos quedamos sin dígitos en el lugar de los "unos", incrementamos el lugar de los "dos" y empezamos de nuevo ellugar de los "unos".
111 // 7
```

<details>
<summary><i>Teniendo en cuenta este patrón, ¿cuánto será 8 en binario?</i></summary>
<br />
<i>Como nos hemos quedado sin dígitos, tenemos que desplazar 1 posición. 8 en binario es `1000`.</i>
</details>

Si seguimos este sencillo patrón, podremos contar nuestros números sin demasiados problemas.

Pero digamos que necesitamos leer un número aleatorio en binario, como "10011". No nos gustaría tener que contar hasta ese número para averiguar cuál es. Veamos algunas reglas que pueden ayudarnos a averiguar la suma de ese número en base 10.

De derecha a izquierda, cada dígito es el valor del dígito (`0` o `1`) multiplicado por **2** a la potencia de la posición del dígito. Esto se debe a que, si recuerdas, estamos trabajando en **base 2**. Eso significa que 2 es la base de nuestra ecuación.

Así que vamos a intentarlo. "10011" se traduciría como, de derecha a izquierda:

- $1 * 2^0 = 1$
- $1 * 2^1 = 2$
- $0 * 2^2 = 0$
- $0 * 2^3 = 0$
- $1 * 2^4 = 16$
- $1 + 2 + 0 + 0 + 16 = 19$

¡Así que `10011` es igual a **19** en base 10!

Ahora, para aquellos lectores que quieran hacer algo extra, pueden intentar calcular `1011001` en base 10 por su cuenta si les apetece.

<details>
<summary><i>¿Cuánto es <code>1011001</code> en base 10?</i></summary>

<br />
<i>
Como recordatorio, estamos calculando de derecha a izquierda.

- $1 * 2^0 = 1$
- $0 * 2^1 = 0$
- $0 * 2^2 = 0$
- $1 * 2^3 = 8$
- $1 * 2^4 = 16$
- $0 * 2^5 = 0$
- $1 * 2^6 = 64$
- $1 + 0 + 0 + 8 + 16 + 0 + 64 = 89$

Así que `1011001` es 89 en base 10.
</i>
</details>

¡Enhorabuena, sabelotodo! Oficialmente sabes leer en binario.

## Hexadecimal (Base 16)

Un dato curioso: técnicamente, cualquier número puede ser una base. Sólo hablaremos de una base más, que es la base 16. La base 16 es también conocida como hexadecimal y comúnmente abreviada como "hex".

Vamos a hablar de hexadecimal porque el binario a menudo se abrevia como hex. Esto se debe a que, cuando hablamos del tamaño de los registros, podemos sustituir fácilmente binario por hexadecimal para hacerlo todo más corto y fácil de leer. Por ejemplo, en una máquina de 64 bits, un registro podría tener este aspecto:

```
10000001 00010011 00000000 11110000 10101000 11000111 01111101 00000001
```

Los mismos números en hexadecimal acabarían pareciendose a:

```
81 13 00 FO A8 C7 7D 01
```

_Ey ey ey. Espera un momento. ¿Por qué hay letras?_

Bueno, tenemos que recordar - nuestra base es 16. Eso significa que tenemos 16 dígitos para representar nuestros números. Esos dígitos son:

```js
0
1
2
3
4
5
6
7
8
9
A // 10 - En base 10, tendríamos que cambiar porque nos quedamos sin dígitos. En base 16, ¡tenemos más dígitos para usar!
B // 11
C // 12
D // 13
E // 14
F // 15
```

Así que esas letras corresponden a números.

¿Qué pasaría si pasáramos del 15? Hacemos lo mismo que antes: cambiamos 1 y volvemos a empezar. Vamos a probarlo.

```js
...
 8
 9
 A // 10
 B // 11
 C // 12
 D // 13
 E // 14
 F // 15
10 // 16 -  Fijate que nos desplazamos 1 posición
11 // 17
12 // 18
13 // 19
14 // 20
15 // 21
16 // 22
17 // 23
18 // 24
19 // 25
1A // 26
1B // 27
1C // 28
1D // 29
1E // 30
1F // 31
20 // 32
...
```

Es muy raro, lo sé. Tu cerebro _quiere_ interpretarlo como decimal, o base 10. Pero como la matemática detrás de la base es completamente diferente, ¡los números que parecen algo en base 10 significan cosas completamente diferentes en base 16!

---

Calculemos nuestro ejemplo de binario a hexadecimal en decimal. Para recordar, nuestro binario era:

```
10000001 00010011 00000000 11110000 10101000 11000111 01111101 00000001
```

Y nuestros dígitos hexadecimales son:

```
81 13 00 FO A8 C7 7D 01
```

Esta parte funciona igual que la parte binaria, pero con 16 como nuestra base en lugar de 2. Así que tomemos uno de nuestros bytes de arriba, `7D`, como ejemplo. Vamos a ir de derecha a izquierda, igual que en nuestro ejemplo binario. También puedes pensar en ello como el dígito menos significativo al dígito más significativo, igual que en decimal.

Nuestro número es **7D**.

- $D$ corresponde a $13$
  - $13 * 16^0 = 13$
- $7$ corresponde a $7$
  - $7 * 16^1 = 112$
- $13 + 112 = 125$

¡Así que **7D** es **125** en base 10!

---

¿Quieres un reto? ¡Intenta convertir el número hexadecimal `B1` a base 10!

<details>
<summary><i>¿Cuánto es <code>B1</code> en base 10?</i></summary>
<br />
<i>

Como recordatorio, estamos calculando de derecha a izquierda.

Nuestro número es $B1$.

- $1$ corresponde a $1$
  - $1 * 16^0 = 1$
- $B$ corresponde a $11$
  - $11 * 16^1 = 176$
- $1 + 176 = 177$

Así que `B1` es 177 en base 10.
</i>
</details>

---

<br />

A menudo verás números hexadecimales asociados con assembly, registros, e incluso en conceptos de nivel superior como [códigos de color hexadecimales](https://www.color-hex.com/). Ahora tienes las herramientas que necesitas para reconocer estos números y decodificarlos.

Para más información sobre el sistema numérico, visita [este sitio](https://www.mathsisfun.com/binary-number-system.html) para más información y una explicación animada.

<br />

---

<a href="/guide/writing-code/uppercaser.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg">
    <img align="left" width="70" src="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="logica-booleana.md">
        Pongamos a prueba nuestro nuevo conocimiento binario →
      </a>
    </b>
  </em>
</p>

---

<p align="center">
  <a href="https://hackclub.com/">
    <img width="35" src="https://cloud-l0g1cgz4b-hack-club-bot.vercel.app/0h.png"><br/>
    Hecho con amor por Hack Club
  </a>
</p>
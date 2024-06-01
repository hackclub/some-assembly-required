# Bucle de Bucle

A menudo, en programación, necesitamos ejecutar el mismo código sobre un conjunto de valores, o en un **bucle**, cambiando algo cada vez que se ejecuta el bucle.

Esto se explica mejor con un ejemplo. Por ejemplo, ¿qué pasaría si quisiéramos calcular la cantidad de números posibles que podemos almacenar en un **byte**?

Como recordatorio:
  - un bit tiene 2 posibilidades, `1` o `0`.
  - un byte son 8 bits
  - dado eso, $2^8$ es el número de posibilidades que puedes almacenar en un byte

¿Como quedaría esto en JavaScript?

```js
// JavaScript
const base = 2;
const exponent = 8;
let result = 1; /// como nuestro contador empieza a 0, empezamos nuestro resultado a 2^0, que es 1

for (let counter = 0; counter < exponent; counter++) {
  result *= base
}
```

Utilizamos un [bucle `for`](https://developer.mozilla.org/es/docs/Web/JavaScript/Guide/Loops_and_iteration) para que esto funcione, que establece una variable contador a `0`. Mientras nuestro contador sea menor que nuestro exponente (`8`), continuamos el bucle. En cada bucle, incrementamos el contador en `1`.

Dentro del bucle, tomamos el resultado que estamos calculando, y lo multiplicamos por nuestra base (`2`). Eso se vería así, en cada bucle:

1. `result = 1 * 2`, `result` ahora es `2`
1. `result = 2 * 2`, `result` ahora es `4`
1. `result = 4 * 2`, `result` ahora es `8`
1. `result = 8 * 2`, `result` ahora es `16`
1. `result = 16 * 2`, `result` ahora es `32`
1. `result = 32 * 2`, `result` ahora es `64`
1. `result = 64 * 2`, `result` ahora es `128`
1. `result = 128 * 2`, `result` ahora es `256`

Así que un byte puede contener 256 valores únicos. ¡Genial! Ahora hagamos esto en assembly.

Assembly no tiene bucles `for`, pero _tiene_ saltos condicionales, como hemos aprendido. Con un poco de configuración, podemos usar un salto condicional de la misma manera que usamos un bucle for.

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 8 ; nuestor exponente
mov rbx, 2 ; nuestra base
mov rcx, 1 ; nuestro resultado. ya que nuestro contador comienza a 0, comenzamos nuestro resultado a 2^0, que es 1
mov rdx, 0 ; nuestro contador

.calculatePower
  mul rcx, rbx        ; multiplica nuestro resultado por nuestra base, guarda en rcx
  inc rdx             ; incrementa el contador
  cmp rdx, rax        ; compara nuestro contador con nuestro exponente
  jl .calculatePower  ; salta al principio del bucle si rdx < rax, ya que aún nos quedan más iteraciones por hacer

; una vez que hemos llegado aquí, rcx contiene nuestro resultado (rbx^rax)!
```

¿Ves lo que hemos hecho?

Primero configuramos nuestras «variables», igual que en nuestro ejemplo de JavaScript. Parece que tenemos una variable extra, `rdx` (nuestro contador), pero el ejemplo de JavaScript también define un `counter` dentro de la cabecera del bucle `for`.

Después, hemos creado un label, al que podremos volver. Hacemos nuestra multiplicación matemática, igual que en el bucle `for` de JavaScript. Luego, incrementamos manualmente nuestro contador `rdx`, que es lo que ocurre en la cabecera del bucle `for` de JavaScript con `i++`.

Ahora `cmp` comparamos nuestro contador `rdx` con nuestro exponente `rax`, que en el ejemplo de JavaScript es `i < exponente`. Como aprendimos recientemente, esto establece nuestro flag cero en el registro eflags, que nuestros saltos condicionales pueden ver. Así que si nuestro contador `rdx` es menor que (`jl`) el exponente `rax`, saltamos de nuevo a `.calculatePower`. ¡Wooooo!

<br />

---

<a href="/es/guia/escribiendo-codigo/instrucciones/condicionales.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg">
    <img align="left" width="70" src="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/es/guia/escribiendo-codigo/instrucciones/funciones.md">
         Pongámonos funcionales →
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
# Adicionalmente

Hagamos un poco de mates. ¡Te prometo que no estará mal!

Primero, hablaremos de la instrucción `add`.

```js
// JavaScript
let a = 3;
a = a + 1;
```

_En JavaScript, estamos añadiendo `1` al contenido de la variable `a`. Al final, `a` contendrá el valor `4`._

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 3;
add rax, 1;
```

_En assembly, estamos añadiendo `1` al contenido del registro `rax`. Al final de esto, `rax` contendrá el valor `4`._

La instrucción `add` suma el valor de la derecha (`1`) al contenido del registro de la izquierda (`rax`, que contiene `3`). Luego coge la suma de estos dos números y, al igual que nuestra instrucción `mov`, almacena el valor _dentro_ del registro de la izquierda (`rax`).

---

Al igual que nuestra instrucción `mov`, la instrucción `add` puede utilizar el contenido de un segundo registro para operar sobre el primero.

```js
// JavaScript
let a = 3;
let b = 1;

a = a + b;
```

_En JavaScript, estamos añadiendo el contenido de `b` al contenido de `a`. Al final, `a` contendrá el valor `4`._

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 3;
mov rbx, 1;

add rax, rbx;
```

<details>
<summary><i>En este ejemplo, ¿cuál crees que será el valor de <code>rax</code> ?</i></summary>

<br />
<i>Estamos añadiendo el contenido de <code>rbx</code> a los contenidos de <code>rax</code>. Al final de esto, <code>rax</code> contendrá el valor <code>4</code>.</i>

</details>

## Resta

¡La resta funciona igual que la suma!

```js
// JavaScript
let a = 3;
let b = 1;

a = a - b;
```

_En JavaScript, estamos restando el contenido de `b` del contenido de `a`. Al final de esto, `a` contendrá el valor `2`._

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 3;
mov rbx, 1;

sub rax, rbx;
```

<details>
<summary><i>En este ejemplo, ¿cuál crees que será el valor de <code>rax</code> ?</i></summary>

<br />
<i>Estamos restando el contenido de <code>rbx</code> de los contenidos de <code>rax</code>. Al final de esto, <code>rax</code> contendrá el valor <code>2</code>.</i>

</details>

<i>La instrucción <code>sub</code> resta el contenido del registro (<code>rbx</code>, que contiene <code>1</code>) del lado derecho al contenido del registro del lado izquierdo (<code>rax</code>, que contiene <code>3</code>). Luego coge la diferencia de estos dos números y almacena el valor en el registro de la izquierda (<code>rax</code>).</i>

## Multiplicación

No todos los lenguajes assembly tienen multiplicación o división, ¡pero x86-64 sí! ¡Bien por nosotros!

```js
// JavaScript
let a = 2;
let b = 3;

a = a * b;
```

_En JavaScript, estamos multiplicando los contenidos de `b` con los contenidos de `a`. Al final de esto, `a` contendrá el valor `6`._

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 2;
mov rbx, 3;

mul rax, rbx;
```

<details>
<summary><i>En assembly, estamos multiplicando los contenidos de <code>rbx</code> con los contenidos de <code>rax</code>. Al final de esto, <code>rax</code> contendrá el valor <code>6</code>. ¿Puedes adivinar cómo funciona la instrucción <code>mul</code> ?</i></summary>

<br />
<i>La instrucción <code>mul</code> multiplica los contenidos del registro (<code>rbx</code>, que contiene <code>3</code>) en el lado derecho a los contenidos del registro de la izquierda (<code>rax</code>, que contiene <code>2</code>). Luego coge el producto de esos dos números y almacena el valor en el registro de la izquierda (<code>rax</code>).</i>

</details>

## Poniéndolo todo junto

Ahora que ya sabemos algo de matemáticas básicas, ¡intentemos representar una ecuación real en assembly! Es posible que hayas aprendido la ecuación pendiente-intersección en la escuela. Si eres como yo y no la recuerdas, es así:

<p align="center">
  <br />
  <img height="200" src="https://cdn.hackclub.com/019c1ebe-c2df-7106-9b2f-081fb16d4c5a/image.png">
  <br />
</p>
<p align="center">
  <span>
    $y = mx + b$
  </span>
</p>
<br />

No necesitamos entrar en grandes detalles sobre esta ecuación, pero ésta es la fórmula para hallar la ecuación de una recta. Así es como funciona.

$m$ es la pendiente. Si es superior a 1, significa que tu línea sube más rápido. Si está entre 0 y 1, está subiendo más despacio. Si es negativa, va hacia abajo.

$b$ es la intersección. Cada línea siempre alcanzará eventualmente el eje $y$, a menos que sea una línea vertical. La intersección $b$ es donde tu línea cruza con el eje $y$.

Si sustituyes $m$ y $b$ en la ecuación, te quedas con las variables $x$ e $y$. Esas variables $x$ e $y$ se corresponden directamente con las coordenadas $x$ e $y$ del punto en el gráfico.

Para obtener cualquier punto de la recta, introduces $x$ en la ecuación ¡y obtienes la coordenada $y$!.

Supongamos que tenemos una recta representada por la ecuación pendiente-intersección $y = 2x + 4$. El assembly de abajo calculará el valor de $y$ cuando introduzcas $3$ en lugar de $x$. Así es como quedaría:

<br />

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 2 ; rax contendrá m
mov rbx, 3 ; rbx contendrá x
mov rcx, 4 ; rcx contendrá b

mul rax, rbx ; m * x, almacena en rax
add rax, rcx ; m * x + b, almacena en rax. rax ahora contiene y!
```

<br />

Gracias por quedarte conmigo para reaprender un poco de matemáticas. Creo que es importante mostrar que podemos escribir funciones de la vida real como esta usando sólo assembly. Pronto, aprenderemos cómo _iterar_ sobre código, lo que nos permitirá usar este código para obtener todos los puntos de una línea en particular, no sólo uno.

<br />

---

<a href="/es/guia/escribiendo-codigo/instrucciones/mov.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png">
    <img align="left" width="70" src="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/es/guia/escribiendo-codigo/instrucciones/jumps.md">
        Saltando de alegría  →
      </a>
    </b>
  </em>
</p>

---

<p align="center">
  <a href="https://hackclub.com/">
    <img width="35" src="https://cdn.hackclub.com/019c1b71-2582-7e9c-9125-3792c8a88142/image.png"><br/>
    Hecho con amor por Hack Club
  </a>
</p>

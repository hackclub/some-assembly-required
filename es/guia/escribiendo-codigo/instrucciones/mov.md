# I Like The Way You Mov

Es el momento que estabais esperando, amigos. ¡Vamos a escribir algo de código!

Primero, veamos un ejemplo en JavaScript para ayudar a explicar lo que estamos haciendo.

```js
// JavaScript
let a = 5;
```

_En JavaScript, estamos estableciendo el valor de una variable, `a`, al número `5`._

Como hemos dicho antes, en la programación de alto nivel, se utiliza una **variable** para almacenar datos para su uso posterior. Puedes pensar en los **registros como las variables del lenguaje assembly**.

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 5;
```

_En assembly, estamos estableciendo el valor de un registro, `rax`, al número `5`._

Estamos utilizando una instrucción **mov** (abreviatura de "Move"). Esto mueve el valor del lado derecho (`5`) _dentro_ del registro del lado izquierdo (`rax`).

---

Ahora bien, las variables y los registros son bastante similares en este sentido, pero hay algunas diferencias clave que conviene recordar.

Con **variables**, puedes crear una cantidad _ilimitada_ de ellas y _nombrarlas como quieras_.

Por otro lado, los **registros** están _limitados_ a un conjunto determinado por el procesador. Tampoco _puedes nombrarlos_, son como variables ya configuradas cuyo contenido puedes cambiar.

```js
// JavaScript
let a = 3;
let b = a;
```
_Al final de esto, `b` contendrá el valor `3`._

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 3;
mov rbx, rax;
```
<details>
<summary><i>Al final de este ejemplo, ¿cuál crees que será el valor de <code>rbx</code> ?</i></summary>
<br />
<i>En nuestro ejemplo anterior de assembly, establecemos el valor del registro <code>rax</code> a un número. En este ejemplo, establecemos el valor de un registro al valor de otro registro. Al final de esto, <code>rbx</code> contendrá el valor <code>3</code>.</i>
</details>

---

Un último ejemplo de `mov` para que quede claro.

```js
// JavaScript
let a = 3;
let b = 5;

a = b;
```

_Aunque al principio establecimos `a` a `3`, al final de este ejemplo, `a` es `5`, ya que le pusimos a `a` al contenido de `b`._

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 3;
mov rbx, 5;

mov rax, rbx;
```

<details>
<summary><i>Al final de este ejemplo, ¿cuál crees que será el valor de <code>rax</code> ?</i></summary>
<br />
<i>Aunque pongamos <code>rax</code> a <code>3</code> al principio, al final de este ejemplo, <code>rax</code> es <code>5</code> ya que le pusimos a <code>rax</code> el contenido de <code>rbx</code>.</i>
</details>

<br />

---

<a href="/es/guia/escribiendo-codigo/registros.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg">
    <img align="left" width="70" src="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/es/guia/escribiendo-codigo/instrucciones/mates.md">
        ¿Qué más podemos hacer? →
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
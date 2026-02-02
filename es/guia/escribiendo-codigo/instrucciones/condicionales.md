# Condicionales

Digamos que estás escribiendo código y quieres que algo suceda _sólo_ si otra cosa es cierta.

```js
// JavaScript
if (a < b) {
  // haz algo
}
```

En JavaScript y otros lenguajes de alto nivel, tradicionalmente usaríamos una sentencia `if` para ejecutar condicionalmente algún código. En ensamblador, usaríamos saltos condicionales.

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 3
mov rbx, 1

cmp rax, rbx
jl .jumpToHere
add rbx, 1 ; Sólo llegaremos a esta línea si no se ejecuta el salto

.jumpToHere
  ; haz algo
```

En este ejemplo de código, estamos comprobando en última instancia si el contenido de `rax` es inferior al contenido de `rbx`, y saltando si es así. Así es como funciona.

La instrucción `cmp` compara dos valores, y registra cuál es mayor (o si son iguales) en un registro especial llamado registro `eflags`. Pronto entraremos en los detalles de `eflags`, pero por ahora, recuerda que después de ejecutar la instrucción `cmp`, el resultado de la comparación se guarda en `eflags`.

En nuestro ejemplo, estamos comparando el valor de `rax` con el valor de `rbx`, y eso se guarda en `eflags`.

Para nuestro salto condicional, estamos utilizando `jl`, que significa «Jump if Less Than» ("Salta si inferior a"). La instrucción `jl` comprueba el registro `eflags`. Si `eflags` dice que el primer argumento de `cmp` es inferior al segundo (`rax < rbx`), salta al label especificado. Si `rax >= rbx`, esta instrucción no hace nada.

Volvamos a nuestro ejemplo:

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 3
mov rbx, 1

cmp rax, rbx
jl .jumpToHere
add rbx, 1 ; Sólo llegamos a esta línea si no se ejecuta el salto

.jumpToHere
  ; haz algo
```

<details>
<summary><i>En este ejemplo, ¿se ejecutará el salto?</i></summary>

<br />
<i>El salto <strong>no</strong> se ejecutará, porque el valor de <code>rax</code> (<code>3</code>) es superior al valor de <code>rbx</code> (<code>1</code>).</i>

</details>

Otro ejemplo:

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 2
mov rbx, 4

cmp rax, rbx
jl .jumpToHere
add rbx, 1 ; Sólo llegaremos a esta línea si no se ejecuta el salto

.jumpToHere
  ; haz algo
```

<details>
<summary><i>En este ejemplo, ¿se ejecutará el salto?</i></summary>

<br />
<i>El salto <strong>sí</strong> se ejecutará, porque el valor de <code>rax</code> (<code>2</code>) es inferior al valor de <code>rbx</code> (<code>4</code>).</i>

</details>

## Flags

Cuando hablamos de saltos condicionales, debemos hablar de flags. Como hemos mencionado brevemente, los flags se almacenan en otro registro especial, `eflags`, al que no accedemos directamente. Los flags se activan automáticamente por muchas razones, como cuando las instrucciones realizan operaciones aritméticas y lógicas, o cuando usamos la instrucción `cmp`.

Hay 5 flags en un procesador x86-64, pero vamos a hablar del flag cero, o `ZF`.

Después de una operación, si el resultado **es** `0`, el flag `ZF` se pone a `1`. Si el resultado **no** es `0`, el flag se pone a `0`.

Esto puede parecer contraintuitivo, pero cuando se habla de los dígitos binarios de «1» y «0»:

- `1` también significa **verdadero**.
- `0` también significa **falso**.

Así que si estamos comprobando si el resultado de nuestra operación es `0`, y ese termina siendo el caso, eso significa que el registro `ZF` siendo establecido a `1` está diciendo que es **verdadero** que nuestro resultado es `0`.

Por ejemplo, tomemos la siguiente instrucción:

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 3;
add rax, 1;
```

_En assembly, estamos añadiendo `1` al contenido del registro `rax`. Al final de esto, `rax` contendrá el valor `4`._

<details>
<summary><i>En este ejemplo, ¿cuál crees que será el valor del flag <code>ZF</code> ?</i></summary>

<br />
<i>Como el resultado de la operación aritmética anterior era <code>4</code>, el valor de <code>ZF</code> es <code>0</code>.</i>
</details>
<br />

Otro caso:

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 1;
sub rax, 1;
```

_En assembly, estamos restando `1` al contenido del registro `rax`. Al final de esto, `rax` contendrá el valor `0`._

<details>
<summary><i>En este ejemplo, ¿cuál crees que será el valor del flag <code>ZF</code> ?</i></summary>

<br />
<i>Como el resultado de la operación aritmética anterior era <code>0</code>, el valor de <code>ZF</code> es <code>1</code>.</i>
</details>

<br />

---

<a href="/es/guia/escribiendo-codigo/instrucciones/jumps.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png">
    <img align="left" width="70" src="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/es/guia/escribiendo-codigo/instrucciones/bucles.md">
        Bucle de bucle →
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

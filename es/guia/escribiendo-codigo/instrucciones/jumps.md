# Saltando de alegría

El código assembly se ejecuta secuencialmente, lo que significa que después de ejecutar una instrucción, el ordenador pasa a la siguiente instrucción a ejecutar. El ordenador es capaz de realizar un seguimiento de qué línea de código está ejecutando con algo llamado **el puntero de instrucción** ("instruction pointer").

## El Puntero de Instrucción

La CPU tiene muchos registros especializados, a los que no accedemos directamente. Uno de ellos es el **puntero de instrucción** (referenciado como `rip`), también conocido como **contador del programa**.

Cuando se ejecuta un programa en assembly, cada instrucción se almacena en memoria una al lado de la otra.

El registro del puntero de instrucción almacena la **dirección de memoria** de la línea actual del programa que está ejecutando, y se actualiza automáticamente.

Por ejemplo, supongamos que estamos ejecutando un programa en assembly que tiene una instrucción para sumar dos números. Una vez que esa instrucción termina de ejecutarse, el puntero de instrucción se incrementa para apuntar a la siguiente instrucción del programa

Como todo en assembly, el proceso real de incrementar el puntero de instrucción es un poco complicado y depende del procesador, así que vamos a crear una versión ficticia de un ejemplo de alto nivel de cómo funciona esto.

Digamos que para una máquina de 64 bits, cada instrucción acaba siendo de 8 bytes (64 bits / 8 bits por byte = 8 bytes), y cada dirección de memoria representa un byte de datos. Eso significaría que cada vez que termina una instrucción, el puntero de instrucción se suma 8 a sí mismo.

Así que digamos que nuestra primera instrucción está en la dirección de memoria `0x00000001`. Si incrementamos a `0x00000002`, eso sería **1 byte** de datos, o **8 bits**. Si queremos incrementar por la cantidad de datos de una instrucción (**8 bytes**), incrementaríamos a `0x00000009`, ya que son 8 bytes después de `0x00000001`.

<p align="center">
  <br />
  <img height="375" src="https://cdn.hackclub.com/019c1ebf-cfa3-72cf-a3b0-399a99c91881/image.png">
</p>
<br />

---

¿Recuerdas que dije que no accedemos directamente al puntero de instrucción? Eso es cierto, sin embargo podemos cambiar a donde apunta el puntero de instrucción con una instrucción de salto. Los "jump" (saltos) son una forma de moverse a otra área de tu código assembly.

```asm
; Sintaxis Assembly X86-64 Intel
mov rcx, 10
jmp .addNumbers
sub rcx, 11 ; Esta línea será ignorada ya que estamos saltando a .addNumbers

.addNumbers
  mov rax, 3
  mov rbx, 1
  add rax, rbx
```

<br />

`.addNumbers` es un **label** (etiqueta). Cuando se ensamblan en código máquina, las etiquetas se ensamblan en direcciones de memoria que apuntan a la primera instrucción después de la etiqueta.

En nuestro ejemplo, cuando el programa vea la instrucción `jmp`, el puntero de la instrucción se actualizará de forma que apunte a la línea después de `.addNumbers`, que es `mov rax, 3`.

Como nota, las direcciones de memoria están en formato <a href="/es/guia/mates/sistema-numerico.md">hexadecimal</a>, así que la dirección de memoria `0x00000011` que ves en la tercera instrucción de abajo en realidad corresponde a `17` en decimal, que es como normalmente hablamos de números. Por ahora, no pasa nada por ignorar esto - explicaremos el hexadecimal un poco más tarde.

<p align="center">
  <br />
  <img height="275" src="https://cdn.hackclub.com/019c1ec0-c2fe-73b8-96b5-60cd69001d3e/image.png">
  <br />
  <br />
  <span>
      <em>Tras saltar, tu registro de puntero de instrucción contendrá la dirección de memoria de la primera instrucción debajo de la etiqueta</em>
  </span>
</p>

<br />

---

<a href="/es/guia/escribiendo-codigo/instrucciones/mates.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png">
    <img align="left" width="70" src="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/es/guia/escribiendo-codigo/instrucciones/condicionales.md">
        Condicionales →
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

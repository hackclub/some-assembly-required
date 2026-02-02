# Una multitud de lenguajes assembly

<p align="center">
  <br />
  <img height="250" src="https://cdn.hackclub.com/019c1e52-462f-7132-9662-84c78b17e453/image.png">
</p>
<br />

Hay muchos lenguajes assembly diferentes, dependiendo del procesador con el que quieras hablar. Algunos de los más populares son:

- **X86** es uno de los lenguajes assembly más útiles, pero también uno de los más complicados de escribir. La mayoría de los ordenadores y videoconsolas modernos/as lo utilizan. Se utiliza para los procesadores Intel, ¡que tienen que procesar muchos datos!

- **ARM** también es muy útil y complicado. Es el lenguaje que utilizan la mayoría de smartphones, tabletas e incluso Raspberry Pis. Recientemente, se está utilizando para cosas como los nuevos procesadores M1 de Apple.

- El **6502** se utilizó en muchos sistemas antiguos influyentes, como la NES, el Apple II o el Commodore 64, y aún hoy se emplea en algunos dispositivos pequeños. Se diseñó pensando en los programadores humanos y no en un compilador, por lo que su sintaxis es más sencilla que la de la mayoría de los lenguajes assembly.

- El **Z80** es otro que quizá conozcas: ¿recuerdas las calculadoras TI-8X que probablemente usastes en el colegio? Pues bien, para programarlas se utilizaba el lenguaje assembly Z80.

- **RISC-V** es un lenguaje assembly más sencillo, creado con fines educativos y de investigación. RISC significa "Reduced Instruction Set Compiler" (compilador de conjunto de instrucciones reducido). Su objetivo es utilizar un conjunto de instrucciones más pequeño que la mayoría de los demás lenguajes assembly.

Dado que el procesador de mi MacBook Pro es un procesador Intel X86 de 64 bits, utilizaré código assembly **X86-64** para demostrar conceptos de assembly. Estos conceptos se traducirán a través de diferentes lenguajes assembly.

<br />

---

<br />

> #### Nota:
>
> Los lenguajes de alto nivel facilitan la programación automatizando muchos de los intrincados detalles del lenguaje ensamblador para que tú y yo no tengamos que pensar en ellos. Debido a esta automatización, los ordenadores a menudo acaban haciendo trabajo extra que realmente no necesitan hacer. Ahora bien, los ordenadores son muy rápidos, así que este trabajo innecesario probablemente sólo tarda unos milisegundos más en hacerse la mayoría de veces. Un usuario nunca notará que tu aplicación web tardó 203 milisegundos en cargar en lugar de 200, así que el trabajo extra no importa en este caso, o en la mayoría de los otros casos. Sin embargo, hay algunos casos en los que realmente necesitas exprimir cada onza de rendimiento de tu CPU.
>
> El ejemplo más obvio está en el desarrollo de motores de juegos. Para crear la ilusión de movimiento, la mayoría de los juegos se ejecutan a un mínimo de 60 fotogramas por segundo y muchos jugadores juegan a 144 fotogramas por segundo. Esto significa que hay un área del código base de un motor de juegos (llamado "game loop/"bucle del juego") que necesita poder ejecutarse en 1/144 de segundo (7 milisegundos).
>
> Si el código de tu motor de juego está escrito en un lenguaje de alto nivel, estará haciendo todo el trabajo extra del que hemos hablado antes, y ese trabajo extra puede hacer que el tiempo de ejecución de tu bucle de juego ("game loop") supere el límite de los 7 milisegundos. Esto ralentizará la velocidad de fotogramas de tu juego, lo que provocará un juego entrecortado ¡y algunos jugadores descontentos !
>
> En esta situación, si eres capaz de "bajar" al lenguaje ensamblador (assembly), ahora tienes el control total sobre lo que tu programa le está diciendo a tu CPU que haga. Si identificas partes en los que tu lenguaje de alto nivel está haciendo un trabajo innecesario y los sustituyes por lenguaje ensamblador optimizado para humanos, puede que consigas que ese bucle del juego vuelva a estar por debajo de los 7 milisegundos ¡y que tus jugadores vuelvan a estar contentos!
>
> Ahora, para ser claros, el lenguaje assembly es sólo una de las muchas herramientas disponibles en tu caja de herramientas de optimización, y la mayor parte del código lento puede optimizarse sin ningún assembly. Sin embargo, los motores de juegos y otras aplicaciones altamente sensibles a la eficiencia a menudo necesitan hacer un uso completo de esa caja de herramientas, es por ello que son la razón principal por la cuál la gente sigue escribiendo assembly hoy en día.

<br />

---

<br />

<p align="center">
  <br />
  <img width="250" src="https://cdn.hackclub.com/019c1e52-ee7c-749a-aa14-35eb9bfe48cb/image.png" />
</p>

<br />

---

<a href="/es/guia/cpu/mundo-fisico.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png">
    <img align="left" width="70" src="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/es/guia/escribiendo-codigo/datos.md">
        Captura los datos →
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

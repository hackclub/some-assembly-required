# Lógica booleana

Si has programado un poco, probablemente habrás visto alguna vez la palabra **boolean**. Boolean es una palabra muy bonita para un concepto muy simple. Un boolean es algo que sólo puede tener uno de dos valores:

- verdadero
- falso

Verdadero o falso también se pueden representar con números: **1** para verdadero, **0** para falso. Nos hemos adentrado un poco en este concepto en secciones anteriores, pero es un concepto básico importante para lo que ocurre físicamente dentro de la CPU.

Dado que en el mundo físico representamos los datos con la **inclusión** o **ausencia** de señales eléctricas, podemos usar algo llamado **funciones booleanas** para calcular los resultados de sentencias condicionales simples como `b && c` o `!a`.

¿Por qué íbamos a utilizar esto? Buena pregunta. Te contaré otro secreto.

¿Recuerdas que antes aprendimos que todo código tiene que acabar en números para que el ordenador lo entienda?

Bueno, eso es porque tu ordenador está ejecutando esos números a través de estas operaciones lógicas. **Cada una**. Los números están representados por señales eléctricas, y esas señales eléctricas pasan a través de piezas físicas de hardware que realizan estas funciones booleanas y envían nuevas señales eléctricas que representan sus resultados.

Todas las operaciones matemáticas que puede hacer tu procesador se hacen combinando algunas de estas operaciones. Así que le envías algunas señales eléctricas, pasa a través de algunas de estas "puertas lógicas" de hardware, en forma física de transistores, y ¡BAM! tienes una respuesta al final. Combinas un montón de estas pequeñas respuestas a través de más transistores, ¡y entonces tienes una respuesta más grande! Así es como acaban haciéndose las matemáticas y como acaban almacenándose los datos.

Recorramos estas operaciones lógicas, ¡en realidad son bastante sencillas!

## AND

<img height="75" src="https://cloud-6sy33924f-hack-club-bot.vercel.app/0and.png">

Esta imagen es una representación de una puerta lógica <code>AND</code>, donde las entradas son los cables de la izquierda y el resultado es el cable que sale por la derecha.

`AND` es siempre falso a menos que ambas entradas sean verdaderas.

| Entrada | Salida |
| -- | --- |
| 00 | 0   |
| 10 | 0   |
| 01 | 0   |
| 11 | 1   |

## OR

<img height="75" src="https://cloud-m3gro1bsz-hack-club-bot.vercel.app/0or.png">

`OR` es siempre verdadero a menos que ambas entradas sean falsas.

| Entrada | Salida |
| -- | --- |
| 00 | 0   |
| 10 | 1   |
| 01 | 1   |
| 11 | 1   |

## NOT

<img height="75" src="https://cloud-gc5ntwfp3-hack-club-bot.vercel.app/0not.png">

`NOT` sólo requiere una única entrada, y la invierte.

| Entrada | Salida |
| -- | --- |
| 0  | 1   |
| 1  | 0   |

## NAND

<img height="75" src="https://cloud-6kz6e5s0t-hack-club-bot.vercel.app/0nand.png">

`NAND` siempre es verdadero a menos que ambas entradas sean verdaderas. `NAND` es lo contrario de `AND`.

| Entrada | Salida |
| -- | --- |
| 00 | 1   |
| 10 | 1   |
| 01 | 1   |
| 11 | 0   |

<br />

---

> **NAND es especial**
>
> Un dato curioso: sólo necesitas la puerta NAND (puerta AND seguida de NOT) para hacer todas las operaciones lógicas posibles.
>
> Esto significa que todos los circuitos lógicos posibles se pueden hacer usando sólo NAND. De hecho, un transistor NAND físico ocupa menos área que un transistor AND. Para hacer un AND, tendrías que hacer un NAND e invertir la salida. Echa un vistazo al curso gratuito [De Nand2 a Tetris](https://www.nand2tetris.org/) para construir un sistema informático completo utilizando sólo estos principios.
---

<br />

## NOR

<img height="75" src="https://cloud-j6qrpnbsy-hack-club-bot.vercel.app/0nor.png">

`NOR`es siempre falso a menos que ambas entradas sean falsas. `NOR` es lo contrario de `OR`.


| Entrada | Salida |
| -- | --- |
| 00 | 1   |
| 10 | 0   |
| 01 | 0   |
| 11 | 0   |

## XOR

<img height="75" src="https://cloud-3wsvzk7wf-hack-club-bot.vercel.app/0xor.png">

`XOR` es verdadero si las entradas son diferentes, falso si son iguales.


| Entrada | Salida |
| -- | --- |
| 00 | 0   |
| 10 | 1   |
| 01 | 1   |
| 11 | 0   |

## XNOR

<img height="75" src="https://cloud-emvf8qkr5-hack-club-bot.vercel.app/0xnor.png">

`XNOR` es verdadero si las entradas son iguales, falso si son diferentes. `XNOR` es lo contrario de `XOR`.


| Entrada | Salida |
| -- | --- |
| 00 | 1   |
| 10 | 0   |
| 01 | 0   |
| 11 | 1   |

## Suma de números

Ahora que ya conoces las diferentes funciones booleanas, ¡mira esto!

<p align="center">
  <br />
  <img height="250" src="https://cloud-rfdol75q1-hack-club-bot.vercel.app/0adder.png">
</p>
<br />

Este diagrama muestra cómo todas las funciones booleanas que hemos aprendido anteriormente pueden combinarse para formar un circuito que suma dos números. Hay una pieza real de hardware físico dentro de la CPU que estás usando ahora mismo que está estructurada exactamente así.

Ahora, este es un diagrama que yo mismo no entiendo completamente, pero lo que representa es muy importante: tu CPU no está haciendo nada mágico cuando hace cosas "inteligentes" como sumar números, sólo está encadenando funciones booleanas realmente simples para calcular resultados más complicados.

---

> Después de leer esta sección, si quieres jugar con la vinculación de puertas lógicas, echa un vistazo a [LogicLights](https://logiclights.vercel.app/) por el [Hack Clubber](https://hackclub.com/) [@pranav](https://github.com/pranavnt)!

---

<br />

<a href="sistema-numerico.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg">
    <img align="left" width="70" src="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/conclusion.md">
        Terminemos →
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
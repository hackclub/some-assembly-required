# Registros

Ahora que sabemos sobre datos, debemos hablar de almacenamiento de datos. En nuestra breve mención de los registros anteriormente, aprendimos que los registros están para almacenar datos temporalmente para su uso posterior.

En programación de alto nivel, usarías una variable para almacenar datos para su uso posterior. Puedes pensar en los registros como las variables del lenguaje ensamblador.

Aquí hablaremos de los registros del **x86-64**, pero los conceptos se aplican también a otros procesadores.

<p align="center">
  <br />
  <img src="https://cdn.hackclub.com/019c1ebb-cc4f-70a5-9198-7f0cb3a56ae1/image.png">
  <br />
  <span>
    <em>Registros utilizados habitualmente</em>
  </span>
</p>
<br />

Hay unos cuantos registros entre los que elegir, y cada uno de ellos tiene una convención establecida sobre cómo utilizarlo. Algunos de los registros son de propósito general, lo que significa que puedes almacenar allí lo que necesites mientras se ejecuta tu programa. Pero también hay algunos registros especializados que se usan para datos específicos, como [el pointer de instrucción](#the-instruction-pointer) o [el pointer de la stack](#the-stack-pointer), de los que hablaremos pronto.

## Registro de datos

Como hemos aprendido antes, lo único que podemos almacenar en nuestros registros son números, ya que un ordenador sólo puede entender números.

Los datos que se guardan en los registros son:

1. Números (`10`)
1. Letras (`"M"`)
1. Direcciones de memoria (`0x12345678`)

El ordenador almacena esos números como [bits](/es/guia/escribiendo-codigo/datos.md), y la cantidad de bits que puede contener un registro depende del procesador.

¿Has oído hablar de **32 bits** o **64 bits**? Se refiere al tamaño de los registros del procesador. Así que un procesador de 64 bits tiene el doble de espacio en un solo registro que los procesadores de 32 bits, lo que se parece a algo así:

```
0000101011111000011000110101000100001010111110000110001101010001
```

Mientras que 32 bits sería:

```
000010101111100001100011010100
```

Los registros de 64 bits pueden contener hasta un enorme $18,446,744,073,709,551,615$.

Los de 32 bits, en cambio, pueden contener hasta $4,294,967,295$.

Eso son, **18 quintillones** vs **4 billones**. Menuda diferencia, ¿eh?

¿Por qué no es el doble? La forma en que funciona el binario es que crece exponencialmente con el número de bits que puedes usar. Así que duplicar el tamaño de nuestros registros fue una gran mejora para los ordenadores.

Hay procesadores x86 de 16, 32 y 64 bits, por lo que especificamos "-64" en "x86-64" para saber que estamos hablando de la versión de 64 bits. Verás algunos ejemplos en Internet que utilizan la versión de 32 bits, y los registros a los que se refieren son diferentes. Normalmente los registros de 32 bits empiezan por la letra `E`, mientras que los de 64 bits suelen empezar por la letra `R`.

Como un registro contiene **64 bits**, también puede traducirse a **8 bytes** (64 _(bits)_ divididos por 8 _(bits en un byte)_).

Al igual que tenemos **bytes** para referirnos a grupos de **bits**, tenemos **palabras** para referirnos a grupos de **bytes**.

- Una única **palabra** son **2 bytes**, que son, 16 bits (2 _(bytes)_ multiplicados por 8 _(bits por byte)_).

- Una **palabra doble** son **4 bytes**, que son, 32 bits (4 _(bytes)_ multiplicados por 8 _(bits por byte)_).

- Una **palabra cuádruple** son **8 bytes**, que son, 64 bits (8 _(bytes)_ multiplicados por 8 _(bits por byte)_).

Por lo tanto, otra forma de referirse al tamaño del registro es como una palabra cuádruple, o **qword**.

<br />

---

<a href="/es/guia/escribiendo-codigo/datos.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png">
    <img align="left" width="70" src="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/es/guia/escribiendo-codigo/instrucciones/mov.md">
        Manejemos este ordenador →
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

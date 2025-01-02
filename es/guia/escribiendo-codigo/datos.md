# Datos

Tenemos que hablar de datos antes de continuar. Hasta ahora los hemos eludido, hablando de ellos como unos y ceros, o simplemente _datos_. Pero cómo se almacenan los datos es importante para escribir en ensamblador.

Una unidad de datos, que es sólo un 1 o un 0, se llama **bit**.

<p align="center">
  <br />
  <img height="150" src="https://cloud-1csdtyu7d-hack-club-bot.vercel.app/0bit.png">
</p>
<br />

El conjunto más pequeño de bits se denomina **byte**. En realidad, eso no es del todo cierto: la mitad de un byte es un **nybble**, que es adorable, pero no se utiliza habitualmente.

¿Ha oído hablar de los kilobytes (KB) o megabytes (MB)? ¿O el tan famoso gigabyte (GB)? Se trata de los mismos bytes, ¡pero en mayor cantidad!

Un byte se compone de **8 bits**. Por eso, el 8 es un número mágico: _todo_ acaba siendo divisible por 8.

## Bytes & ASCII

¿Por qué el número mágico es 8?

Bueno, ASCII utiliza 7 bits para representar caracteres (como `A`), pero normalmente se almacena en **8 bits** porque así es como la mayoría de los ordenadores manejan los datos.

Esto tiene que ver con el hecho de que cada letra está representada por un número. Como cada carácter está representado por un número, tenemos que tener una tabla que indique qué número representa a qué letra. Podemos utilizar esa tabla para ver qué caracteres se corresponden con qué números.

¡ Esto se hace con la [tabla ASCII](https://www.asciitable.com/) !

<p align="center">
  <br />
  <img height="500" src="https://cloud-m6tqomah2-hack-club-bot.vercel.app/0ascii.png">
  <br />
  <br />
  <span>
    <em>
      Echa un vistazo <a href="https://www.asciitable.com/">asciitable.com</a> para ver la tabla completa
    </em>
  </span>
</p>
<br />

Para representar esos números ASCII sólo en `0`s y `1`s, tenemos que convertir nuestro número de base 10 (digamos que estamos trabajando con `A`, que corresponde a `65` en la tabla ASCII) en un número de base 2 (`01000001`). Tenemos que representar este número en binario porque, como hemos aprendido antes, los datos informáticos se representan físicamente mediante señales eléctricas de encendido o apagado, que corresponden directamente con `1`s y `0`s.

Nuestra tabla ASCII llega hasta el número 255. En binario, `11111111` es 255. ¡Así que 8 bits cubren todos los caracteres ASCII!

_Nota: Para más información sobre los sistemas numéricos y la conversión a binario, consulta la sección [sistema numérico](/es/guia/mates/sistema-numerico.md), pero por ahora no hay ningún problema en ignorar esta parte._

<br />

---

<a href="/es/guia/escribiendo-codigo/multitud.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg">
    <img align="left" width="70" src="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/es/guia/escribiendo-codigo/registros.md">
        Almacenemos estos datos →
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
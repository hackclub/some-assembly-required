# Comunicando con la CPU

Estamos acostumbrados a comunicarnos con la CPU en un lenguaje de alto nivel como JavaScript o C, pero el código que escribirías en estos lenguajes no representa directamente lo que le estás diciendo a la CPU que haga.

Es como si decidieras viajar a Grecia. Escribir en un lenguaje de alto nivel sería como comprar un paquete de viaje que lo gestionara todo por ti, como la reserva de los billetes de avión, los hoteles, la gestión de la comida o el alquiler del coche. Si quisieras gestionar esas cosas manualmente, tendrías que comprar cada cosa por separado y organizarla tú mismo.

Del mismo modo, con tu ordenador, si quieres controlar cada aspecto de lo que le pides que haga, tendrás que escribirle las instrucciones en un formato llamado lenguaje ensamblador (assembly).

El lenguaje ensamblador es el nivel más bajo de abstracción en informática, en el que el código que escribes sigue siendo legible para el ser humano. Puede que no estés de acuerdo con la parte legible por humanos cuando lo veas por primera vez, ¡pero te prometo que es mejor que lo que ve el ordenador!

¿Qué entendemos por abstracción? Bueno, una abstracción es una capa por encima de otra cosa que hace que esa cosa sea más fácil de hacer.

<p align="center">
  <br />
  <img height="300" src="https://cloud-lrwvwyim3-hack-club-bot.vercel.app/0wheel.png">
</p>
<br />

Por ejemplo, el volante. Un volante simplifica la conducción: sólo tienes que girar a la izquierda y a la derecha, y la cantidad que giras se corresponde con lo que giran tus neumáticos. Pero, ¿qué ocurre debajo? El volante es una capa de abstracción sobre las barras, las palancas y cualquier otra cosa que ocurra dentro del coche, que simplifica el acto de girar. O algo así. Está claro que no sé nada de coches.

En nuestro caso, el ensamblaje es el volante, y las barras, palancas y demás cosas ocultas son nuestro código máquina.

El código máquina es sólo un montón de números que el ordenador puede leer. De hecho, resulta que **todo son sólo números** por debajo. Los ordenadores sólo entienden números, así que todo lo que hacemos tiene que traducirse a números.

Así, el código máquina no es más que un montón de números que la CPU lee para averiguar qué instrucciones debe ejecutar y sobre qué datos. Es el código legible por el ordenador.

Como a los humanos nos gusta leer texto, el ensamblador es un lenguaje basado en texto, formado por siglas que representan instrucciones para el ordenador. Por desgracia, al ser texto, no son directamente legibles por la CPU. Así que ese archivo de texto se traduce, a través de algo llamado **ensamblador**, en números que el ordenador puede leer.

Es como si fueras estadounidense y le dieras a tu amigo islandés una receta de tarta. Los estadounidenses escriben las recetas en medidas imperiales (por ejemplo, tazas, cucharadas, etc.) y los islandeses, en medidas métricas (gramos, litros, etc.).

<p align="center">
  <br />
  <img src="https://cloud-r72u23edw-hack-club-bot.vercel.app/0recipe-resized.png">
</p>
<br />

Línea por línea, traducirías la receta hasta que tuvieras una nueva receta para tu amigo. Tomarías la primera medida, 2 tazas de harina (**lenguaje assembly**), la convertirías a gramos (**el ensamblador**), y luego escribirías la receta convertida para utilizar 136 gramos de harina (**código máquina**). Mírate, ¡tú eres el ensamblador!

Podrías saltarte todas estas travesuras del ensamblador escribiendo el código máquina directamente, pero el código máquina se parece a algo así:

```
73 137 252 73 137 245 65 85
65 84 232 52 0 0 0 232
```

Por otra parte, Assembly (lenguage ensamblador), se parece a esto:

```asm
mov r12, r13
add r12, 4
```

Sé que esto no parece muy amigable, especialmente comparado con los lenguajes de programación de alto nivel que tenemos hoy en día. Sin embargo, ¡te prometo que es mucho más amigable que escribir un montón de números!

Todos los lenguajes de programación tienen algún nivel de abstracción por encima del código máquina. Pero, al final, todo el código escrito por humanos tiene que convertirse en números para que tu CPU pueda leerlo.

<br />

---

<a href="cpu.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg">
    <img align="left" width="70" src="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="instrucciones.md">
        ¿Cómo funciona? →
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
# Electricidad y el mundo físico

Ahora sabemos cómo la CPU es capaz de interpretar el código máquina, que no es más que números como instrucciones. Y sabemos que estas instrucciones pueden representarse sólo con 1s y 0s, también conocido como [binario](es/guia/mates/sistema-de-numeros.md#binario-base-2).

En el mundo físico, estos números binarios se corresponden con circuitos eléctricos. Para simplificar un poco, si un circuito contiene corriente eléctrica, puede considerarse "encendido", o **1**. Si no tiene corriente eléctrica, puede considerarse "apagado", o **0**. Utilizando este principio, varios circuitos se pueden organizar en un grupo para representar números binarios.

<p align="center">
  <br />
  <img width="375" src="https://cloud-n4b1b7kn3-hack-club-bot.vercel.app/0conveyer2.png">
</p>
<br />

Sigamos con nuestra metáfora del almacén, donde el almacén es nuestra CPU y una sola caja es un grupo de circuitos eléctricos. Una sola caja viajará por el almacén sobre cintas transportadoras para llegar de una estación de trabajo a otra. Las cintas transportadoras, en el mundo de la CPU, se conocen como **buses**. Los buses son grupos de cables que permiten que la electricidad (y con lo cual, información representada por 0s y 1s) viaje de un lugar a otro, y hay diferentes tipos de cables dependiendo del tipo de datos que quieras enviar.

A medida que una caja recorre el almacén en cintas transportadoras, se detendrá en diferentes estaciones de trabajo. Algunas estaciones pueden comprobar el interior de la caja y enviarla a otro lugar en función de lo que encuentren. Otras estaciones pueden añadir o quitar cosas de la caja. Esto es como en una CPU: nuestros datos, o señales eléctricas, viajan por la CPU en buses, y cuando llegan a diferentes partes de la CPU, puede que se compruebe o modifique su valor.

## Reloj del procesador

En nuestro almacén, queremos asegurarnos de que todo sucede a un ritmo organizado, y no hay interrupciones en las estaciones. Una forma de conseguirlo es configurando todo con un temporizador. Digamos que nuestras cajas avanzan al ritmo de 1 estación por segundo, y cada estación tarda 1 segundo en realizar su tarea. En el mundo de las CPUs, este sería nuestro **reloj del procesador**.

Se _llama_ reloj del procesador, pero en realidad es más como un metrónomo. Está hecho de un material que oscila, moviéndose hacia adelante y hacia atrás a una cierta frecuencia, dando un montón de vibraciones por segundo. A cada una de estas vibraciones la llamamos "tic-tac de reloj". Estas vibraciones ayudan a mantener la CPU sincronizada, ya que cada "tic-tac del reloj" indica que la CPU inicia una nueva instrucción al obtener los datos de la instrucción de la memoria.

Esto es importante para nosotros porque por cada tic del reloj, la CPU lee una instrucción. Este reloj va _realmente rápido_. Las CPU de hoy en día se miden en gigahercios (GHz), lo que equivale aproximadamente a ¡**un billón de ciclos por segundo**!

<br />

---

<a href="convirtiendo.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg">
    <img align="left" width="70" src="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/es/guia/programar/multitud.md">
        Escribamos algo de código →
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
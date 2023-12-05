# Convirtiendo una Instrucción a Código Máquina

<p align="center">
  <br />
  <img width="375" src="https://cloud-ksjv20zq7-hack-club-bot.vercel.app/0communicate.png">
  <br />
</p>

<br />

Puede que te estés preguntando qué aspecto puede tener esto. Si es así, ¡estás de suerte! Vamos a convertir una instrucción en código máquina.

¿Recuerdas nuestros registros? Hablaremos de ellos [más adelante](/es/guia/programar/registros.md), pero para este ejemplo, sólo necesitamos recordar que son lugares donde puedes almacenar cosas temporalmente.


```asm
add r12, 4 ; Añade el número 4 al número guardado en el registro 12
```

Primero, la CPU va y obtiene la instrucción. En código máquina, esto podría terminar pareciéndose a esto (veremos lo que es [binario](/es/mates/sistema-de-numeros#binario-base-2) más tarde):

```
00000001 00001100 00000100
```

Lo que, en [base 10](#sistema-de-numeros) (¡como normalmente hablamos de números!), es:

```
1 12 4
```

Cuando el decodificador lee su primer valor, sabe que está buscando un número para asignarlo a un opcode.

| Número | Instrucción |
| ------ | ----------- |
| 1      | `add`       |
| 2      | `sub`       |
| ...    | ...         |

Ahora, digamos que el número `1` corresponde al opcode `add`. Cuando ve el `1`, sabe que está leyendo una instrucción `add`.

El decodificador sabe que el primer argumento de la instrucción `add` es ambos:

- el destino de guardado
- y la posición del primer número a sumar

El decodificador ve entonces que el siguiente dato tiene el valor `12`, por lo cual sabe que su destino es el registro 12 (`r12`). Entonces puede coger el número almacenado en `r12` para la parte matemática.

El decodificador sabe que a continuación viene el argumento para el número a sumar, que es `4`.

Luego todo esto se ejecuta. La CPU envía el número `4` y el número almacenado en el registro 12 (`r12`) a la ALU, que envía la suma de estos dos números de nuevo a la CPU. La CPU toma esta suma de la ALU y la guarda en el registro 12 (`r12`). ¡Lo conseguimos!

<br />

---

<br />

> #### Nota:
>
> Hoy en día, en lugar de un ciclo en el que cada flujo de instrucciones termina antes de que empiece el siguiente, las CPU implementan algo llamado **pipelining**.
>
> Imaginemos un almacén en el que estamos empaquetando cajas. La CPU es el almacén, y cada estación (la adición de artículos, el empaquetado y la carga en furgonetas) es un paso en el procesamiento de instrucciones (los paquetes).
>
> En el método de ciclo más simple descrito anteriormente, un paquete estaría completamente empaquetado y enviado antes de trabajar en el siguiente.
>
> Como alternativa, el pipelining utilizaría una cadena de montaje en la que un paquete pasaría por una única estación. Una vez que termina y pasa a la siguiente estación, ¡llega un nuevo paquete a esta estación! Antes de que se envíe nuestro primer paquete, ya se han empezado a llenar y empaquetar otros.
>
> Lo que esto significa para nosotros en términos de CPU es que las CPU modernas pueden buscar, descodificar y ejecutar simultáneamente diferentes instrucciones al mismo tiempo. Esto reduce drásticamente el tiempo de ejecución, lo que permite a la CPU funcionar mucho más rápido. ¡Bravo para nosotros!

<br />

---

<a href="instrucciones.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg">
    <img align="left" width="70" src="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="mundo-fisico.md">
        Trasladando esto al mundo físico →
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
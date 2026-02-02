# El Ciclo de Instrucciones

Cuando le pedimos a la CPU que haga algo, lo hacemos mediante una instrucción. Le damos una instrucción del tipo: "Oye, CPU, ¿puedes sumar estos dos números? Cuando la CPU está preparada para trabajar en esa instrucción, pone en marcha un ciclo con 3 etapas principales:

1. [**Obtener ("fetch")**](#fetch) los datos de la memoria
1. [**Descodificar**](#descodificar) esos datos para entender la instrucción
1. [**Ejecutar**](#ejecutar) la instrucción

<p align="center">
  <br />
  <img height="250" src="https://cdn.hackclub.com/019c2057-5454-73bf-8ab8-f9986f81b105/image.png">
</p>

## Fetch

En la primera fase, la CPU debe obtener los datos de la instrucción de la **memoria**, para poder ver lo que le estás pidiendo que haga. La memoria, también conocida como memoria de acceso aleatorio o RAM, es un tipo de almacenamiento a corto plazo que tiene tu ordenador. Hay lugares de almacenamiento a más largo plazo, como el disco duro, pero utilizamos la memoria cuando necesitamos guardar algo temporalmente.

<p align="center">
  <br />
  <img height="400" src="https://cdn.hackclub.com/019c2058-0655-7f71-ba4e-97afe2da09c9/image.png">
</p>
<br />

Imaginemos que nuestra CPU es un almacén. Acceder a su memoria es algo así como ir a un estante de almacenamiento con cajas. Cada caja _(datos)_ tiene una ubicación _(dirección de memoria)_ donde puedes ver lo que hay dentro de la caja _(leer los datos en esa dirección de memoria)_. También puedes sacar todo de la caja _(borrar el contenido en esa dirección de memoria)_, y poner cosas nuevas en la caja _(almacenar nuevos datos en esa dirección de memoria)_.

Aquí tienes algo curioso: en la memoria, todos los datos se almacenan en forma de electricidad. Y como almacenamos los datos en forma de electricidad, cuando tu ordenador se apaga y no le llega más electricidad, ¡todas las cosas que tenías almacenadas se borran! Es algo así como si cada noche, al cerrar el almacén, se tiraran todos los paquetes. Por eso nos referimos a ella como memoria a corto plazo: queremos asegurarnos de guardar las cosas importantes en el disco duro, que es nuestro almacenamiento a más largo plazo, no sea que se tire.

Nuestro almacén _(memoria)_ tiene bastante espacio para almacenar nuestras cosas, suficiente para guardar cajas grandes. Pero mover cajas grandes por el almacén puede ser lento y engorroso. Así que, para un almacenamiento más rápido, pequeño y temporal, tenemos un conjunto de cubículos numerados a lo largo del suelo del almacén donde podemos colocar paquetes más pequeños. Son los **registros** de nuestra CPU.

<p align="center">
  <br />
  <img height="250" src="https://cdn.hackclub.com/019c2058-8210-7a48-a101-92b8f19d56be/image.png">
</p>

Los registros son el lugar donde la CPU puede almacenar pequeños fragmentos de datos para poder seguir interactuando con ellos. Por ejemplo, supongamos que necesitamos sumar dos números.

Primero, la CPU recupera el primer número que necesita para la ecuación. Como la CPU sólo puede hacer una cosa a la vez, tiene que guardar este número para poder coger el siguiente. Así que almacena este primer número en un registro por el momento.

Después, la CPU coge el segundo número de la ecuación. La CPU tiene ahora toda la información que necesita para sumar los dos números. Sigue adelante y ejecuta la instrucción de suma, pasando el nuevo número, y luego pasa a la siguiente instrucción que se le da.

Ahora te estarás preguntando: ¿por qué no almacenamos todo en los registros, ya que la memoria es más lenta? Bueno, sólo tenemos una cantidad limitada de espacio en nuestros registros. El tamaño real depende del hardware de tu ordenador. Dependiendo del procesador en particular, puedes tener alrededor de 16 registros de propósito general para almacenar tus datos. Hay más registros, pero algunos se utilizan internamente y no se puede acceder a ellos directamente.

La memoria puede almacenar fácilmente más de _15 millones de veces_ la cantidad que pueden almacenar los registros. Como los ordenadores tienen que procesar tantos datos, podemos quedarnos rápidamente sin espacio en nuestros registros. Así que cualquier dato que no necesitemos utilizar activamente para una instrucción, lo colocamos en la memoria.

## Descodificar

Ahora que hemos obtenido los datos, ¿qué aspecto tienen realmente?

Bueno, como hemos aprendido, el ordenador sólo puede leer números. Así que todos los datos que almacenamos tienen que estar representados de forma que el ordenador pueda leerlos.

Lo que esos números representan incluye cinco grandes categorías, mostradas aquí con ejemplos de su aspecto:

1. Opcodes de instrucción (`add`)
1. Valores numéricos (`10`)
1. Letras (`"M"`)
1. Registros (`rax`)
1. Direcciones de memoria (`0x12345678`)

La CPU distinguirá qué tipo de datos está mirando cuando llegue a este paso de descodificación.

Cada CPU tiene un conjunto de instrucciones que está construido _físicamente en el chip_, que puedes pensar como una lista de acciones que se coordinan con números que la CPU puede hacer. Como los datos obtenidos en la fase de obtención son sólo números, la CPU puede decodificar la instrucción comparando el número que ve con la lista de instrucciones.

| Número | Instrucción |
| ------ | ----------- |
| 1      | `add`       |
| 2      | `sub`       |
| ...    | ...         |

La primera parte de los datos que obtiene es el **opcode**, que es el identificador único de una acción que la CPU puede ejecutar. En el caso de sumar dos números, ese opcode podría ser `add`.

Los siguientes números que se obtienen son los argumentos a ejecutar. Por ejemplo, digamos que tenemos una instrucción como:

```asm
add 3, 4
```

Nuestro opcode es `add`, y nuestros argumentos son `3` y `4`!

## Ejecutar

Una vez descodificados los datos obtenidos, la CPU dispone de una instrucción que puede ejecutar.

Si la instrucción es aritmética (como sumar o restar) o lógica (como comparar dos dígitos para obtener un verdadero o falso), hay una parada extra en la **unidad aritmético-lógica**, o **ALU**. Esta unidad es la encargada de realizar las operaciones matemáticas. Una vez terminada la operación, la ALU devuelve un valor que se almacena en un registro hasta que una instrucción lo necesite.

<br />

---

<a href="comunicando.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png">
    <img align="left" width="70" src="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="convirtiendo.md">
        Veamos esto en la práctica →
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

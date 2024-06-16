# Cómo se apila todo

Los ordenadores asignan un trozo de memoria para que sea la «pila», un lugar donde se pueden almacenar bytes para su uso posterior. Puedes hacer 2 cosas con una pila:

1. **empujar** un valor en ella, que va encima de los valores anteriores
2. **sacar** un valor de la pila, que se retira de la parte superior de la pila y se coloca en un registro.

¿Necesitas algo en la parte inferior? Mala suerte. Tienes que pasar por arriba.

<p align="center">
  <br />
  <img height="375" src="https://cloud-ded5b376v-hack-club-bot.vercel.app/0stack.png">
  <br />
  <span>
    <em>
      El último en entrar, el primero en salir.
    </em>
  </span>
</p>
<br />

En código, esto se ve así:

```asm
; Sintaxis Assembly X86-64 Intel
push rax
push rbx ; rbx está por encima de rax
push rcx ; rcx está por encima de rbx y rax
push rdx ; rdx está por encima de rcx, rbx y rax

; Hacerlos saltar en sentido inverso
pop rdx ; rdx está al principio de la pila, sácalo primero
pop rcx
pop rbx
pop rax
```

<br />

Así que ahora que sabemos qué es la pila, hablemos de cómo funciona por debajo. Tenemos un área especial de la memoria separada sólo para los valores de la pila. Se accede a la pila a través de un registro especial llamado **puntero de pila** (`%rsp`), que mantiene un registro de la dirección de memoria que apunta a la parte superior de la pila. Así, cada vez que "empujamos" `push` sobre la pila, automáticamente se incrementa el puntero. Cada vez que "sacamos" `pop` fuera de la pila, automáticamente disminuye.

El propósito de la pila es almacenar cosas para más tarde. Ahora podrías decir, espera un minuto, ¡usamos registros para eso! Y estarías en lo cierto. Sin embargo, tenemos un número limitado de registros. Supongamos que estamos haciendo una operación matemática complicada y necesitamos almacenar algunos valores durante un tiempo mientras resolvemos un problema que utiliza valores diferentes. Podemos simplemente `push` esos valores para guardarlos en la pila, y luego cuando hayamos terminado con esa matemática, podemos `pop` y continuar como si nada hubiera pasado. Así:

<br />

```asm
; Sintaxis Assembly X86-64 Intel
mov rax, 1
mov rbx, 2
mov rcx, 3
mov rdx, 4

; queremos calcular la suma de rax y rbx, pero no queremos perder el
; valor que solía estar almacenado en rax, así que primero lo empujamos a la pila.
push rax
add rax, rbx

; de forma similar, queremos calcular la suma de rcx y rdx sin perder el
; valor que se almacenaba en rcx.
push rcx
add rcx, rdx

; en este punto, los valores en nuestros registros se ven así:
;
; rax: 3 (1+2)
; rbx: 2
; rcx: 7 (3+4)
; rdx: 4
;
; y nuestra pila (stack) se ve así:
;
; 3 <--- la parte superior de la pila
; 1

; ~~~
; imagína que aquí hacemos cosas interesantes con los valores recién calculados en rax y rcx.
; ~~~

; ahora que hemos terminado de trabajar con estas sumas, vamos a restaurar rax y rcx a sus
; antiguos valores, para que podamos usarlos de nuevo en futuros cálculos.
pop rcx ; tenemos que hacer saltar rcx primero, ya que lo empujamos en último lugar. Recuerda que el último elemento que se añade a una pila es el primero que se elimina.
pop rax
```

<br />

¿Por qué usamos la pila en lugar de lanzar valores en puntos aleatorios de la memoria? Bueno, el sistema operativo mantiene un registro de qué programas están usando qué memoria, así que si quisiéramos elegir un lugar al azar en la memoria para lanzar un valor, primero tendríamos que pedirle al sistema operativo poder usar un bloque de memoria que no estė en uso. Esto llevaría un montón de instrucciones extra, ya que nuestro programa se comunica con el SO (y espera a que el SO ejecute sus propias instrucciones antes de responder)

Usar la pila es mucho más rápido, porque la memoria de la pila ya estaba seccionada al principio del programa. Por eso, sabemos que siempre es seguro lanzar valores en ella, así que podemos usarla sin todo el trabajo extra del SO.

<br />

---

> #### Nota:
>
> ¿Has oído hablar alguna vez de stack overflow? ¿O quizás [stackoverflow.com](https://stackoverflow.com/)? Se llama así por esta pila. No necesitas saber esto para los propósitos de esta guía, pero ya que estamos aquí, un desbordamiento (overflow) puede ocurrir por muchas razones. Una razón podría ser causada por escribir accidentalmente un bucle infinito, donde tenemos un bucle en algún lugar que nunca se sale, y digamos que ese bucle añade cosas a la pila. Eventualmente, nuestra pila se queda sin espacio, y ¡bam! Stack overflow error (Error de desbordamiento de pila).

---

<br />

<a href="/es/guia/escribiendo-codigo/instrucciones/funciones.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg">
    <img align="left" width="70" src="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/es/guia/escribiendo-codigo/instrucciones/convenciones.md">
        Qué convencional →
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
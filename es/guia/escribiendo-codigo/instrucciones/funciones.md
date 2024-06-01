# Pongámonos funcionales

Así que ahora en assembly podemos hacer muchas cosas. Podemos guardar «variables», podemos hacer operaciones matemáticas, podemos saltar por el código. Pero no tenemos nada que se parezca a nuestra querida amiga, la [función](https://developer.mozilla.org/es/docs/Web/JavaScript/Guide/Functions). Podemos saltar a una sección concreta del código con `jmp` y otras instrucciones similares, pero cuando terminamos de ejecutar esa área de código, ¡no podemos volver a donde estábamos cuando llamamos a ese código!

<br />

```js
// JavaScript
let result = addNumbers();
result = doSomethingElse(result);

function addNumbers() {
  return 3 + 1;
}

function doSomethingElse(arg) {
  return arg + 1;
}
```

<br />

En JavaScript, podríamos hacer algo como llamar a una función, y una vez que haya terminado, volverá automáticamente a donde se llamó a esa función, y continuará ejecutando el programa.

En assembly, no tenemos funciones reales, pero podemos simularlas bastante bien - introduciendo las instrucciones `call` y `ret`.

<br />

```asm
; Sintaxis Assembly X86-64 Intel
call .addNumbers
call .doSomethingElse

.addNumbers
  mov rax, 3
  add rax, 1
  ret

.doSomethingElse
  add rax, 1
  ret
```

<br />

Podemos pensar en nuestros labels como nuestros nombres de función. No tenemos la capacidad de pasar argumentos a nuestros labels de la misma manera que podemos hacerlo en funciones de JavaScript, ¡pero tenemos registros que podemos utilizar! Así que aquí, estamos utilizando `rax` para mantener nuestro [valor de «retorno»](https://developer.mozilla.org/es/docs/Learn/JavaScript/Building_blocks/Return_values) de cada «función».

Nuestra primera instrucción es la instrucción `call`. Estamos llamando al label `.addNumbers`, que nos salta a la primera instrucción dentro del label `.addNumbers`, `mov rax, 3`.

¿Recuerdas nuestro **puntero de instrucción**? Como recordatorio, es un registro que la CPU utiliza para realizar un seguimiento de la instrucción para la que está obteniendo datos. El puntero de instrucción contiene la dirección de memoria de la instrucción que se está ejecutando en ese momento.

Cuando usamos la instrucción `call`, es similar a una instrucción de salto (`jmp`), pero en realidad está haciendo varias cosas por debajo:

1. **Empuja** lo que hubiera sido la siguiente instrucción a algo llamado **pila** (stack).
2. Luego actualiza el puntero de la instrucción para que apunte a la dirección de memoria de la primera instrucción dentro del label `.addNumbers`.

Vamos a pasar por alto el empujar a la pila por ahora, ya que hablaremos de eso en la siguiente sección. Lo que necesitas saber ahora es que está guardando donde estamos actualmente en la memoria para más tarde.

Al final de nuestra «función», llamamos a `ret`, abreviatura de return. Si aún no lo has adivinado, ¡esto nos devuelve a la siguiente instrucción después de nuestro `call` (llamada) original!

Lo hace **sacando** nuestra dirección de memoria anterior de la pila hacia el puntero de instrucción.

¡Ahora podemos simular funciones! Esto es en realidad lo que las funciones C terminan compilando en assembly. Si es suficientemente bueno para C, ¡es suficientemente bueno para mí!

Volvamos a la pila (stack). ¿Qué diablos es esto de empujar y sacar?

<br />

---

<a href="/es/guia/escribiendo-codigo/instrucciones/bucles.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg">
    <img align="left" width="70" src="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/es/guia/escribiendo-codigo/instrucciones/stack.md">
         Cómo se apila todo →
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
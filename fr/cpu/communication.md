# Communiquer avec le CPU

On est habitués à **communiquer avec le CPU** en utilisant un langage de haut niveau comme JavaScript ou C.  
Mais le code que tu écris dans ces langages **ne correspond pas directement** aux instructions que tu donnes réellement au CPU.

Imagine que tu décides de partir en voyage en Grèce.
- Utiliser un **langage de haut niveau**, c'est comme acheter un **pack voyage** : billets d’avion, hôtel, repas, location de voiture, tout est géré pour toi.  
- Par contre, si tu veux tout gérer **toi-même**, tu devras acheter séparément chaque billet, réserver tes hôtels, organiser tes repas, etc.

Eh bien avec ton ordinateur, c’est pareil :  
si tu veux **contrôler chaque petit détail** de ce qu’il fait, tu dois écrire tes instructions dans un format particulier qu’on appelle le **langage assembleur**.

---

Le **langage assembleur**, c’est **le niveau le plus bas** de code qu’un humain peut encore lire sans que ça ressemble à un tas de chiffres illisibles.  
Bon, tu risques quand même de douter du mot *"lisible"* quand tu verras ton premier code assembleur… 😅  
Mais crois-moi, c’est **beaucoup mieux** que ce que le CPU lit directement !

---

## L’abstraction, c’est quoi au juste ?

Une **abstraction**, c’est une couche qui simplifie quelque chose de compliqué.

<p align="center">
  <br />
  <img height="300" src="https://cloud-lrwvwyim3-hack-club-bot.vercel.app/0wheel.png">
</p>
<br />

Prenons un exemple : **un volant de voiture**.  
Tu le tournes à gauche ou à droite, et hop, tes roues suivent le mouvement.  
Mais en réalité, sous le capot, c’est une **usine à gaz** : des tiges, des leviers, des engrenages… bref, tout un système complexe que tu n’as pas besoin de voir.  

Le volant est donc **l’abstraction** qui rend la conduite super simple.  
Tu n’as pas besoin de tout comprendre pour tourner à gauche !

Dans notre cas :  
- **L’assembleur**, c’est le volant
- Et les **tiges et leviers cachés**, c’est le **code machine**.

---

## Le code machine : la langue du CPU

Le **code machine**, c’est juste… **des nombres**.  
Rien que des nombres que le CPU lit pour savoir quelles instructions exécuter et sur quelles données travailler.  

En fait, **tout dans un ordinateur est représenté par des nombres** à la base.  
Comme le CPU ne comprend que ça, **tout notre code finit forcément traduit en chiffres**.

Problème : les humains préfèrent lire du texte que des lignes de chiffres incompréhensibles.  
Du coup, l’assembleur utilise **des abréviations textuelles** pour représenter ces instructions.

Mais attention : **le CPU ne comprend pas l’assembleur directement** !  
Il faut donc traduire ce code texte en code machine.  
C’est le rôle du **compilateur assembleur**, qu’on appelle… *l’assembleur*.  
À des fins pratique on va l'appeler : *programme assembleur* (PA)


---

## Une recette en deux systèmes de mesure 🍰

Imagine que tu sois Américain et que tu veuilles partager une recette avec un ami islandais.  
Petit hic :  
- Aux **États-Unis**, on utilise les **cups, tablespoons** et autres mesures impériales.  
- En **Islande**, on utilise les **grammes, litres**, etc. (système métrique).

<p align="center">
  <br />
  <img src="https://cloud-r72u23edw-hack-club-bot.vercel.app/0recipe-resized.png">
</p>
<br />

Pour l’aider, tu devras **traduire la recette ligne par ligne** :

- Tu prends *2 cups de farine* (**assembleur**)  
- Tu convertis ça en *136 grammes de farine* (**PA**)  
- Et tu lui donnes la nouvelle recette avec les bonnes unités (**code machine**)

Dans cette analogie : **toi, tu es le PA**.

---

## À quoi ça ressemble ?

Si tu voulais sauter la partie assembleur et écrire directement en code machine,  
ça ressemblerait à **un mur de chiffres** comme ça :

```
73 137 252 73 137 245 65 85
65 84 232 52 0 0 0 232
```

Pas très accueillant, hein ? 😬

L’assembleur, lui, ressemble plutôt à ça :

```asm
mov r12, r13
add r12, 4
```

C’est toujours un peu cryptique, mais beaucoup plus lisible que des tas de nombres incompréhensibles !

<br />

---

<table width="100%">
  <tr>
    <td align="left">
      <a href="communication.md"><strong>< Communiquer avec un CPU</strong></a>
    </td>
    <td align="right">
      <a href="cycle.md"><strong>Le cycle d'instruction ></strong></a>
    </td>
  </tr>
</table>

---

<p align="center">
  <a href="https://hackclub.com/">
    <img width="35" src="https://cloud-l0g1cgz4b-hack-club-bot.vercel.app/0h.png"><br/>
    Fait avec ❤️ par Hack Club
  </a>
</p>
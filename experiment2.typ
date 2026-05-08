// --- PAKET-IMPORTE (STAND MAI 2026) ---
#import "@preview/cetz:0.5.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

// --- GLOBALE EINSTELLUNGEN ---
#set text(lang: "de", size: 11pt)

// Codly Konfiguration (Code-Präsentation)
#show: codly-init.with()
#codly(
  languages: codly-languages,
  zebra-fill: luma(250),
  stroke: 0.5pt + luma(200)
)

= Typst Fachbuch-Showcase (CeTZ 0.5.2 & Fletcher 0.5.8)

== 1. Mathematik (Fehlerfrei)
Wie besprochen: Modifikatoren wie `.bar` existieren nicht für beliebige Symbole. Wir nutzen die Funktion `overline()`:

$cal(L) = -1/4 F_(mu nu) F^(mu nu) + i overline(psi) D slash psi + h.c. + overline(psi)_i y_(i j) psi_j phi$

== 2. Präzisionsgrafik mit CeTZ 0.5.2
In CeTZ 0.5.x ist es best practice, die Funktionen explizit über den `draw`-Namespace aufzurufen, um den Konflikt mit der nativen Typst-Funktion `grid` zu vermeiden:

#figure(
  cetz.canvas({
    import cetz.draw

    // Hintergrund-Gitter (Vermeidet Konflikt mit Typst-native grid)
    draw.grid((0,0), (4,4), step: 1, stroke: gray + 0.2pt)

    // Zeichnung einer Kurve
    draw.line((0,0), (1,2), (3,2.5), (4,0), stroke: blue + 1.5pt, name: "pfad")

    // Punkt am Ende des Pfades
    draw.circle("pfad.end", radius: 0.15, fill: red)

    // Beschriftung
    draw.content((2,3), [Scheitelpunkt], frame: "rect", fill: white, padding: 2pt)
  }),
  caption: [Vektorgrafik mit CeTZ 0.5.2.]
)

== 3. Kommutatives Diagramm mit Fletcher 0.5.8
Die Syntax für Kanten und Knoten ist in 0.5.8 sehr stabil. Wir nutzen hier die automatische Platzierung:

#figure(
  diagram(
    node-stroke: 0.5pt,
    spacing: 4em,
    node((0,0), [Abstraktion], name: <a>),
    node((1,1), [Implementierung], name: <b>),
    node((2,0), [Resultat], name: <c>),

    edge(<a>, <b>, "-|>", [Design]),
    edge(<b>, <c>, "-|>", [Kompilierung]),
    edge(<a>, <c>, "->", [Theorie], dash: "dashed", bend: 20deg),
  ),
  caption: [Strukturdiagramm mit Fletcher 0.5.8.]
)

== 4. Quellcode mit Codly 1.3.0
Hier ein Java-Beispiel mit den neuen automatischen Icons:

```java
public class TypstSuccess {
    public static void main(String[] args) {
        // Erfolgreich gesetzt mit Typst 2026
        System.out.println("Alle Bibliotheken geladen!");
    }
}
```

#context [
  Dieser Text steht auf Seite #counter(page).get().first().
]

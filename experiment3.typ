#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond, ellipse

#set text(lang: "de")

= Datenbank-Modellierung (ER-Diagramm)

In der Entwurfsphase nutzen wir die visuelle Syntax von Fletcher, um Relationen zwischen Objekten zu definieren.

#figure(
  diagram(
    node-stroke: 1pt,
    spacing: 3cm, // Abstand zwischen den Elementen

    // --- ENTITÄTEN (Rechtecke) ---
    node((0,0), [Student], name: <student>, shape: rect, fill: blue.lighten(90%), inset: 10pt),
    node((2,0), [Kurs], name: <kurs>, shape: rect, fill: blue.lighten(90%), inset: 10pt),

    // --- BEZIEHUNG (Raute) ---
    node((1,0), [belegt], name: <belegt>, shape: diamond, fill: orange.lighten(90%), inset: 4pt),

    // --- ATTRIBUTE (Ellipsen) ---
    // Attribute für Student
    node((-0.8, -0.8), [MatrNr], name: <matr>, shape: ellipse, inset: 4pt),
    node((-0.8, 0.8), [Name], name: <name>, shape: ellipse, inset: 4pt),

    // Attribute für Kurs
    node((2.8, -0.8), [KursID], name: <kid>, shape: ellipse, inset: 4pt),
    node((2.8, 0.8), [Titel], name: <titel>, shape: ellipse, inset: 4pt),

    // --- VERBINDUNGEN (Edges) ---
    // Verbindungen Entität <-> Beziehung mit Kardinalitäten
    edge(<student>, <belegt>, "-", label: [n], label-pos: 0.2, label-side: left),
    edge(<belegt>, <kurs>, "-", label: [m], label-pos: 0.8, label-side: left),

    // Verbindungen Entität <-> Attribute
    edge(<student>, <matr>, "-"),
    edge(<student>, <name>, "-"),
    edge(<kurs>, <kid>, "-"),
    edge(<kurs>, <titel>, "-"),
  ),
  caption: [Einfaches ER-Diagramm in Krähenfuß-naher Notation.]
)

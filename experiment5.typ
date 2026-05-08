#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

= Port-Verbindungen (TikZ-Style)

#figure(
  diagram(
    node-stroke: 1pt,
    spacing: 3cm,

    // Zwei einfache Blöcke
    node((0,0), [Block A], name: <a>, shape: rect, width: 2.5cm, height: 1.5cm),
    node((1,1), [Block B], name: <b>, shape: rect, width: 2.5cm, height: 1.5cm),

    // 1. Kante zu Kante: Von Ost nach Süd
    edge(<a.east>, <b.south>, "->", [Kante 1], label-side: left, bend: -20deg),

    // 2. Ecke zu Ecke: Nord-Ost nach Nord-West
    edge(<a.north-east>, <b.north-west>, "->", [Kante 2], bend: 30deg),

    // 3. Zentrum zu Kante
    edge(<a.center>, <b.west>, "=>", stroke: red + 1pt)
  )
)

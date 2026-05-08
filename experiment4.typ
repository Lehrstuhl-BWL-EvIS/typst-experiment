#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set text(lang: "de")

// --- ROBUSTE HILFSFUNKTION FÜR UML-KLASSEN ---
// Nutzt ein einfaches Grid. 'stroke' zeichnet automatisch den äußeren
// Rahmen und die horizontalen Trennlinien zwischen den Zellen.
#let uml-class(name, attrs, methods) = grid(
  columns: 1,
  stroke: 0.8pt,
  inset: 8pt,
  align(center)[*#name*],
  align(left)[#attrs],
  align(left)[#methods]
)

= System-Architektur (UML)

#figure(
  diagram(
    spacing: 4cm,

    // --- KLASSE 1: Universität ---
    // Der Knoten ist unsichtbar (stroke: none), das Grid bringt seinen eigenen Rahmen mit
    node((0,0),
      uml-class(
        "Universität",
        [
          + name: String \
          + standort: String
        ],
        [
          + immatrikulieren(s: Student) \
          + exmatrikulieren(s: Student)
        ]
      ),
      name: <uni>,
      stroke: none,
      shape: rect,   // <--- Wichtig
      inset: 0pt     // <--- Entfernt den unsichtbaren Puffer
    ),

    // --- KLASSE 2: Student ---
    node((1,0),
      uml-class(
        "Student",
        [
          - matrikelNr: int \
          - name: String
        ],
        [
          + studieren() \
          + prüfungSchreiben()
        ]
      ),
      name: <student>,
      stroke: none,
      shape: rect,   // <--- Wichtig
      inset: 0pt     // <--- Entfernt den unsichtbaren Puffer
    ),

    // --- ASSOZIATIONEN ---
    // 'left' ist bei einer Links-Nach-Rechts-Linie oben
    edge(<uni>, <student>, "->", label: [nimmt auf], label-side: left),

    // 'right' ist unten
    edge(<uni>, <student>, "-", label: [1], label-pos: 0.1, label-side: right),
    edge(<uni>, <student>, "-", label: [0..\*], label-pos: 0.9, label-side: right)
  ),
  caption: [Robustes UML-Klassendiagramm auf Basis von Typst-Grids.]
)

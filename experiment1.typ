// --- NEUE IMPORTE FÜR 2026 ---
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

// Initialisierung mit Sprach-Unterstützung
#show: codly-init.with()
#codly(
  languages: codly-languages,
  zebra-fill: luma(250),        // Dezente Streifen für bessere Lesbarkeit
  stroke: 0.5pt + luma(200)      // Sauberer Rahmen um den Code
)

= Quellcode-Test (Version 1.3.0)

Hier ist ein Java-Beispiel mit automatischer Icon-Erkennung:

```java
public class Typst2026 {
    public static void main(String[] args) {
        System.out.println("Codly 1.3.0 läuft!");
    }
}
```

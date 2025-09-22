#import "template.typ": *

#lorem(100)\

#equation-ext(
  title: "Ohmsches Gesetz",
  equations: (
    $R=sum^4_4 i(t)^2 $,
  ),
  variables: (
    $R$, $U$, $I$,
  ),
  definitions: (
    "Wert des Widerstandes",
    "Spannungsabfall am Widerstand",
    "Der durchfließende Strom",
  ),
)

#image-text(filename: "Data/Sine1.png", alt: "Sinusschwingung")

= Header
== Subheader

$U=2$
$
  U= \cdot I
$

#table(
  columns: 3,
  ["A"], ["B"], ["C"],
  [1], [2], [3],
  [4], [5], [6],
)
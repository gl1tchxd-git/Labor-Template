#import "template.typ": *

#let body = [
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
]
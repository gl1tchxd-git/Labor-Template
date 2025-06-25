#import "template.typ": *

#let body = [
  #lorem(100)\
  #equation-ext(
    title: "Ohmsches Gesetz",
    equations: (
      $R=U/I$,
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
]
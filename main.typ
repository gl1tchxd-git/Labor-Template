#import "template.typ": *

#show: project.with(
  title: "Laboratorium",
  authors: (
    "Max Mustermann",
    "Michael Mustermann",
  ),
  date: "January 1, 2025",
  logo: "HTBLuVA_Salzburg_Logo.svg"
)

#lorem(100)

#show: image-text.with(
  filename: "Data/Sine1.png",
  alt: "Abb. 1 Sinusschwingung",
)

#lorem(100)

#show: equation-ext.with(
  title: "Sinusschwingung",
  equations: (
    $I=U/R$,
    $t$,
    $j$
  ),
  variables: (
    "I",
    "U"
  ),
  explenations: (
    "test",
    "dlfkjsdlfj"
  ),
  text: "jaja",
)




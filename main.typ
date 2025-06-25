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
  title: "Title",
  equations: (
    $U=R*I$,
    $"test"$,
  ),
  variables: (
    $U$,
    $R$,
    $I$,
  ),
  definitions: (
    "Definition 1",
    "Definition 2 (also longer text to test the layout)"
  ),
  explanation: "Explenation of the equations and definitions.",
)
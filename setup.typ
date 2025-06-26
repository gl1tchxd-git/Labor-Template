// Variables

#let colors = (
  equation-ext-fg: rgb("#e4fafd"),
  equation-ext-bg: rgb("#cbfbff"),
)

#let spacers = (
  equation-ext-y: v(10pt),
  equation-ext-x: 40pt,
)

#let equation-ext-ratio = 60%

#let division(size) = box(fill: rgb(147, 114, 177), inset: 20pt / size)[
    #text(
      fill: rgb("#f5f5f5"),
      size: 14pt / size,
      font: "Proxima Nova",
      "ELEKTRONIK UND \nTECHNISCHE INFORMATIK"
    )
  ]

#let info = (
  author: (
    "Max Mustermann", 
    "Michael Mustermann",
  ),
  date: datetime(
    year: 2025,
    month: 1,
    day: 1,
  ),
  title: "Laboratorium",
  description: "Kurzbeschreibung Arbeitsauftrag",
  logo: "Public/HTBLuVA_Salzburg_Logo.svg",
  class: "3AHEL",
  lesson: "LAB"
)

#let styling(it) = {
  set text(
    size: 1em,
    font: "New Computer Modern",
    ligatures: true,
    historical-ligatures: true,
    discretionary-ligatures: false,
    hyphenate: true,
    lang: "at"
  )
  set heading(
    numbering: "1.a",
  )
  set par(
    justify: true,
    linebreaks: "optimized",
    // first-line-indent: 1.5em,
  )

  //------METADATA------//

  set document(
    author: info.author,
    date: info.date,
    title: info.title,
    description: info.description,
  )

  it
}
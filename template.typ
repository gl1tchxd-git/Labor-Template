#let project(
  title: "",
  subtitle: "",
  authors: (),
  date: none,
  logo: none,
  body,
) = {
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: end)
  set text(font: "New Computer Modern", lang: "de")
  show math.equation: set text(weight: 400)
  set heading(numbering: "1.1")

  // Set run-in subheadings, starting at level 5.
  // show heading: it => {
  //   if it.level > 4 {
  //     parbreak()
  //     text(11pt, style: "italic", weight: "regular", it.body + ".")
  //   } else {
  //     it
  //   }
  // }

  v(0.6fr)
  if logo != none {
    align(right, image(logo, width: 26%))
  }
  v(9.6fr)

  text(1.1em, date)
  v(1.2em, weak: true)
  text(2em, weight: 700, title)

  // Author information.
  pad(
    top: 0.7em,
    right: 20%,
    grid(
      columns: (1fr,),
      gutter: 1em,
      ..authors.map(author => align(start, strong(author))),
    ),
  )

  v(2.4fr)
  pagebreak()

  set par(justify: true)

  body
}

#let image-text(
  filename: "",
  alt: "",
  body
) = {
  pad(
    {
      image("Data/Sine1.png", alt: alt)
      alt
    },
    20pt,
    top: 10pt,
    bottom: 10pt,
  )

  body
}

#let equation-ext(
  title: "",
  equations: (),
  variables: (),
  explenations: (),
  text: "",
  body,
) = {
  pad(
    block(
      width: 100%,
      fill: rgb(255, 249, 143, 255), 
      stroke: yellow, 
      inset: 10pt,
      radius: 5pt,
    )[
      #title
      #block(inset: 10pt)[
        #grid(
          columns: (2fr, 1fr),
          gutter: 0em,
          block(
            grid(
              gutter: 0em,
              inset: 0.5em,
              // stroke: rgb(0, 0, 0, 255),
              align: left,
              ..equations.map(eq => align(start, eq))
            )
          ),
          block(
            grid(
              gutter: 0em,
              columns: (2fr, 6fr),
              // stroke: rgb(0, 0, 0, 255),
              ..variables.zip(explenations).map(((var, expl)) => (
                pad(right: 0pt, rest: 0.5em, var + box(width: 1fr, align(right, repeat(".", justify: false)))),
                pad(left: 1pt, rest: 0.5em, expl)
              )).flatten()
            ),
          )
        )
      ]
      #text
    ]
  )

  body
}
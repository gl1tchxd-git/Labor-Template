#import "setup.typ": *

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
  definitions: (),
  explanation: "",
  body,
) = {  
  v(0.5em)
  align(center)[
    #block(
      fill: colors.equation-ext-color, 
      stroke: colors.equation-ext-stroke,
      width: 80%,
      inset: 10pt,
      radius: 5pt,
    )[
      #align(left)[#text(size: 1.2em, title)]
      #grid(
        align: horizon + center,
        columns: (60%, 40%),
        // stroke: rgb(0, 0, 0, 255),
        gutter: 0em,
        grid(
          gutter: 0em,
          inset: 0.5em,
          ..equations.map(eq => align(center)[
            #show math.equation: set text(font: "New Computer Modern Math")
            #show raw: set text(font: "New Computer Modern Math")
            #math.equation(eq)
          ])
        ),
        block(width: 100%, breakable: true)[
          #grid(
            gutter: 0em,
            columns: (20%, 10%, 70%),
            // stroke: rgb(0, 0, 0, 255),
            align: top,
            ..variables.zip(definitions).map(((var, def)) => (
              pad(right: 0pt, rest: 3pt, align(right)[
                #show math.equation: set text(font: "New Computer Modern Math")
                #show raw: set text(font: "New Computer Modern Math")
                #var
              ]),
              pad(x: 0pt, rest: 3pt, repeat(".", justify: true)),
              pad(left: 1pt, rest: 3pt,
                align(left)[
                  #block(width: 100%)[
                    #box(width: 100%)[
                      #text(hyphenate: true, eval(mode: "markup", def))
                    ]
                  ]
                ]
              )
            )).flatten(),
          )
        ]
      )
      #align(left, explanation)
    ]
  ]

  body
}
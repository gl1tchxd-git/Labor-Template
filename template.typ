#import "setup.typ": *

#let cover = {
  set page(
    margin: (x: 60pt)
  )

  v(0.6fr)
  if info.logo != none {
    align(right, image(info.logo, width: 30%))
  }
  v(9.6fr)

  let months = (
    "Januar",
    "Februar",
    "März",
    "April",
    "Mai",
    "Juni",
    "Juli",
    "August",
    "September",
    "Oktober",
    "November",
    "Dezember",
  )

  let weekdays = (
    "Montag",
    "Dienstag",
    "Mittwoch",
    "Donnerstag",
    "Freitag",
    "Samstag",
    "Sonntag",
  )

  grid(
    columns: 2,
    rows: 2,
    gutter: 1.5em,
    // stroke: rgb(0, 0, 0, 255),

    {
      let date = weekdays.at(info.date.weekday() - 1) +", " + info.date.display("[day padding:none]. ") + months.at(info.date.month() - 1) + " " + info.date.display("[year]")

      text(1.1em, date)
      v(1.2em, weak: true)
      text(2em, weight: 700, info.title)
      v(1em, weak: true)
      text(1.3em, weight: 500, info.description)
    },

    {},
    
    pad(
      right: 20%,
      align(horizon)[
        #grid(
          columns: (1fr,),
          gutter: 1em,
          ..info.author.map(author => align(start, strong(author)))
        )
      ]
    ),

    align(bottom, 
      division(1)
    )
  )

  v(0.6fr)
  pagebreak()
}

#let contents = (
  heading: [
    #context {
      let headings = counter(heading).final().first()
  
      if headings > 0 {
        outline(title: "Inhaltsverzeichnis")
        pagebreak()
      }
    }
  ],
  image: [
    #context {
      let images = counter(figure.where(kind: image)).final().first()
  
      if images > 0 {
        pagebreak()
        outline(title: "Abbildungen", target: figure.where(kind: image))
      }
    }
  ],
)


#let image-text(
  filename: "",
  alt: "",
) = {
  pad(
    figure(
      image(filename, alt: alt),
      supplement: "Abb.",
      caption: alt,
      gap: 1em
    ),
    20pt,
    top: 10pt,
    bottom: 10pt,
  )
}

#let equation-ext(
  title: "",
  equations: (),
  variables: (),
  definitions: (),
  explanation: "",
  ratio: equation-ext-ratio,
  fg: colors.equation-ext-fg,
  bg: colors.equation-ext-bg,
) = {
  spacers.equation-ext-y
  align(center)[
    #block(
      fill: fg, 
      stroke: bg,
      width: 100% - spacers.equation-ext-x,
      inset: 10pt,
      radius: 5pt,
    )[
      #align(left)[#text(size: 1.2em, title)]
      #grid(
        align: horizon + center,
        columns: (ratio, 1fr),
        // stroke: rgb(0, 0, 0, 255),
        gutter: 0em,
        grid(
          gutter: 0em,
          inset: 0.5em,
          ..equations.map(eq => align(center)[
            #eq
          ])
        ),
        block(width: 100%, breakable: true)[
          #grid(
            gutter: 0em,
            columns: (10pt, 10pt, auto),
            // stroke: rgb(0, 0, 0, 255),
            align: horizon,
            ..variables.zip(definitions).map(((var, def)) => (
              pad(right: 0.5pt, top: 3pt, align(right + top)[
                #var
              ]),
              pad(x: 0pt, top: 3pt, align(top)[#repeat(".", justify: true)]),
              pad(left: 1pt, rest: 3pt,
                align(left)[
                  #block(width: 100%)[
                    #box(width: 100%)[
                      #text(hyphenate: true, par(justify: false, linebreaks: "optimized", eval(mode: "markup", def)))
                    ]
                  ]
                ]
              )
            )).flatten(),
          )
        ]
      )
      #if explanation.len() > 0 {
        align(left, explanation)
      }
    ]
  ]
}

#let header(it) = {
  set page(
    header:
    [
      #align(center)[
        #block(width: 100%)[
        #grid(columns: (1fr, 1fr, 1fr),
          align(left + horizon, image(info.logo)),
          align(center + horizon, info.class),
          align(right + horizon, info.lesson)
        ) 
      ]
      ]
    ],
    footer:
    [
      #align(center)[
        #block(width: 100%)[
        #grid(columns: (1fr, 1fr, 1fr),
          align(left + horizon, division(2)),
          align(center + horizon, info.author.at(0)),
          align(right + horizon, context counter(page).get().at(0))
        ) 
      ]
      ]
    ]
  ) 

  it
}
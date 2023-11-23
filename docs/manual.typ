#import "@preview/tidy:0.1.0"
#import "utils.typ": *
#import "../drafting.typ"
#let module = tidy.parse-module(read("../drafting.typ"), scope: (drafting: drafting))

#show raw.where(lang: "standalone"): text => {
  standalone-margin-note-example(raw(text.text, lang: "typ"))
}

#show raw.where(lang: "standalone-ttb"): text => {
  standalone-margin-note-example(raw(text.text, lang: "typ"), direction: ttb)
}

#show raw.where(lang: "example"): content => {
  set text(font: "Linux Libertine")
  example-with-source(content.text, drafting: drafting, direction: ltr)
}

#show raw.where(lang: "example-ttb"): content => {
  set text(font: "Linux Libertine")
  example-with-source(content.text, drafting: drafting)
}

#let show-mod-old = show-module-fn
#let show-module-fn = show-mod-old.with(first-heading-level: 0)

#show-module-fn(module, "margin-note-defaults")

#show-module-fn(module, "margin-note")
```standalone
= Document Title
#lorem(3)
#margin-note(side: left)[Left note]
#margin-note[right note]
#margin-note(stroke: green)[Green stroke, auto-offset]
#lorem(10)
#margin-note(side: left, dy: -10pt)[Manual offset]
#lorem(10)
```

#show-module-fn(module, "inline-note")
```example
= Document Title
#lorem(7)
#inline-note[An inline note that breaks the paragraph]
#lorem(6)
#inline-note(par-break: false)[A note with no paragraph break]
#lorem(6)
```

#show-module-fn(module, "rule-grid")
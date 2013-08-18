Ruby Markup Language (RBML)
===========================

RBML is a Ruby DSL for creating HTML documents. It's meant to be used as a templating system, like
ERB or HAML. The difference is that RBML is pure Ruby, which makes for some very interesting
possibilities.

Quick Demo
----------

Here's what it looks like:

    html {
      head {
        title "Ruby Markup Language"
        script(src: "http://code.jquery.com/jquery-2.0.3.min.js")
      }
      body {
        h1 "The Pure-Ruby Markup Language"
        p {
          a("RBML", href: "https://github.com/Ajedi32/RBML")
          contents << " is a markup language with a pure-Ruby syntax!"
        }

        p {
          text("You can access data passed to the template through the `data` object:")
          div(data[:hello])
        }
      }
    }

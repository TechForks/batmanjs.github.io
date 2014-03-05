IdGenerator = require('./id_generator')

class Autolink
  @_undocumented: {}

  @CANDIDATE_REGEXP = ///                   # "test" : http://rubular.com/r/aCUg3nq6fC
              (?!\[)                        # not already a link (preceded by "[")
              (`                            # Wrapped in `
                Batman                      # starts with Batman
                (?:\.[A-Z][A-Za-z]+)+       # Has one or more CamelCased words which are joined by .
              `)
              (?![\s\w]*\]\()               # not already a link (followed by " some topic](")
            ///g                            # all of them

  @insertLinks: (text="", generator) ->
    newText = text.replace @CANDIDATE_REGEXP, (match, className, offset, string) =>
      pageId = new IdGenerator(className.replace(/`/g, '')).toString()
      if generator.hasId(pageId)
        path = "/docs/api/" + pageId + ".html"
        link = "[#{className}](#{path})"
      else
        if !@_undocumented[className]
          @_undocumented[className] = true
          console.warn "-----> No API Documentation for #{className}"
        className
    newText

module.exports = Autolink

fs     = require('fs')

class TemplateWriter
  @write: (template, destination, replacements) ->
    content = fs.readFileSync("#{__dirname}/../_templates/#{template}").toString()
    for key, replacement of replacements
      content = content.replace("#= #{key}", replacement)
    console.log("generating #{destination}")
    fs.writeFileSync("#{__dirname}/../#{destination}", content)

module.exports = TemplateWriter

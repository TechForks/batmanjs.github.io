fs     = require('fs')
mkdirp = require('mkdirp')

class TemplateWriter
  @write: (template, destination, replacements) ->
    content = fs.readFileSync("#{__dirname}/../_templates/#{template}").toString()
    for key, replacement of replacements
      content = content.replace("#= #{key}", replacement)
    console.log("generating #{destination}")

    dirs = destination.split('/')
    dirs.pop()
    baseDir = __dirname.split('/')
    baseDir.pop()

    mkdirp.sync("#{baseDir.join("/")}/#{dirs.join("/")}")
    fs.writeFileSync("#{__dirname}/../#{destination}", content)

module.exports = TemplateWriter

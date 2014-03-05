fs = require('fs')

class NamespaceParser
  _namespaceRegExp: /Batman\.version\s*=\s*['"]([\d\.]+)["']/

  constructor: (filename) ->
    fileContents = fs.readFileSync(filename)
    @_versionString = @_namespaceRegExp.exec(fileContents)[1]

  toString: -> @_versionString

module.exports = NamespaceParser

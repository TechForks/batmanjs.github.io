class IdGenerator
  constructor: (title) ->
    @_id = encodeURIComponent(title.replace(/\s/g, '_').toLowerCase())
  toString: -> @_id

module.exports = IdGenerator

'use strict'

grunt = require('grunt')

exports.pathfinder =
  all: (test) ->
    test.expect 1
    actual = grunt.file.read 'tmp/output.js'
    expected = 'requirejs(["core/core"].concat(["test/dir/module2", "test/dir/subfolder/module1", ]), function() {})'
    test.equal actual, expected, 'generated file correctly'
    test.done()

'use strict'

grunt = require('grunt')

exports.importjs =
  all: (test) ->
    test.expect 1

    actual = grunt.file.read 'tmp/output.js'
    expected = 'requirejs(["core/core"].concat(["test/dir/module2.js", "test/dir/subfolder/module1.js", ]), function() {})'
    test.equal actual, expected, 'generated file correctly'
    test.done()
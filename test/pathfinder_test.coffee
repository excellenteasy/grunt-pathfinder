'use strict'

grunt = require('grunt')

exports.pathfinder =

  requirejs: (test) ->
    test.expect 1
    actual = grunt.file.read 'tmp/requirejs_output.js'
    expected = 'requirejs(["core/core"].concat(["test/dir/module2", "test/dir/subfolder/module1", ]), function() {})\n'
    test.equal actual, expected, 'generated requirejs config file correctly'
    test.done()

  importless: (test) ->
    test.expect 1
    actual = grunt.file.read 'tmp/importless_output.less'
    expected = '// importless example template for grunt-pathfinder\n\n@import "test/dir/test.less";\n\n@import "test/dir/test2.less";\n\n'
    test.equal actual, expected, 'generated main less file correctly'
    test.done()

  index: (test) ->
    test.expect 1
    actual = grunt.file.read 'tmp/index_output.html'
    expected = '<!DOCTYPE HTML>\n<html lang="en-US">\n<head>\n  <link href="tmp/importless_output.less" rel="stylesheet" type="text/less" />\n</head>\n<body>\n  <script src="tmp/requirejs_output.js"></script>\n</body>\n</html>\n'
    test.equal actual, expected, 'generate html correctly'
    test.done()

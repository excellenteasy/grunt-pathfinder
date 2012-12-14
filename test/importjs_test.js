(function() {
  'use strict';

  var grunt;

  grunt = require('grunt');

  exports.importjs = {
    all: function(test) {
      var actual, expected;
      test.expect(1);
      actual = grunt.file.read('tmp/output.js');
      expected = 'requirejs(["core/core"].concat(["test/dir/module2", "test/dir/subfolder/module1", ]), function() {})';
      test.equal(actual, expected, 'generated file correctly');
      return test.done();
    }
  };

}).call(this);

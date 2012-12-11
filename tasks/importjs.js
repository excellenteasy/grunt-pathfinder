(function() {
  'use strict';

  module.exports = function(grunt) {
    var fs, path;
    fs = require('fs');
    path = require('path');
    return grunt.registerMultiTask('importjs', 'Your task description goes here.', function() {
      var helpers, self, _ref;
      if (typeof this.data.template !== 'string') {
        grunt.log.writeln('No template provided.');
        return;
      }
      if (!fs.existsSync(this.data.template)) {
        grunt.log.writeln('Specified tempalte file does not exist.');
        return;
      }
      helpers = require('grunt-lib-contrib').init(grunt);
      if ((_ref = this.files) == null) {
        this.files = helpers.normalizeMultiTaskFiles(this.data, this.target);
      }
      this.requiresConfig('importjs');
      self = this;
      return this.files.forEach(function(file) {
        var compiled, srcFiles, template;
        file.dest = path.normalize(file.dest);
        srcFiles = grunt.file.expandFiles(file.src);
        template = grunt.file.read(self.data.template);
        if (srcFiles.length === 0) {
          grunt.log.writeln('Unable to import; no valid source files were found.');
          return;
        }
        compiled = grunt.template.process(template, {
          data: {
            dependencies: srcFiles
          }
        });
        return grunt.file.write(file.dest, compiled);
      });
    });
  };

}).call(this);

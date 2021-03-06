###
# grunt-pathfinder
# https://github.com/excellenteasy/grunt-pathfinder
#
# Copyright (c) 2012 David Pfahler
# Licensed under the MIT license.
###

'use strict'

importless = require 'importless'

module.exports = (grunt) ->

  # importless example: filter paths
  grunt.event.on 'pathfinder-paths', (paths, setPaths, target) ->
    if target is 'importless'
      paths = importless.cssToLess paths
      imported = importless.getImported paths
      paths = importless.stripImported paths, imported
      setPaths paths
      grunt.log.writeln "Importless: Stripped imported file(s) #{imported} from paths"

  grunt.initConfig

    pathfinder:
      requirejs:
        paths:
          js: ['test/dir/**/*.js']
        output: 'tmp/requirejs_output.js'
        template: 'test/requirejs_template.js'
      importless:
        paths:
          styles: ['test/dir/**/*.{css,less}']
        output: 'tmp/importless_output.less'
        template: 'test/importless_template.less'
      index:
        paths:
          js: ['tmp/*.js']
          less: ['tmp/*.less']
        output: 'tmp/index_output.html'
        template: 'test/index_template.html'

    clean: ['tmp/']

    coffee:
      nodeunit:
        files: 'test/pathfinder_test.js': 'test/pathfinder_test.coffee'
      test:
        files: grunt.file.expandMapping(['test/dir/**/*.coffee'], '', {
          rename: (destBase, destPath) -> destBase + destPath.replace(/\.coffee$/, '.js')
        })
        #rename: (destBase, destPath, options) -> path.join(destBase, destPath)
        #rename: (destBase, destPath) -> destBase + destPath.replace(/\.coffee$/, '.js')
      tasks:
        files: 'tasks/*.js': ['tasks/*.coffee']

    nodeunit:
      all: ['test/*_test.js']

  # Actually load this plugin's task(s).
  grunt.loadTasks 'tasks'

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-nodeunit'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  # Whenever the "test" task is run, first clean the "tmp" dir, then run this
  # plugin's task(s), then test the result.
  grunt.registerTask 'test', ['coffee', 'clean', 'pathfinder', 'nodeunit']

  # By default, lint and run all tests.
  grunt.registerTask 'default', ['coffee', 'test']

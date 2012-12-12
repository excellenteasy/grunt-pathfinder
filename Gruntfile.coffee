###
# grunt-importjs
# https://github.com/excellenteasy/grunt-tasks.git#importjs-master
#
# Copyright (c) 2012 David Pfahler
# Licensed under the none license.
###

'use strict'

module.exports = (grunt) ->

  grunt.initConfig

    importjs:
      main:
        files: 'tmp/output.js': ['test/dir/**/*.js']
        template: 'test/template.js'

    clean: ['tmp/']

    coffee:
      nodeunit:
        files: 'test/importjs_test.js': 'test/importjs_test.coffee'
      test: 
        files: 'test/dir/*.js': ['test/dir/**/*.coffee']
        rename: (destBase, destPath, options) -> path.join(destBase, destPath)
      tasks:
        files: 'tasks/*.js': ['tasks/*.coffee']

    nodeunit: 
      all: ['test/importjs_test.js']

  # Actually load this plugin's task(s).
  grunt.loadTasks 'tasks'

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-nodeunit'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  # Whenever the "test" task is run, first clean the "tmp" dir, then run this
  # plugin's task(s), then test the result.
  grunt.registerTask 'test', ['clean', 'importjs', 'nodeunit']

  # By default, lint and run all tests.
  grunt.registerTask 'default', ['coffee', 'test']

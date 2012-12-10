###
# grunt-importjs
# https://github.com/excellenteasy/grunt-tasks.git#importjs-master
#
# Copyright (c) 2012 David Pfahler
# Licensed under the none license.
###

'use strict';

module.exports = (grunt) ->

  grunt.initConfig
    # Configuration to be run (and then tested).
    # importjs: 

    clean: ['tmp/']

    # Unit tests.
    nodeunit: tests: ['test/*_test.js']

  # Actually load this plugin's task(s).
  grunt.loadTasks 'tasks'

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks  'grunt-contrib-coffee'
  grunt.loadNpmTasks  'grunt-contrib-watch'
  grunt.loadNpmTasks  'grunt-contrib-nodeunit'
  grunt.loadNpmTasks  'grunt-contrib-clean'

  # Whenever the "test" task is run, first clean the "tmp" dir, then run this
  # plugin's task(s), then test the result.
  grunt.registerTask 'test', ['clean', 'importjs', 'nodeunit']

  # By default, lint and run all tests.
  grunt.registerTask 'default', ['jshint', 'test']

#
# grunt-pathfinder
# https://github.com/excellenteasy/grunt-pathfinder
#
# Copyright (c) 2012 David Pfahler
# Licensed under the MIT license.
#

'use strict'

module.exports = (grunt) ->

  fs = require 'fs'
  path = require 'path'

  grunt.registerMultiTask 'pathfinder', 'Your task description goes here.', ->

    # check config: template string
    if typeof @data.template isnt 'string'
      grunt.log.writeln 'No template provided.'
      return

    # check config: template file exists
    if not fs.existsSync @data.template
      grunt.log.writeln 'Specified tempalte file does not exist.'
      return

    helpers = require('grunt-lib-contrib').init(grunt)

    @files ?= helpers.normalizeMultiTaskFiles @data, @target

    @requiresConfig 'pathfinder'

    self = @

    @files.forEach (file) ->

      file.dest = path.normalize file.dest
      srcFiles  = grunt.file.expandFiles file.src
      template = grunt.file.read self.data.template

      if srcFiles.length is 0
        grunt.log.writeln 'Unable to import; no valid source files were found.'
        return

      # create a setter function that has access to paths in this scope so you can manipulate paths from another scope
      setSrcFiles = (newPaths) ->
        srcFiles = newPaths

      # emit event so someone can manipulate the files array before we give it to the template
      grunt.event.emit 'pathfinder-paths', srcFiles, setSrcFiles, self.target

      # compile template
      compiled = grunt.template.process template, data: paths: srcFiles

      # write to output
      grunt.file.write file.dest, compiled

      grunt.log.ok "Detected files #{srcFiles.toString()} written to #{file.dest}"

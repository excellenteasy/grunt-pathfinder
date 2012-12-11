# 
# grunt-importjs
# https://github.com/excellenteasy/grunt-tasks.git#importjs-master
# 
# Copyright (c) 2012 David Pfahler
# Licensed under the none license.
# 

'use strict'

module.exports = (grunt) ->

  fs = require 'fs'
  path = require 'path'

  grunt.registerMultiTask 'importjs', 'Your task description goes here.', ->

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

    @requiresConfig 'importjs'

    self = @
    
    @files.forEach (file) ->
      
      file.dest = path.normalize file.dest
      srcFiles  = grunt.file.expandFiles file.src
      template = grunt.file.read self.data.template

      if srcFiles.length is 0
        grunt.log.writeln 'Unable to import; no valid source files were found.'
        return
      
      compiled = grunt.template.process template, data: dependencies: srcFiles

      grunt.file.write file.dest, compiled
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
  _ = grunt.util._

  grunt.registerMultiTask 'pathfinder', 'Your task description goes here.', ->

    @requiresConfig 'pathfinder'

    # === check config === #
    # paths
    if not _.isObject @data.paths
      return grunt.log.writeln 'No "paths" config provided or incorrect format.'

    # template string
    if typeof @data.template isnt 'string'
      return grunt.log.writeln 'No "template" config provided or incorrect format.'

    # template file exists
    if not fs.existsSync @data.template
      return grunt.log.writeln 'Specified "template" file does not exist.'

    # output string
    if typeof @data.output isnt 'string'
      return grunt.log.writeln 'No "output" config provided or incorrect format.'

    # store the data that is going to be passed to the template
    templateData = {}

    # helper that adds the files of a group to tempalteData
    # a group is a key (string) of @data.paths
    addTargetToTemplateData = (group) =>

      # find all files matching the pattern
      files = grunt.file.expand @data.paths[group]

      # tolerate finding no files
      if not files.length
        grunt.log.writeln "Unable to find any files for group '#{group}'; using empty array as fallback"
        templateData[group] = []

      else
        # create a setter function that has access to paths in this scope so you can manipulate paths from another scope
        setFiles = (newPaths) -> files = newPaths

        # emit event so someone can manipulate the files array before we give it to the template
        grunt.event.emit 'pathfinder-paths', files, setFiles, @target, group

        # inform user which files are detected
        grunt.log.verbose.writeln "Found files for group #{group}: #{files}"

        templateData[group] = files

    addTargetToTemplateData(group) for group of @data.paths

    # read tempalte file
    template = grunt.file.read @data.template

    # normalize output path
    output = path.normalize @data.output

    # compile template
    compiled = grunt.template.process template, data: templateData

    # write to output
    grunt.file.write output, compiled

    grunt.log.ok "All files of groups written to #{output}"

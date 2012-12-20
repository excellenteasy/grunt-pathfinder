# grunt-pathfinder [![Build Status](https://travis-ci.org/excellenteasy/grunt-pathfinder.png?branch=master)](https://travis-ci.org/excellenteasy/grunt-pathfinder)

> Find files and process their paths in a template.

## Getting Started
_If you haven't used [grunt][] before, be sure to check out the [Getting Started][] guide._

From the same directory as your project's [Gruntfile][Getting Started] and [package.json][], install this plugin with the following command:

```bash
npm install grunt-pathfinder --save-dev
```

Once that's done, add this line to your project's Gruntfile:

```js
grunt.loadNpmTasks('grunt-pathfinder');
```

If the plugin has been installed correctly, running `grunt --help` at the command line should list the newly-installed plugin's task or tasks. In addition, the plugin should be listed in package.json as a `devDependency`, which ensures that it will be installed whenever the `npm install` command is run.

[grunt]: http://gruntjs.com/
[Getting Started]: https://github.com/gruntjs/grunt/blob/devel/docs/getting_started.md
[package.json]: https://npmjs.org/doc/json.html

### Overview
Inside your Gruntfile, add a section named `pathfinder`. This section specifies the groups of file (`paths`), the `template` to which the found filepaths are passed to and the `output` file (compiled template).

```js
grunt.initConfig({
  pathfinder: {
    indexhtml: {
      paths: {
        css: ['dir/**/*.css', 'also/this/other.css'],
        js: ['scripts/**/*.js']
      },
      template: 'template/index.html',
      output: 'dist/index.html'
    }
  }
});
```

### Settings

There are a number of options available. Please review the [minimatch options here](https://github.com/isaacs/minimatch#options). As well as some additional options as follows:

#### paths
Type: `object`

`key:value` pairs that describes `group:pattern`.
The name of the group is also the variable name that is available in the template. Hence, you can have multiple groups and multiple variables available in your template. The pattern is a minimatch pattern. The found files are stores as filepaths in the array variable (group).

#### template
Type: `String`

The template file is parsed using [`grunt.template.process`](https://github.com/gruntjs/grunt/wiki/grunt.template) and the found file paths will be passed as data. The `paths` array is available in your template file.

#### output
Type: `String`

To which file the compiled template will be saved to.

### Events
`grunt-pathfinder` emits and events using `grunt.event.emit` called `pathfinder-paths`. If you listen on this event, you can manipulate the paths array (e.g. filter it) and save it before it gets passed to the template. A use case of this is the [importless](https://github.com/excellenteasy/importless) example config in the [Gruntfile](https://github.com/excellenteasy/grunt-pathfinder/blob/master/Gruntfile.coffee#L16-22).

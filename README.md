# grunt-pathfinder

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

## The "importjs" task

### Overview
In your project's Gruntfile, add a section named `pathfinder` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  pathfinder: {
    main: {
      files:
        'path/to/output.js': ['some/**/*.js', 'other/whatever.js'],
      template: 'path/to/template.js'
    }
  }
});
```

### Options

## The pathfinder task

### Overview
Inside your Gruntfile, add a section named `pathfinder`. This section specifies the possible files to import and the method of importing them.

### Settings

There are a number of options available. Please review the [minimatch options here](https://github.com/isaacs/minimatch#options). As well as some additional options as follows:

#### files
Type: `object`

`key:value` pair that describes `outputFile:filesToImport`.
This defines where the compiled template output will be saved to (key) where dependencies are looked for (value). Value can be a string or an array of files and/or minimatch patterns.

#### template
Type: `String`

The template file will be parsed using `grunt.template` and the found js dependencies will be passed as data. The `dependencies` array is available in your template file.

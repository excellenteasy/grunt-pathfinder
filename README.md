# grunt-importjs
> Detect JavaScript dependencies in a given directory & insert them into your project

Note that this plugin is not yet available and only works with the latest bleeding-edge version of grunt.

## Getting Started
_If you haven't used [grunt][] before, be sure to check out the [Getting Started][] guide._

From the same directory as your project's Gruntfile and package.json, install this plugin with the following command:

```bash
npm install git://github.com/excellenteasy/grunt-tasks.git#importjs-master --save-dev
```

Once that's done, add this line to your project's Gruntfile:

```js
grunt.loadNpmTasks 'grunt-importjs'
```

If the plugin has been installed correctly, running `grunt --help` at the command line should list the newly-installed plugin's task or tasks. In addition, the plugin should be listed in package.json as a `devDependency`, which ensures that it will be installed whenever the `npm install` command is run.

## The importjs task

### Overview
Inside your Gruntfile, add a section named `importjs`. This section specifies the possible files to import and the method of importing them.

### Settings

There are a number of options available. Please review the [minimatch options here](https://github.com/isaacs/minimatch#options). As well as some additional options as follows:

#### files
Type: `String|Array`

This defines what file patterns this task will watch. Can be a string or an array of files and/or minimatch patterns.

#### method & target
Type: `object`
Default: "RequireJS":"mains.js"

`key:value` pair that describes `method:target`.

Currently, the only available method is `"RequireJS". You can specify the target filepath which is used as a template.

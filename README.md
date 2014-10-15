# Ronin: Static Site Boilerplate

> I build this setup to use in my personal projects. It is really
> simple, fast and highly customizable.

Ronin is a very simple and lightweight **static site boilerplate** using **Jinja2**
compiler. It uses **Makefile** as task management.

## Features

  - **SASS** as CSS preprocessor by default.
  - **ES6** (6to5) as JavaScript preprocessor by default.
  - **Jinja2** template build system by default.

## Start a new Project

Using **[Kurye](http://github.com/f/kurye)**:

```
kurye f/ronin -n myproject
```

## Build

### Base Requirements

Actually the only requirement is `Python` and `pip`. But to use asset management
you'll also need `Node` and `npm`.

  - node / npm
  - python / pip

### Building

```bash
./configure # Install requirements, prepare compile environment
make # Compile the static site
```

## Change Things

Use `package.json` file to change template settings, or pass some variables to global
template scope.

## Run

`site` directory is the directory to serve static files.

On Mac OS X, you can run:
```
open site/index.html
```

## Docs

### `assets/js/`

You should put JavaScript files here.


### `assets/css/`

You should put SCSS files here.


### `assets/templates/`

You should put Jinja2 templates here. `_base.html` is your master template by default. You can change it on `package.json` file.

```json
  "template": {
    "base": "templates/_base.html"
  },
```

## License

MIT License.

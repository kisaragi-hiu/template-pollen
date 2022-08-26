# Pollen template

A template for [Pollen](https://docs.racket-lang.org/pollen/) projects.

## License

This template itself is licensed under the public-domain-dedicating [UNLICENSE](https://unlicense.org).

## The development server

Instead of using Pollen's `raco pollen server`, this uses [npm-watch](https://www.npmjs.com/package/npm-watch) to invoke Pollen on file changes, and [live-server](https://www.npmjs.com/package/live-server) to provide live preview.

First, when source files are updated, the rendered output will automatically show up in the browser. Pollen's development server will render the file automatically, but the browser has to be refreshed manually, or on a timer with an extension.

This also allows using Tailwind for CSS while keeping the source and built files separate. Pollen's development server can only see the folder it's watching, so it's not possible to get Tailwind to render to `public/css` and have Pollen somehow see that — I'd always have to keep the built CSS file in, say, `src/css/built.css`, and I don't like that.

# Pollen template

A template for [Pollen](https://docs.racket-lang.org/pollen/) projects.

## License

This template itself is licensed under the public-domain-dedicating [UNLICENSE](https://unlicense.org).

## Make targets

- `dev`: Start a development server on `localhost:8080`. This server will live-reload on any change.
- `public`: Render everything and put it into the `public/` folder.

This relies on `/tmp` being available.

## The development server

```
make dev
```

Instead of using Pollen's `raco pollen server`, this uses [npm-watch](https://www.npmjs.com/package/npm-watch) to invoke Pollen on file changes, and [live-server](https://www.npmjs.com/package/live-server) to provide live preview.

First, when source files are updated, the rendered output will automatically show up in the browser. Pollen's development server will render the file automatically, but the browser has to be refreshed manually, or on a timer with an extension.

Second, this also allows using Tailwind for CSS while keeping the source and built files separate. Pollen's development server can only see the folder it's watching, so it's not possible to get Tailwind to render to `public/css` and have Pollen somehow see that — I'd always have to keep the built CSS file in, say, `src/css/built.css`, and I don't like that.

The server is really comprised of three Make targets:

- `dev-tailwind`, which runs Tailwind CLI in watch mode to render `src/css/index.css` to `public/css/index.css`
- `dev-server`, which uses live-server to both serve and watch `public/`, telling the browser to update if that folder changes
- `dev-pollen`, which uses npm-watch to watch Pollen and Racket source files for updates (as defined in the `watch` key in `package.json`); when an update is detected, the `public-dev` Make target is run, which builds `public/` just like the `public` target, except it doesn't demand the minified CSS be built.

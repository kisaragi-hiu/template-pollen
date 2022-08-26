# * Development server stuff

dev-tailwind:
	npx tailwindcss --postcss -i src/css/index.css -o public/css/index.css --watch

dev-pollen:
	npx npm-watch

dev-server:
	npx live-server public --no-browser

dev:
	npx concurrently "make dev-pollen" "make dev-tailwind" "make dev-server"

# Non-production version of the `public` rule at the end.
# By not requiring the built CSS file, this avoids building the
# minified version during development.
public-dev: render
	raco pollen publish src /tmp/public
	rsync -a /tmp/public/ public
	-rm -rf /tmp/public

.PHONY: dev dev-tailwind dev-pollen dev-server public-dev

# * Rendering.
HTML := $(patsubst %.html.pm,%.html,$(shell find -name "*.html.pm"))
RKT := $(shell find -name "*.rkt")

render: $(HTML)
.PHONY: render

$(HTML): %.html: %.html.pm $(RKT)
	raco pollen render "$(realpath $<)"

public/css/index.css: src/css/index.css
	npx tailwindcss --minify --postcss -i src/css/index.css -o public/css/index.css

public: render public/css/index.css
	raco pollen publish src /tmp/public
	rsync -a /tmp/public/ public
	-rm -rf /tmp/public

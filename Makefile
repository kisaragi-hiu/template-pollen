dev-tailwind:
	npx tailwindcss --postcss -i src/css/index.css -o public/css/index.css --watch

dev-pollen:
	npx npm-watch

dev-server:
	npx live-server public --no-browser

dev:
	npx concurrently "make dev-pollen" "make dev-tailwind" "make dev-server"

.PHONY: dev dev-tailwind dev-pollen

HTML := $(patsubst %.html.pm,%.html,$(shell find -name "*.html.pm"))
RKT := $(shell find -name "*.rkt")

render: $(HTML)

# raco pollen render

.PHONY: render

$(HTML): %.html: %.html.pm $(RKT)
	raco pollen render "$(realpath $<)"

public/css/index.css: src/css/index.css
	npx tailwindcss --minify --postcss -i src/css/index.css -o public/css/index.css

public: render public/css/index.css
	raco pollen publish src /tmp/public
	rsync -a /tmp/public/ public
	-rm -rf /tmp/public

# Needs https://github.com/tdewolff/minify/tree/master/cmd/minify

default: build

run:
	# before: hugo --theme=cocoa serve
	# workaround: https://github.com/gohugoio/hugo/issues/4851
	HUGO_THEME=cocoa hugo serve

build:
	rm -rf public && \
		rm -rf minified && \
		hugo  --theme=cocoa --ignoreCache=true && \
		minify -o ./minified/ -r ./public/ && \
		cp -r ./public/img minified/ && \
		cp -r ./public/favicon.png minified/ && \
		rm -rf minified/post/ minified/pages/

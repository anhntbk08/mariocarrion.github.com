# Needs https://github.com/tdewolff/minify/tree/master/cmd/minify

default: build

build:
	rm -rf public && \
		rm -rf minified && \
		hugo  --theme=lagom --ignoreCache=true && \
		minify -o ./minified/ -r ./public/ && \
		cp -r ./public/images minified/ && \
		cp -r ./public/favicon.png minified/ && \
		rm -rf minified/posts/ minified/pages/

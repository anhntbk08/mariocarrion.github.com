# Needs https://github.com/tdewolff/minify/tree/master/cmd/minify

default: build

run:
	hugo --theme=cocoa serve

build:
	rm -rf public && \
		rm -rf minified && \
		hugo  --theme=cocoa --ignoreCache=true && \
		minify -o ./minified/ -r ./public/ && \
		cp -r ./public/img minified/ && \
		cp -r ./public/favicon.png minified/ && \
		rm -rf minified/post/ minified/pages/

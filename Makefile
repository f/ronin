default:
	# Clean all generated files
	rm -rf ./site
	mkdir -p ./site/asset/js
	mkdir -p ./site/asset/css
	mkdir -p ./site/asset/images

	# Concat JavaScript Files
	cat ./asset/bower_components/jquery/dist/jquery.js \
			./asset/js/main.js \
			> ./site/asset/js/main.js


	# Uglify JavaScript files
	./node_modules/.bin/uglifyjs ./site/asset/js/main.js \
			--source-map=./site/asset/js/main.min.js.map \
			--source-map-root=../../ \
			--source-map-url=main.min.js.map \
			> ./site/asset/js/main.min.js

	# Compile SASS files
	cd ./asset/css && ../../node_modules/.bin/node-sass main.scss

	# Uglify CSS files
	cat ./asset/css/main.css \
			| ./node_modules/.bin/cleancss \
			--s0 -o ./site/asset/css/main.min.css
	rm ./asset/css/main.css

	# Generate copies to dist
	cp -R ./asset/images ./site/asset

	# Compile Templates
	./jinja.py ./templates/index.html 		./package.json --format=json > ./site/index.html
	./jinja.py ./templates/subpage.html 	./package.json --format=json > ./site/subpage.html

server:
	open http://localhost:8000
	python -m SimpleHTTPServer 8000
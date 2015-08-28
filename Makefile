default:
	# Clean all generated files
	rm -rf ./site
	mkdir -p ./site/asset/js
	mkdir -p ./site/asset/css
	mkdir -p ./site/asset/images

	# Convert ES6 Files
	./node_modules/.bin/browserify ./asset/js/main.js \
			\
			-r ./asset/bower_components/jquery/dist/jquery.js:jquery \
			\
			--outfile ./site/asset/js/main.js \
			-t [ ./node_modules/babelify/index.js \
					--stage 0 ]

	# Uglify JavaScript files
	./node_modules/.bin/uglifyjs ./site/asset/js/main.js \
			--source-map=./site/asset/js/main.min.js.map \
			--source-map-root=../../../ \
			--source-map-url=main.min.js.map \
			> ./site/asset/js/main.min.js

	# Compile SASS files
	cd ./asset/css && \
	../../node_modules/.bin/node-sass \
			--output-style compressed \
			main.scss > ../../site/asset/css/main.min.css

	# Generate copies to dist
	cp -R ./asset/images ./site/asset

	# Compile Templates
	./jinja.py ./templates/index.html 		./package.json --format=json > ./site/index.html
	./jinja.py ./templates/subpage.html 	./package.json --format=json > ./site/subpage.html

server:
	open http://localhost:8000
	python -m SimpleHTTPServer 8000

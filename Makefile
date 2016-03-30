.PHONY: build run deploy

NAME=ianneub/endeavorops

build:
	docker build -t $(NAME) .

run:
	docker run -it --rm -v $(PWD)/public:/usr/local/apache2/htdocs/ -p "80:80" $(NAME)

deploy:
	rm -rf website/_site
	cd website; jekyll build
	ssh endeavorops@broadside.dreamhost.com "rm -rf ~/endeavorops.com/*"
	scp -r website/_site/* endeavorops@broadside.dreamhost.com:~/endeavorops.com
	scp website/_site/.htaccess endeavorops@broadside.dreamhost.com:~/endeavorops.com/.htaccess

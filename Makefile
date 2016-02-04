.PHONY: build run deploy

NAME=ianneub/endeavorops

build:
	docker build -t $(NAME) .

run:
	docker run -it --rm -v $(PWD)/public:/usr/local/apache2/htdocs/ -p "80:80" $(NAME)

deploy:
	find . -name '.DS_Store' -print0 | xargs -0 rm
	ssh endeavorops@broadside.dreamhost.com "rm -rf ~/endeavorops.com/*"
	scp -r public/* endeavorops@broadside.dreamhost.com:~/endeavorops.com
	scp -r public/.htaccess endeavorops@broadside.dreamhost.com:~/endeavorops.com/.htaccess

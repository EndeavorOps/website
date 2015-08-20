.PHONY: build run

NAME=ianneub/endeavorops

build:
	docker build -t $(NAME) .

run:
	docker run -it --rm -v $(PWD)/public:/usr/local/apache2/htdocs/ -p "80:80" $(NAME)

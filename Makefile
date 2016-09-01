NAME=pmacct

all:
	docker build -t $(NAME) .

clean:
	docker rmi -f $(NAME)

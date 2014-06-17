.PHONY: build-haproxy run-haproxy

build-haproxy: haproxy/.build

haproxy/.build: 
	docker build -t jfroche/haproxy-consul haproxy
	touch $@

run-haproxy: build-haproxy
	docker run -p 8080:80 -v $${PWD}/haproxy/supervisor-conf.d:/etc/supervisor/conf.d -v $${PWD}/data/haproxy:/data jfroche/haproxy-consul

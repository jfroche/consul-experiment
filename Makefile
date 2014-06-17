.PHONY: build-haproxy run-haproxy clean

build-haproxy: haproxy/.build

haproxy/.build: 
	docker build -t jfroche/haproxy-consul haproxy
	touch $@

run-haproxy: clean build-haproxy
	docker run -p 8500:8500 -p 8080:80 -v $${PWD}/haproxy/confd:/etc/confd -v $${PWD}/haproxy/supervisor-conf.d:/etc/supervisor/conf.d -v $${PWD}/data/haproxy:/data jfroche/haproxy-consul

clean:
	rm -f data/haproxy/log/supervisor/*.err
	rm -f data/haproxy/log/supervisor/*.out

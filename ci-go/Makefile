
user=bepsays
repo=ci-go

version ?= latest

latest:
	docker build -t ${user}/${repo}:latest .

build:
	docker build -t ${user}/${repo}:${version} -t ${user}/${repo}:latest .

build-no-cache:
	docker build --no-cache -t ${user}/${repo}:${version} -t ${user}/${repo}:latest .


install: build
	docker push ${user}/${repo}:${version}
	docker push ${user}/${repo}:latest


user=bepsays
repo=ci-hugo-deploy

version ?= latest

build:
	docker build -t ${user}/${repo}:${version} -t ${user}/${repo}:latest .

install: build
	docker push ${user}/${repo}:${version}
	docker push ${user}/${repo}:latest


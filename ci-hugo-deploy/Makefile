
user=bepsays
repo=ci-hugo-deploy

build:
	docker build -t ${repo} .

install: build
	docker tag ${repo}:latest ${user}/${repo}
	docker push ${user}/${repo}


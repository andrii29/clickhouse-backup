DOCKERHUB_REPO ?= "andriik/clickhouse-backup"

docker-build:
	docker build -t $(DOCKERHUB_REPO) .
docker-push:
	docker push $(DOCKERHUB_REPO)

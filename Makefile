normal := \e[0m
bold := \e[1m
grey := \e[2m

node_version := 18

all: list

list:
	@printf "$(bold)npm_install$(grey) - Install npm packages\n$(normal)"
	@printf "$(bold)npm_update$(grey) - Update npm packages\n$(normal)"
	@printf "$(bold)npm_upgrade$(grey) - Upgrade npm packages\n$(normal)"
	@printf "$(bold)build_nuxt$(grey) - Build nuxt production files\n$(normal)"
	@printf "$(bold)build_docker_image$(grey) - Build docker image\n$(normal)"

npm_install:
	docker run -it --rm -v ${PWD}/web:/app -w /app node:$(node_version) npm install

npm_update:
	docker run -it --rm -v ${PWD}/web:/app -w /app node:$(node_version) npm update
	docker run -it --rm -v ${PWD}/web:/app -w /app node:$(node_version) npm update -D

npm_upgrade:
	docker run -it --rm -v ${PWD}/web:/app -w /app node:$(node_version) npx ncu -u
	docker run -it --rm -v ${PWD}/web:/app -w /app node:$(node_version) npm install

build_nuxt:
	docker run -it --rm -v ${PWD}/web:/app -w /app node:$(node_version) npm run build

build_docker_image: build_nuxt
	docker build -t website_since-when .
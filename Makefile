## Dev
build-dev:
	docker build --tag date-api-dev:latest --target dev .

run-dev:
	docker container run -d -p 5229:5229 --name date-api-dev --rm -e ASPNETCORE_URLS=http://+:5229 date-api-dev:latest

stop-dev:
	docker container stop date-api-dev

remove-dev:
	docker image rm date-api-dev:latest

## Prod
build-prod:
	docker build --tag date-api:latest  --target prod .

run-prod:
	docker container run -d -p 5229:5229 --name date-api --rm -e ASPNETCORE_URLS=http://+:5229 date-api:latest

stop-prod:
	docker container stop date-api

remove-prod:
	docker image rm date-api:latest

## All
remove-images:
	docker image rm date-api-dev:latest date-api:latest

## Docker Compose Dev
run-docker-compose-dev:
	docker compose -f docker-compose.yml up -d --build --force-recreate

stop-docker-compose-dev:
	docker compose -f docker-compose.yml down

## Docker Compose Prod
run-docker-compose-prod:
	docker compose -f docker-compose-prod.yml up -d --build --force-recreate

stop-docker-compose-prod:
	docker compose -f docker-compose-prod.yml down

status:
	docker compose ps

log:
	docker compose logs

## Test
open-browser:
	open http://localhost:5229/WeatherForecast
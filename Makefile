# Makefile
## 🌶 Django and hot-reload
run:
	docker-compose run --rm --publish 80:80 app python manage.py runserver 0.0.0.0:80

debug-web:
	docker-compose run --rm --publish 80:80 app python -m debugpy --wait-for-client --listen 0.0.0.0:5678 manage.py runserver 0.0.0.0:80

debug-tests:
	docker-compose run --rm app python -m debugpy --wait-for-client --listen 0.0.0.0:5678 manage.py test

test:
	docker-compose run --rm app sh -c "python manage.py test --noinput"

lint:
	docker-compose run --rm app sh -c "flake8 --ignore=E501"

both:
	docker-compose run --rm app sh -c "python manage.py test && flake8 --ignore=E501"

migrate:
	docker-compose run --rm --publish 80:80 app sh -c "python manage.py makemigrations && python manage.py migrate"

createsuperuser:
	docker-compose run --rm app sh -c "python manage.py createsuperuser"


createapp:
	docker-compose run --rm app sh -c "python manage.py startapp user"

build:
	docker-compose build




build-for-debug:
	docker-compose -f docker-compose.debug.yml build

debug-tests:
	docker-compose -f docker-compose.debug.yml run --rm --publish 5678:5678 app-dbg python -m debugpy --wait-for-client --listen 0.0.0.0:5678 manage.py test


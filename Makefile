# Makefile
## 🌶 Django and hot-reload
run:
	docker-compose run --rm --publish 80:80 django-server python manage.py runserver 0.0.0.0:80

debug:
	docker-compose run --rm --publish 80:80 django-serverr python -m debugpy --wait-for-client --listen 0.0.0.0:5678 manage.py runserver 0.0.0.0:80

test:
	docker-compose run --rm django-server sh -c "python manage.py test"

test_and_lint:
	docker-compose run --rm django-server sh -c "python manage.py test && flake8"

migrate:
	docker-compose run --rm --publish 80:80 django-server sh -c "python manage.py makemigrations core"
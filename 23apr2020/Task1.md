# Task1
## Create 2 docker containers : 1) Website 2)Database ~> Both should be connected to each other

* Using Django
* Settings in Django file
DATABASES = {
	'default':{
		'ENGINE':'djangi.db.backends.mysql',
		'NAME': 'mydatabase',
		'USER': 'root',
		'PASSWORD': 'pykid',
		'HOST': 'db',
		'PORT': '3306',
		'default-character-set': 'utf8'
		}
	}


* Dockerfile for django
```sh
FROM python
RUN pip install django django-extensions mysqlclient
COPY Task1
```

* Docker-compose for task
```yaml
version: '3.8'
services:
 db:
  image: mysql:5.7
  ports:
   - '3306:3306'
  container_name: db 
  environment:
   MYSQL_ROOT_PASSWORD: 'pykid'
   MYSQL_DATABASE: 'mydatabase'

 Task1:
  image: task1_image
  build: .
  ports:
   - "8080:8000"
  container_name: task1
  environment:
   DJANGO_SUPERUSER_USERNAME: 'piyush'
   DJANGO_SUPERUSER_PASSWORD: 'root'
   DJANGO_SUPERUSER_EMAIL: 'kuchbhi@kahibhi.com'
  depends_on:
   - db
  command: python manage.py runserver 0.0.0.0:8000
```

* Commands to be run for final execution:
```sh
docker-compose up -d
docker exec -it task1 python manage.py makemigrations
docker exec -it task1 python manage.py migrate
docker exec -it task1 python manage.py createsuperuser --noinput
```
* Website can be open and run at ```127.0.0.1:8080/admin```

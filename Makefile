export docker_image="wagtail-test"
export docker_image2="angch/wagtail-test"

all: build fix clean push

build:
	docker build -t ${docker_image} .

fix:
	docker run --name "wagtail-fix" -d ${docker_image} &&\
	(docker exec -it wagtail-fix python manage.py createsuperuser) \
	&& docker commit wagtail-fix ${docker_image2}

clean:
	docker rm -f "wagtail-fix"

push:
	docker push ${docker_image2}

Quick and dirty hack to proof of concept wrapping a Python env into docker

for the #devkini folks.

You'd need to "docker login" and replace the registry names in the Makefile when you run it yourself.

There's already a docker image created, so you don't need to rebuild these images, just do a:
  docker run -p 18888:8000 --name "wagtail-test" angch/wagtail-test

Replace 18888 with the port you want to bind it with, and then open up http://$host:$ip/admin/
Default user/pass is root/root. Initialized with my email, sorry.

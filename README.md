Quick and dirty hack to proof of concept wrapping a Python env into docker

for the #devkini folks.

You'd need to "docker login" and replace the registry names in the Makefile when you run it yourself.

There's already a docker image created, so you don't need to rebuild these images, just do a:
  docker run -p 18888:8000 --name "wagtail-test" angch/wagtail-test

Replace 18888 with the port you want to bind it with, and then open up http://$host:$ip/admin/
Default user/pass is root/root. Initialized with my email, sorry.

## Why?

Just so you can run and test a version of wagtail, and build on it, without worrying about the OS version, getting libjpeg, pip, python, etc running *just* right. Skip the compilation phases, the pip install -r requirements.txt steps.

Well, not so good of an example, because it not that hard to get set up.

But since the entire wagtail is in a container, you can do thing such as re-tagging them and uploading to a docker registry you control, so if you run more than once instance over more than one server, e.g. loadbalancing, your downloads and redeploys are *much* faster than waiting for git or docker pull to grab them over the Internet, effectively doing vendoring for your applications.

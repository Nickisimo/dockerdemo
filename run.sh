sudo docker build -t "docker-local.registry.paychex.com/hrs/pxt-robot-test_1:latest" -f Dockerfile-test_1 .
sudo docker push "docker-local.registry.paychex.com/hrs/pxt-robot-test_1:latest"
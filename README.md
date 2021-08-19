
Для создания Docker-контейнера необходимо выполнить команды:

1) Клоним репку на ПК:

> git clone https://github.com/nikonlines/terraform.git

> cd terraform

2) Чмодим скрипт автозапуска-контейнера, делая его исполняемым:

> chmod 755 entrypoint.sh

3) Билдим Docker-образ:

> sudo docker build . --no-cache --compress --tag terraform

или под ARM процы:

> sudo docker build -f Dockerfile.arm . --no-cache --compress --tag terraform

4) Запускаем контейнер на основе созданного Docker-образа (доступ по SSH на 2200 порту, можно поменять на другой)

> sudo docker run -d -i -t -p 2200:22 --name terraform -h terraform -v terraform_data:/terraform terraform

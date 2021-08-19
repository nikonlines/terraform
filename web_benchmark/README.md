1) Вводим адрес сайта в скрипте "benchmark_script.sh" в формате http://.../ или https://.../ (обязательно в конце )

> SITE_URL="https://<web_site>/"

3) Указываем колличество серверов в файле "benchmark_terraform.tf" (по дефолту 6 серверов):

> count = 6

------------------

1) Настройка Terraform в папке с файлами (инициализация для работы с AWS):

> terraform init

2) Запуск Terraform в папке с файлами (создает сервера в EC2):

> terraform apply

3) Остановка Terraform в папке с файлами (удаляет сервера в EC2):

> terraform destroy

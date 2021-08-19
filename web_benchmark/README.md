1) Вводим адрес сайта в скрипте "benchmark_script.sh" в формате http://.../ или https://.../ (обязательно в конце )

> SITE_URL="https://<web_site>/"

3) Указываем колличество серверов в файле "benchmark_terraform.tf" (по дефолту 6 серверов):

> count = 6

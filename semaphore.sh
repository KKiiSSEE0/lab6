#!/bin/bash

# Путь к семафорному файлу
semaphore_file="/tmp/semaphore_file"

# Функция ожидания освобождения ресурса
wait_for_resource() {
while true; do
if [ "$(cat $semaphore_file)" -eq 0 ]; then
break
fi
sleep 1
done
}

# Функция использования ресурса
use_resource() {
echo "Ресурс доступен. Используем его."
echo "1" > "$semaphore_file" # Устанавливаем семафор в состояние "занято"
sleep 5 # Имитация использования ресурса в течение t2 времени
echo "Ресурс освобожден."
echo "0" > "$semaphore_file" # Освобождаем ресурс (семафор в состояние "свободно")
}

# Проверка наличия семафорного файла
if [ ! -f "$semaphore_file" ]; then
echo "0" > "$semaphore_file" # Исходное состояние - ресурс свободен
fi

# Ожидание ресурса (t1)
wait_for_resource

# Использование ресурса (t2)
use_resource

# Завершение скрипта
exit 0

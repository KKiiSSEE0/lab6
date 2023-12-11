#!/bin/bash

# Устанавливаем длину последовательности
length=10

# Генерируем случайную последовательность
random_string=""
for ((i=0; i<$length; i++)); do
random_number=$((RANDOM % 26)) # Генерируем случайное число от 0 до 25
random_char=$(printf \\$(printf '%03o' $((97 + random_number)))) # Преобразуем число в символ (a=97, b=98, ..., z=122)
random_string="$random_string$random_char" # Добавляем символ к последовательности
done

echo "Случайная последовательность: $random_string"


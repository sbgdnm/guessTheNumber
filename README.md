# guess_the_number

New Flutter project , guess the number

Документация для запуска и описание реализации проекта "Угадай число"
1. Описание проекта
Приложение "Угадай число" — это игра, в которой система загадывает случайное число в заданном диапазоне, а пользователь пытается его угадать за ограниченное количество попыток.
2. Основной функционал
Настройка диапазона чисел и количества попыток.
Генерация случайного числа в указанном диапазоне.
Пользователь может вводить свои предположения.
Реализация подсказок:
Число больше или меньше загаданного.
Завершение игры:
Победа (число угадано).
Проигрыш (исчерпаны все попытки).
Возможность перезапуска игры.
Различие экранов победы и поражения:
Зелёный цвет для победы.
Красный цвет для поражения.
3. Структура проекта
lib/
main.dart: Точка входа в приложение. Инициализация игры и навигация.
bloc/guess_bloc.dart: Управление состоянием игры (BLoC-архитектура).
screens/settings_screen.dart: Экран настроек игры, где пользователь вводит параметры.
screens/game_screen.dart: Основной экран игры, где пользователь вводит числа и получает подсказки.


4. Инструкция по запуску
Клонирование репозиторий проекта.
Установка зависимостей: “flutter pub get”
Запуск приложения: 
1) Для запуска на Android: “flutter run -d android”
2) Для запуска на iOS: “flutter run -d ios”

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

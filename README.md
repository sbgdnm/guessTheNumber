# guess_the_number

New Flutter project , guess the number

Угадай число

Простая игра, где система загадывает случайное число, а пользователь пытается его угадать за ограниченное количество попыток.

📜 Описание проекта
"Угадай число" — это мобильное приложение, разработанное на Flutter с использованием архитектуры BLoC. Оно кроссплатформенное, поддерживает Android и iOS.
Игрок задаёт диапазон чисел и количество попыток, после чего пытается угадать случайное число.

🎮 Основной функционал
Настройка игры: пользователь задаёт диапазон чисел и количество попыток.

Угадывание числа: приложение подсказывает, больше или меньше введённое число.

Оповещение о результатах:

Победа: экран с зелёным оформлением.

Поражение: экран с красным оформлением.

Возможность перезапуска игры.


📂 Структура проекта
lib/

main.dart: Точка входа в приложение. Инициализация игры и навигация.

bloc/guess_bloc.dart: Логика управления состоянием игры (BLoC).

screens/settings_screen.dart: Экран для задания параметров игры.

screens/game_screen.dart: Основной экран игры с полем ввода и подсказками.

🚀 Инструкция по запуску
1. Клонирование репозитория
2. Установка зависимостей
3. Запуск приложения

Для Android: flutter run -d android

Для iOS: flutter run -d ios

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

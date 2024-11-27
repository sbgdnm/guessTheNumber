import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/guess_bloc.dart';

/// Экран игры
/// Пользователь пытается угадать загаданное число
class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final TextEditingController _guessController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Угадай число'),
      ),
      body: BlocConsumer<GuessBloc, GuessState>(
          listener: (context, state) {
            if (state.isGameOver) {
              // Появление диалогового окна, когда игра завершена
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  // Заголовок диалога, цвет зависит от результата игры
                  title: Text(
                    state.isWin ? 'Вы победили!' : 'Игра окончена', // Текст заголовка на русском
                    style: TextStyle(
                      color: state.isWin ? Colors.green : Colors.red, // Цвет текста: зелёный для победы, красный для поражения
                    ),
                  ),
                  content: Text(
                    state.isWin
                        ? 'Поздравляем! Вы угадали число.' // Сообщение при победе
                        : 'Правильное число было ${state.targetNumber}.', // Сообщение при поражении, с числом
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Закрываем диалоговое окно и возвращаемся на экран настроек
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text('Начать заново'), // Кнопка "Начать заново"
                    ),
                  ],
                ),
              );
            }
          }
          ,builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание элементов по левому краю
              children: [
                Text('Оставшиеся попытки: ${state.attemptsLeft}',
                      style: const TextStyle(fontSize: 18),),
                const SizedBox(height: 10),
                if (state.hintMessage.isNotEmpty) // Проверяем, есть ли подсказка
                  Text(
                    state.hintMessage, // Текст подсказки (меньше или больше)
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                const SizedBox(height: 20),
                TextField(
                  controller: _guessController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Выше догадки?'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final guessedNumber = int.tryParse(_guessController.text);
                    if (guessedNumber != null) {
                      // Передаём попытку угадывания числа в блок
                      context.read<GuessBloc>().add(GuessNumberEvent(guessedNumber));
                      _guessController.clear(); // Очищаем поле ввода
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Пожалуйста, введите корректное число!')),
                      );
                    }
                  },
                  child: Text('Попробовать угадать!'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/guess_bloc.dart';
import 'game_screen.dart';

/// Экран настроек игры
/// Пользователь задаёт максимальное число (n) и количество попыток (m)
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _maxNumberController = TextEditingController();
  final TextEditingController _attemptsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Игровые настройки'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _maxNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Введите максимальное число(n)'),
            ),
            TextField(
              controller: _attemptsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Введите количество попыток(m)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Проверка на ввод данных
                final maxNumber = int.tryParse(_maxNumberController.text);
                final attempts = int.tryParse(_attemptsController.text);

                if (maxNumber != null && attempts != null && maxNumber > 0 && attempts > 0) {
                  // Инициируем новое событие для блока и переходим на экран игры
                  context.read<GuessBloc>().add(NewGameEvent(maxNumber, attempts));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => GameScreen()),
                  );
                } else {
                  // Показываем сообщение об ошибке
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Пожалуйста, введите корректное число!')),
                  );
                }
              },
              child: Text('Начать игру'),
            ),
          ],
        ),
      ),
    );
  }
}

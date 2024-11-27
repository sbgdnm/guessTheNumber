import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/guess_bloc.dart';
import 'ui/screens/settings_screen.dart';
//Samat Bagdan github:sbgdnm

void main() {
  runApp(MyApp());
}
/// Основной класс приложения
/// Оборачиваем приложение в BlocProvider, чтобы GuessBloc был доступен на всех экранах
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GuessBloc(), // Создаём GuessBloc на уровне всего приложения , инициализация блока для управления состоянием игры
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SettingsScreen(),// Первый экран, который видит пользователь
      ),
    );
  }
}

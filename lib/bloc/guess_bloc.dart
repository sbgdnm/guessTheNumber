import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

/// События блока (запуск новой игры или попытка угадать число)
abstract class GuessEvent {}

class NewGameEvent extends GuessEvent {
  final int maxNumber;
  final int maxAttempts;

  NewGameEvent(this.maxNumber, this.maxAttempts);
}

class GuessNumberEvent extends GuessEvent {
  final int guessedNumber;

  GuessNumberEvent(this.guessedNumber);
}

/// Состояние игры (хранит текущий статус игры)
class GuessState {
  final int targetNumber; // Загаданное число
  final int attemptsLeft; // Оставшиеся попытки
  final bool isGameOver; // Флаг окончания игры
  final bool isWin; // Флаг победы

  GuessState({
    required this.targetNumber,
    required this.attemptsLeft,
    required this.isGameOver,
    required this.isWin,
  });

  // Копирует текущее состояние с новыми значениями
  GuessState copyWith({
    int? targetNumber,
    int? attemptsLeft,
    bool? isGameOver,
    bool? isWin,
  }) {
    return GuessState(
      targetNumber: targetNumber ?? this.targetNumber,
      attemptsLeft: attemptsLeft ?? this.attemptsLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isWin: isWin ?? this.isWin,
    );
  }
}

/// Логика управления состоянием игры
class GuessBloc extends Bloc<GuessEvent, GuessState> {
  GuessBloc() : super(GuessState(targetNumber: 0, attemptsLeft: 0, isGameOver: false, isWin: false)) {
    on<NewGameEvent>((event, emit) {
      // Запускаем новую игру с случайным числом
      final target = Random().nextInt(event.maxNumber) + 1;
      emit(GuessState(
        targetNumber: target,
        attemptsLeft: event.maxAttempts,
        isGameOver: false,
        isWin: false,
      ));
    });

    on<GuessNumberEvent>((event, emit) {
      // Обрабатываем попытку угадать число
      final isCorrect = event.guessedNumber == state.targetNumber;
      final isLastAttempt = state.attemptsLeft == 1;

      emit(state.copyWith(
        attemptsLeft: state.attemptsLeft - 1,
        isGameOver: isCorrect || isLastAttempt,
        isWin: isCorrect,
      ));
    });
  }
}

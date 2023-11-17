
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/application_state/todo_notifier.dart';
import 'package:app/application_state/todo_state.dart';

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) {
    return LoginNotifier();
  },
);
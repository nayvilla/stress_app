
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/domain/event/event.dart';


final formNotifierProvider = StateNotifierProvider<FormNotifier, FormState>(
  (ref) {
    return FormNotifier();
  },
);
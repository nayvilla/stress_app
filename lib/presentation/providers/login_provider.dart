import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/domain/domain.dart';

part 'login_provider.g.dart';

@Riverpod(keepAlive: true)
class UserInformation extends _$UserInformation {
  @override
  User_login build() => User_login(
        username: '',
        password: '',
        isChecked: false,
      );

  void _updateUserInfo({
    String? username,
    String? password,
    bool? isChecked,
  }) {
    state = state.copyWith(
      username: username ?? state.username,
      password: password ?? state.password,
      isChecked: isChecked ?? state.isChecked,
    );
  }
}

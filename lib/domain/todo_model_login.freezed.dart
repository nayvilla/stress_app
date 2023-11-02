// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model_login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoModelLogin {
// ignore: non_constant_identifier_names
//required String id_usuario,
  String get usernameLogin => throw _privateConstructorUsedError;
  String get passwordLogin => throw _privateConstructorUsedError;
  bool get isTodoCompleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoModelLoginCopyWith<TodoModelLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoModelLoginCopyWith<$Res> {
  factory $TodoModelLoginCopyWith(
          TodoModelLogin value, $Res Function(TodoModelLogin) then) =
      _$TodoModelLoginCopyWithImpl<$Res, TodoModelLogin>;
  @useResult
  $Res call({String usernameLogin, String passwordLogin, bool isTodoCompleted});
}

/// @nodoc
class _$TodoModelLoginCopyWithImpl<$Res, $Val extends TodoModelLogin>
    implements $TodoModelLoginCopyWith<$Res> {
  _$TodoModelLoginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameLogin = null,
    Object? passwordLogin = null,
    Object? isTodoCompleted = null,
  }) {
    return _then(_value.copyWith(
      usernameLogin: null == usernameLogin
          ? _value.usernameLogin
          : usernameLogin // ignore: cast_nullable_to_non_nullable
              as String,
      passwordLogin: null == passwordLogin
          ? _value.passwordLogin
          : passwordLogin // ignore: cast_nullable_to_non_nullable
              as String,
      isTodoCompleted: null == isTodoCompleted
          ? _value.isTodoCompleted
          : isTodoCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoModelLoginImplCopyWith<$Res>
    implements $TodoModelLoginCopyWith<$Res> {
  factory _$$TodoModelLoginImplCopyWith(_$TodoModelLoginImpl value,
          $Res Function(_$TodoModelLoginImpl) then) =
      __$$TodoModelLoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String usernameLogin, String passwordLogin, bool isTodoCompleted});
}

/// @nodoc
class __$$TodoModelLoginImplCopyWithImpl<$Res>
    extends _$TodoModelLoginCopyWithImpl<$Res, _$TodoModelLoginImpl>
    implements _$$TodoModelLoginImplCopyWith<$Res> {
  __$$TodoModelLoginImplCopyWithImpl(
      _$TodoModelLoginImpl _value, $Res Function(_$TodoModelLoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameLogin = null,
    Object? passwordLogin = null,
    Object? isTodoCompleted = null,
  }) {
    return _then(_$TodoModelLoginImpl(
      usernameLogin: null == usernameLogin
          ? _value.usernameLogin
          : usernameLogin // ignore: cast_nullable_to_non_nullable
              as String,
      passwordLogin: null == passwordLogin
          ? _value.passwordLogin
          : passwordLogin // ignore: cast_nullable_to_non_nullable
              as String,
      isTodoCompleted: null == isTodoCompleted
          ? _value.isTodoCompleted
          : isTodoCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TodoModelLoginImpl extends _TodoModelLogin {
  const _$TodoModelLoginImpl(
      {required this.usernameLogin,
      required this.passwordLogin,
      required this.isTodoCompleted})
      : super._();

// ignore: non_constant_identifier_names
//required String id_usuario,
  @override
  final String usernameLogin;
  @override
  final String passwordLogin;
  @override
  final bool isTodoCompleted;

  @override
  String toString() {
    return 'TodoModelLogin(usernameLogin: $usernameLogin, passwordLogin: $passwordLogin, isTodoCompleted: $isTodoCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoModelLoginImpl &&
            (identical(other.usernameLogin, usernameLogin) ||
                other.usernameLogin == usernameLogin) &&
            (identical(other.passwordLogin, passwordLogin) ||
                other.passwordLogin == passwordLogin) &&
            (identical(other.isTodoCompleted, isTodoCompleted) ||
                other.isTodoCompleted == isTodoCompleted));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, usernameLogin, passwordLogin, isTodoCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoModelLoginImplCopyWith<_$TodoModelLoginImpl> get copyWith =>
      __$$TodoModelLoginImplCopyWithImpl<_$TodoModelLoginImpl>(
          this, _$identity);
}

abstract class _TodoModelLogin extends TodoModelLogin {
  const factory _TodoModelLogin(
      {required final String usernameLogin,
      required final String passwordLogin,
      required final bool isTodoCompleted}) = _$TodoModelLoginImpl;
  const _TodoModelLogin._() : super._();

  @override // ignore: non_constant_identifier_names
//required String id_usuario,
  String get usernameLogin;
  @override
  String get passwordLogin;
  @override
  bool get isTodoCompleted;
  @override
  @JsonKey(ignore: true)
  _$$TodoModelLoginImplCopyWith<_$TodoModelLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

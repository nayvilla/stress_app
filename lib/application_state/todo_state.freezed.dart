// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoState {
  List<TodoModelSing> get todoList =>
      throw _privateConstructorUsedError; // Lista de tareas
  TodoModelSing get todo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoStateCopyWith<TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res, TodoState>;
  @useResult
  $Res call({List<TodoModelSing> todoList, TodoModelSing todo});

  $TodoModelSingCopyWith<$Res> get todo;
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res, $Val extends TodoState>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoList = null,
    Object? todo = null,
  }) {
    return _then(_value.copyWith(
      todoList: null == todoList
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<TodoModelSing>,
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoModelSing,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoModelSingCopyWith<$Res> get todo {
    return $TodoModelSingCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodoStateImplCopyWith<$Res>
    implements $TodoStateCopyWith<$Res> {
  factory _$$TodoStateImplCopyWith(
          _$TodoStateImpl value, $Res Function(_$TodoStateImpl) then) =
      __$$TodoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TodoModelSing> todoList, TodoModelSing todo});

  @override
  $TodoModelSingCopyWith<$Res> get todo;
}

/// @nodoc
class __$$TodoStateImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateImpl>
    implements _$$TodoStateImplCopyWith<$Res> {
  __$$TodoStateImplCopyWithImpl(
      _$TodoStateImpl _value, $Res Function(_$TodoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoList = null,
    Object? todo = null,
  }) {
    return _then(_$TodoStateImpl(
      todoList: null == todoList
          ? _value._todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<TodoModelSing>,
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoModelSing,
    ));
  }
}

/// @nodoc

class _$TodoStateImpl extends _TodoState {
  _$TodoStateImpl(
      {required final List<TodoModelSing> todoList, required this.todo})
      : _todoList = todoList,
        super._();

  final List<TodoModelSing> _todoList;
  @override
  List<TodoModelSing> get todoList {
    if (_todoList is EqualUnmodifiableListView) return _todoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todoList);
  }

// Lista de tareas
  @override
  final TodoModelSing todo;

  @override
  String toString() {
    return 'TodoState(todoList: $todoList, todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoStateImpl &&
            const DeepCollectionEquality().equals(other._todoList, _todoList) &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_todoList), todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoStateImplCopyWith<_$TodoStateImpl> get copyWith =>
      __$$TodoStateImplCopyWithImpl<_$TodoStateImpl>(this, _$identity);
}

abstract class _TodoState extends TodoState {
  factory _TodoState(
      {required final List<TodoModelSing> todoList,
      required final TodoModelSing todo}) = _$TodoStateImpl;
  _TodoState._() : super._();

  @override
  List<TodoModelSing> get todoList;
  @override // Lista de tareas
  TodoModelSing get todo;
  @override
  @JsonKey(ignore: true)
  _$$TodoStateImplCopyWith<_$TodoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginState {
  List<TodoModelLogin> get loginList => throw _privateConstructorUsedError;
  TodoModelLogin get todo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call({List<TodoModelLogin> loginList, TodoModelLogin todo});

  $TodoModelLoginCopyWith<$Res> get todo;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginList = null,
    Object? todo = null,
  }) {
    return _then(_value.copyWith(
      loginList: null == loginList
          ? _value.loginList
          : loginList // ignore: cast_nullable_to_non_nullable
              as List<TodoModelLogin>,
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoModelLogin,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoModelLoginCopyWith<$Res> get todo {
    return $TodoModelLoginCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TodoModelLogin> loginList, TodoModelLogin todo});

  @override
  $TodoModelLoginCopyWith<$Res> get todo;
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginList = null,
    Object? todo = null,
  }) {
    return _then(_$LoginStateImpl(
      loginList: null == loginList
          ? _value._loginList
          : loginList // ignore: cast_nullable_to_non_nullable
              as List<TodoModelLogin>,
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoModelLogin,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl extends _LoginState {
  _$LoginStateImpl(
      {required final List<TodoModelLogin> loginList, required this.todo})
      : _loginList = loginList,
        super._();

  final List<TodoModelLogin> _loginList;
  @override
  List<TodoModelLogin> get loginList {
    if (_loginList is EqualUnmodifiableListView) return _loginList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loginList);
  }

  @override
  final TodoModelLogin todo;

  @override
  String toString() {
    return 'LoginState(loginList: $loginList, todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            const DeepCollectionEquality()
                .equals(other._loginList, _loginList) &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_loginList), todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState extends LoginState {
  factory _LoginState(
      {required final List<TodoModelLogin> loginList,
      required final TodoModelLogin todo}) = _$LoginStateImpl;
  _LoginState._() : super._();

  @override
  List<TodoModelLogin> get loginList;
  @override
  TodoModelLogin get todo;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

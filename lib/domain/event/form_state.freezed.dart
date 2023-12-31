// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormState {
  List<FormModel> get formList =>
      throw _privateConstructorUsedError; // Lista de tareas
  FormModel get form => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormStateCopyWith<FormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormStateCopyWith<$Res> {
  factory $FormStateCopyWith(FormState value, $Res Function(FormState) then) =
      _$FormStateCopyWithImpl<$Res, FormState>;
  @useResult
  $Res call({List<FormModel> formList, FormModel form});

  $FormModelCopyWith<$Res> get form;
}

/// @nodoc
class _$FormStateCopyWithImpl<$Res, $Val extends FormState>
    implements $FormStateCopyWith<$Res> {
  _$FormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formList = null,
    Object? form = null,
  }) {
    return _then(_value.copyWith(
      formList: null == formList
          ? _value.formList
          : formList // ignore: cast_nullable_to_non_nullable
              as List<FormModel>,
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FormModelCopyWith<$Res> get form {
    return $FormModelCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FormStateImplCopyWith<$Res>
    implements $FormStateCopyWith<$Res> {
  factory _$$FormStateImplCopyWith(
          _$FormStateImpl value, $Res Function(_$FormStateImpl) then) =
      __$$FormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FormModel> formList, FormModel form});

  @override
  $FormModelCopyWith<$Res> get form;
}

/// @nodoc
class __$$FormStateImplCopyWithImpl<$Res>
    extends _$FormStateCopyWithImpl<$Res, _$FormStateImpl>
    implements _$$FormStateImplCopyWith<$Res> {
  __$$FormStateImplCopyWithImpl(
      _$FormStateImpl _value, $Res Function(_$FormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formList = null,
    Object? form = null,
  }) {
    return _then(_$FormStateImpl(
      formList: null == formList
          ? _value._formList
          : formList // ignore: cast_nullable_to_non_nullable
              as List<FormModel>,
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }
}

/// @nodoc

class _$FormStateImpl extends _FormState {
  _$FormStateImpl({required final List<FormModel> formList, required this.form})
      : _formList = formList,
        super._();

  final List<FormModel> _formList;
  @override
  List<FormModel> get formList {
    if (_formList is EqualUnmodifiableListView) return _formList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_formList);
  }

// Lista de tareas
  @override
  final FormModel form;

  @override
  String toString() {
    return 'FormState(formList: $formList, form: $form)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormStateImpl &&
            const DeepCollectionEquality().equals(other._formList, _formList) &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_formList), form);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormStateImplCopyWith<_$FormStateImpl> get copyWith =>
      __$$FormStateImplCopyWithImpl<_$FormStateImpl>(this, _$identity);
}

abstract class _FormState extends FormState {
  factory _FormState(
      {required final List<FormModel> formList,
      required final FormModel form}) = _$FormStateImpl;
  _FormState._() : super._();

  @override
  List<FormModel> get formList;
  @override // Lista de tareas
  FormModel get form;
  @override
  @JsonKey(ignore: true)
  _$$FormStateImplCopyWith<_$FormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

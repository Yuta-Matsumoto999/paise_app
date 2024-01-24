// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'is_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IsAuthState {
  bool get isAuth => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IsAuthStateCopyWith<IsAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsAuthStateCopyWith<$Res> {
  factory $IsAuthStateCopyWith(
          IsAuthState value, $Res Function(IsAuthState) then) =
      _$IsAuthStateCopyWithImpl<$Res, IsAuthState>;
  @useResult
  $Res call({bool isAuth, String? message});
}

/// @nodoc
class _$IsAuthStateCopyWithImpl<$Res, $Val extends IsAuthState>
    implements $IsAuthStateCopyWith<$Res> {
  _$IsAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuth = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      isAuth: null == isAuth
          ? _value.isAuth
          : isAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IsAuthStateImplCopyWith<$Res>
    implements $IsAuthStateCopyWith<$Res> {
  factory _$$IsAuthStateImplCopyWith(
          _$IsAuthStateImpl value, $Res Function(_$IsAuthStateImpl) then) =
      __$$IsAuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAuth, String? message});
}

/// @nodoc
class __$$IsAuthStateImplCopyWithImpl<$Res>
    extends _$IsAuthStateCopyWithImpl<$Res, _$IsAuthStateImpl>
    implements _$$IsAuthStateImplCopyWith<$Res> {
  __$$IsAuthStateImplCopyWithImpl(
      _$IsAuthStateImpl _value, $Res Function(_$IsAuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuth = null,
    Object? message = freezed,
  }) {
    return _then(_$IsAuthStateImpl(
      isAuth: null == isAuth
          ? _value.isAuth
          : isAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$IsAuthStateImpl implements _IsAuthState {
  _$IsAuthStateImpl({required this.isAuth, this.message});

  @override
  final bool isAuth;
  @override
  final String? message;

  @override
  String toString() {
    return 'IsAuthState(isAuth: $isAuth, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsAuthStateImpl &&
            (identical(other.isAuth, isAuth) || other.isAuth == isAuth) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAuth, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsAuthStateImplCopyWith<_$IsAuthStateImpl> get copyWith =>
      __$$IsAuthStateImplCopyWithImpl<_$IsAuthStateImpl>(this, _$identity);
}

abstract class _IsAuthState implements IsAuthState {
  factory _IsAuthState({required final bool isAuth, final String? message}) =
      _$IsAuthStateImpl;

  @override
  bool get isAuth;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$IsAuthStateImplCopyWith<_$IsAuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

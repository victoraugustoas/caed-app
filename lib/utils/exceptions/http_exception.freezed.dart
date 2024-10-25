// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HttpException {
  String get message => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;

  /// Create a copy of HttpException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HttpExceptionCopyWith<HttpException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpExceptionCopyWith<$Res> {
  factory $HttpExceptionCopyWith(
          HttpException value, $Res Function(HttpException) then) =
      _$HttpExceptionCopyWithImpl<$Res, HttpException>;
  @useResult
  $Res call({String message, int statusCode, StackTrace stackTrace});
}

/// @nodoc
class _$HttpExceptionCopyWithImpl<$Res, $Val extends HttpException>
    implements $HttpExceptionCopyWith<$Res> {
  _$HttpExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HttpException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = null,
    Object? stackTrace = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HttpExceptionImplCopyWith<$Res>
    implements $HttpExceptionCopyWith<$Res> {
  factory _$$HttpExceptionImplCopyWith(
          _$HttpExceptionImpl value, $Res Function(_$HttpExceptionImpl) then) =
      __$$HttpExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int statusCode, StackTrace stackTrace});
}

/// @nodoc
class __$$HttpExceptionImplCopyWithImpl<$Res>
    extends _$HttpExceptionCopyWithImpl<$Res, _$HttpExceptionImpl>
    implements _$$HttpExceptionImplCopyWith<$Res> {
  __$$HttpExceptionImplCopyWithImpl(
      _$HttpExceptionImpl _value, $Res Function(_$HttpExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of HttpException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = null,
    Object? stackTrace = null,
  }) {
    return _then(_$HttpExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$HttpExceptionImpl implements _HttpException {
  _$HttpExceptionImpl(
      {required this.message,
      required this.statusCode,
      required this.stackTrace});

  @override
  final String message;
  @override
  final int statusCode;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'HttpException(message: $message, statusCode: $statusCode, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode, stackTrace);

  /// Create a copy of HttpException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HttpExceptionImplCopyWith<_$HttpExceptionImpl> get copyWith =>
      __$$HttpExceptionImplCopyWithImpl<_$HttpExceptionImpl>(this, _$identity);
}

abstract class _HttpException implements HttpException {
  factory _HttpException(
      {required final String message,
      required final int statusCode,
      required final StackTrace stackTrace}) = _$HttpExceptionImpl;

  @override
  String get message;
  @override
  int get statusCode;
  @override
  StackTrace get stackTrace;

  /// Create a copy of HttpException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HttpExceptionImplCopyWith<_$HttpExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

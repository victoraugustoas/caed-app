import 'package:freezed_annotation/freezed_annotation.dart';

enum PackageStatus {
  sent,
  received,
  returned,
  @JsonValue("returned_success")
  returnedSuccess
}

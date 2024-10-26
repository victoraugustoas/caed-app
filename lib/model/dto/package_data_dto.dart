import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_data_dto.freezed.dart';
part 'package_data_dto.g.dart';

@freezed
class PackageDataDto with _$PackageDataDto {
  const factory PackageDataDto({
    required String code,
    required String deliveryPoint,
    required String city,
    required String school,
    required String schoolStage,
    required String schoolSubject,
  }) = _PackageDataDto;

  factory PackageDataDto.fromJson(Map<String, Object?> json) =>
      _$PackageDataDtoFromJson(json);
}

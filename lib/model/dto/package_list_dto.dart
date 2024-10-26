import 'package:caed_app/model/enums/package_status_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_list_dto.freezed.dart';
part 'package_list_dto.g.dart';

@freezed
class PackageListDataDto with _$PackageListDataDto {
  const factory PackageListDataDto({
    required String code,
    required List<PackageStatus> status,
  }) = _PackageListDataDto;

  factory PackageListDataDto.fromJson(Map<String, Object?> json) =>
      _$PackageListDataDtoFromJson(json);
}

@freezed
class PackageListDto with _$PackageListDto {
  const factory PackageListDto({
    required List<PackageListDataDto> content,
    required int pageSize,
    required int pageNumber,
    required int numberOfElements,
  }) = _PackageListDto;

  factory PackageListDto.fromJson(Map<String, Object?> json) =>
      _$PackageListDtoFromJson(json);
}

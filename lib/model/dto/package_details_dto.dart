import 'package:caed_app/model/dto/package_data_dto.dart';
import 'package:caed_app/model/dto/package_status_detail_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_details_dto.freezed.dart';
part 'package_details_dto.g.dart';

@freezed
class PackageDetailsDto with _$PackageDetailsDto {
  const factory PackageDetailsDto({
    required PackageDataDto packageData,
    required List<PackageStatusDetailDto> status,
  }) = _PackageDetailsDto;

  factory PackageDetailsDto.fromJson(Map<String, Object?> json) =>
      _$PackageDetailsDtoFromJson(json);
}

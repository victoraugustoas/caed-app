import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_status_detail_dto.freezed.dart';
part 'package_status_detail_dto.g.dart';

@freezed
class PackageStatusDetailDto with _$PackageStatusDetailDto {
  const factory PackageStatusDetailDto({
    required DateTime date,
    required String description,
  }) = _PackageStatusDetailDto;

  factory PackageStatusDetailDto.fromJson(Map<String, Object?> json) =>
      _$PackageStatusDetailDtoFromJson(json);
}

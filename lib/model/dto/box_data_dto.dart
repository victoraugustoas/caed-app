import 'package:freezed_annotation/freezed_annotation.dart';

part 'box_data_dto.freezed.dart';
part 'box_data_dto.g.dart';

@freezed
class BoxDataDto with _$BoxDataDto {
  const factory BoxDataDto({
    required String code,
    required String deliveryPoint,
    required String city,
    required String school,
    required String schoolStage,
    required String schoolSubject,
  }) = _BoxDataDto;

  factory BoxDataDto.fromJson(Map<String, Object?> json) =>
      _$BoxDataDtoFromJson(json);
}

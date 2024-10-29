import 'package:caed_app/global/container/provider/get_it_provider.dart';
import 'package:caed_app/model/dto/package_details_dto.dart';
import 'package:caed_app/network/providers/packages_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_details_controller.freezed.dart';
part 'package_details_controller.g.dart';

@freezed
class PackageDetailsState with _$PackageDetailsState {
  const factory PackageDetailsState({
    PackageDetailsDto? packageDetails,
  }) = _PackageDetailsState;
}

@riverpod
Future<PackageDetailsState> packageDetailsController(
    Ref ref, String code) async {
  final packagesDataProvider = GetItDIProvider().find<PackagesDataProvider>();
  final response = await packagesDataProvider.getDetails(code);

  ref.keepAlive();

  return PackageDetailsState(packageDetails: response);
}

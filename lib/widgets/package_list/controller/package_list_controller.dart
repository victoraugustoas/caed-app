import 'package:caed_app/global/container/provider/get_it_provider.dart';
import 'package:caed_app/model/dto/package_list_dto.dart';
import 'package:caed_app/network/providers/packages_data_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_list_controller.freezed.dart';
part 'package_list_controller.g.dart';

@freezed
class PackageListState with _$PackageListState {
  const factory PackageListState({
    required int page,
    @Default(true) bool firstLoading,
    PackageListDto? packageList,
  }) = _PackageListState;
}

@Riverpod(keepAlive: true)
class PackageListController extends _$PackageListController {
  @override
  FutureOr<PackageListState> build() async {
    final packagesDataProvider = GetItDIProvider().find<PackagesDataProvider>();
    state = const AsyncLoading();
    if (state.value == null) {
      state = const AsyncData(PackageListState(page: 0, packageList: null));
    }
    final response = await packagesDataProvider.list(10, state.value!.page);

    // see this: https://riverpod.dev/docs/essentials/auto_dispose#fine-tuned-disposal-with-refkeepalive
    ref.keepAlive();

    if (state.value!.packageList != null) {
      final withResponse = response.copyWith(content: [
        ...state.value!.packageList!.content,
        ...response.content,
      ]);
      return state.value!.copyWith(
        packageList: withResponse,
        firstLoading: false,
      );
    } else {
      return state.value!.copyWith(
        packageList: response,
        firstLoading: false,
      );
    }
  }

  Future<void> fetch() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> onRefresh() async {
    state = const AsyncData(PackageListState(page: 0, packageList: null));
    ref.invalidateSelf();
  }

  void setPage(int page) {
    state = AsyncData(state.value!.copyWith(page: page));
  }
}

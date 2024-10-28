import 'package:caed_app/global/http/http_client.dart';
import 'package:caed_app/model/dto/package_details_dto.dart';
import 'package:caed_app/model/dto/package_list_dto.dart';
import 'package:caed_app/network/endpoints/packages_endpoints.dart';
import 'package:caed_app/utils/extensions/uri_ext.dart';

class PackagesDataProvider {
  final HttpClient httpClient;

  PackagesDataProvider({required this.httpClient});

  Future<PackageListDto> list(int pageSize, int pageNumber) async {
    try {
      final response = await httpClient.get<Map<String, dynamic>>(
        PackagesEndpoints.packages.withQParams({
          "pageSize": pageSize,
          "pageNumber": pageNumber,
        }).str,
      );
      return PackageListDto.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PackageDetailsDto> getDetails(String code) async {
    try {
      final response = await httpClient.get<Map<String, dynamic>>(
        PackagesEndpoints.packageDetails.withPathParams({":code": code}).str,
      );
      return PackageDetailsDto.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

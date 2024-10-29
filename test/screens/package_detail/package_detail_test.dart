import 'package:caed_app/global/container/dependency_injection.dart';
import 'package:caed_app/global/container/provider/get_it_provider.dart';
import 'package:caed_app/model/dto/package_data_dto.dart';
import 'package:caed_app/model/dto/package_details_dto.dart';
import 'package:caed_app/model/dto/package_status_detail_dto.dart';
@GenerateNiceMocks([MockSpec<PackagesDataProvider>()])
import 'package:caed_app/network/providers/packages_data_provider.dart';
import 'package:caed_app/screens/package_detail/view/package_detail_view.dart';
import 'package:caed_app/utils/exceptions/http_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package_detail_test.mocks.dart';

void main() {
  final DependenciInjection container = GetItDIProvider();
  setUpAll(() {
    container.putIfAbsent<PackagesDataProvider>(MockPackagesDataProvider());
  });

  testWidgets(
    'should render the screen correctly',
    (WidgetTester tester) async {
      when(container.find<PackagesDataProvider>().getDetails("BX1234"))
          .thenAnswer(
        (_) async => PackageDetailsDto(
          packageData: const PackageDataDto(
            code: "BX1234",
            deliveryPoint: "Central Warehouse",
            city: "São Paulo",
            school: "Escola Estadual de São Paulo",
            schoolStage: "Ensino Médio",
            schoolSubject: "Matemática",
          ),
          status: [
            PackageStatusDetailDto(
              date: DateTime.now(),
              description: "Coordenador leu o código",
            )
          ],
        ),
      );

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: PackageDetailView(code: 'BX1234'),
          ),
        ),
      );
      await tester.pump();

      // title in screen
      expect(find.text('Pacote BX1234'), findsOneWidget);

      // search text from request
      expect(
        find.text("Coordenador leu o código"),
        findsOneWidget,
      );

      await tester.tap(find.text('Dados'));
      await tester.pumpAndSettle();

      expect(
        find.text("BX1234"),
        findsOneWidget,
      );
      expect(
        find.text('Escola Estadual de São Paulo'.toUpperCase()),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'should render an error when receiving an error from the API',
    (WidgetTester tester) async {
      when(container.find<PackagesDataProvider>().getDetails("BX1234"))
          .thenThrow(HttpException(
        message: "message",
        statusCode: 500,
        stackTrace: StackTrace.current,
      ));

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: PackageDetailView(code: 'BX1234'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text("Ocorreu um erro"),
        findsOneWidget,
      );
    },
  );
}

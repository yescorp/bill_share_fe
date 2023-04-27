import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/services/image_converter/api/image_converter.dart';

import '../../swagger_generated_code/bill_share.swagger.dart';

class MockCategories {
  final BillShare client;
  final ImageConverter converter;

  const MockCategories({
    required this.client,
    required this.converter,
  });

  Future createMockCategoriesIfAbsent() async {
    final categoryNames = [
      'Housing',
      'Transportation',
      'Food',
      'Entertaiment',
      'Utilities',
      'Insurance',
      'Medical & Healthcare',
    ];

    final categories = await client.expenseCategoriesGet();
    if (!categories.isSuccessful) {
      return;
    }

    if (categories.body!.isNotEmpty) {
      return;
    }

    final image = await converter
        .convertToBase64FromAssets('assets/category_icons/restaurant.png');

    for (final name in categoryNames) {
      final icon = await client.iconsPost(
        body: CreateIconDto(
          iconImageData: image,
          extension: 'png',
        ),
      );

      final request = await client.expenseCategoriesPost(
        body: CreateExpenseCategoryRequest(
          categoryName: name,
          iconId: icon.body!.iconId!,
        ),
      );
      print(request.isSuccessful);
    }
  }

  static void register() {
    DependencyProvider.registerLazySingleton(
      () => MockCategories(
        client: DependencyProvider.get<BillShare>(),
        converter: DependencyProvider.get<ImageConverter>(),
      ),
    );
  }
}

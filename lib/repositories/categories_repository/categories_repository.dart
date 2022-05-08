

import '../../models/categories/categories_model.dart';
import 'categories_provider.dart';

class CategoriesRepository {
  final CategoriesProvider provider;

  CategoriesRepository({required this.provider});

  Future<CategoriesModel> getCategories() async {
    var data = await provider.getCategories();
    return categoriesModelFromJson(data);
  }
}

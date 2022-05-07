import 'dart:convert';

import '../../models/categories/categories_model.dart';
import 'categories_provider.dart';

class CategoriesRepository {
  final CategoriesProvider provider;

  CategoriesRepository({required this.provider});

  Future<CategoriesModel> getCategories() async {
    var data = await provider.getCategories();
    return categoriesModelFromJson(data);
  }

  //  Future<Product>  getProducts() async {
  //   var data = await provider.getProducts();
  //   var decoded = jsonDecode(data);

  // List<Product> products = 
  //   return ;
  // }
}

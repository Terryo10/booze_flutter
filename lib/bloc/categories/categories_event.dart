part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesEvent extends CategoriesEvent {
  @override
  List<Object> get props => [];
}

class FilterByCategory extends CategoriesEvent {
  final int categoryId;
  final CategoriesModel categoriesModel;
  const FilterByCategory(
      {required this.categoryId, required this.categoriesModel});
  @override
  List<Object> get props => [];
}

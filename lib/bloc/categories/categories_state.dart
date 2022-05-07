part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedState extends CategoriesState {
  final CategoriesModel categoriesModel;
  final List<Product> products;

  const CategoriesLoadedState({required this.categoriesModel, required this.products});

  @override
  List<Object> get props => [categoriesModel];
}

class CategoriesErrorState extends CategoriesState {
  final String message;

  const CategoriesErrorState({required this.message});
}

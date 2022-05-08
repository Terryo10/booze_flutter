import 'package:bloc/bloc.dart';
import 'package:booze_flutter/models/categories/categories_model.dart';
import 'package:booze_flutter/repositories/categories_repository/categories_repository.dart';
import 'package:equatable/equatable.dart';
part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository categoriesRepository;
  CategoriesBloc({required this.categoriesRepository})
      : super(CategoriesInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(CategoriesLoadingState());
      try {
        CategoriesModel data = await categoriesRepository.getCategories();
        data.data!.insert(
            0,
            Datum(
                id: -1,
                name: 'All Products',
                image: 'images/allProducts.png',
                subCategories: []));
        ;
        List<Product> productsSetter(List<Datum>? categories) {
          List<Product> products = [];
          for (var element in categories ?? []) {
            for (SubCategory element in element.subCategories ?? []) {
              for (Product element in element.products ?? []) {
                products.add(element);
              }
            }
          }
          return products;
        }

        emit(
          CategoriesLoadedState(
            categoriesModel: data,
            products: productsSetter(data.data),
          ),
        );
      } catch (e) {
        emit(
          CategoriesErrorState(
            message: e.toString(),
          ),
        );
      }
    });

    on<FilterByCategory>((event, emit) {
      emit(CategoriesLoadingState());
      List<Product> categoryProductSetter(Datum data) {
        List<Product> products = [];
        for (SubCategory element in data.subCategories ?? []) {
          for (Product element in element.products ?? []) {
            products.add(element);
          }
        }
        return products;
      }

      List<Product> productsSetter(List<Datum>? categories) {
        List<Product> products = [];
        for (var element in categories ?? []) {
          for (SubCategory element in element.subCategories ?? []) {
            for (Product element in element.products ?? []) {
              products.add(element);
            }
          }
        }
        return products;
      }

      Datum selectedCategory = event.categoriesModel.data!
          .where((element) => element.id == event.categoryId)
          .first;
      emit(CategoriesLoadedState(
          categoriesModel: event.categoriesModel,
          products: (event.categoryId == -1)
              ? productsSetter(event.categoriesModel.data)
              : categoryProductSetter(selectedCategory)));
    });
  }
}

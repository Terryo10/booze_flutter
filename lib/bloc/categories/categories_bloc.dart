import 'package:bloc/bloc.dart';
import 'package:booze_flutter/models/categories/categories_model.dart';
import 'package:booze_flutter/repositories/categories_repository/categories_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository categoriesRepository;
  CategoriesBloc({required this.categoriesRepository})
      : super(CategoriesInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(CategoriesLoadingState());
      try {
        if (kDebugMode) {
          print('zvatanga');
        }
        CategoriesModel data = await categoriesRepository.getCategories();
           if (kDebugMode) {
          print(data);
        }
        emit(CategoriesLoadedState(categoriesModel: data));
      } catch (e) {
         if (kDebugMode) {
          print(e);
        }
        emit(CategoriesErrorState(message: e.toString()));
      }
    });
  }
}

import 'package:booze_flutter/bloc/categories/categories_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_strings/strings.dart';
import '../../models/categories/categories_model.dart';

class CategorySlider extends StatefulWidget {
  const CategorySlider({Key? key}) : super(key: key);

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesBloc, CategoriesState>(
      listener: (context, state) {},
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoadedState) {
            List<Datum> data = state.categoriesModel.data ?? [];
            data.insert(
                0,
                Datum(
                    id: -1,
                    name: 'All Products',
                    image: 'images/allProducts.png',
                    subCategories: []));
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 120.0,
                child: ListView.separated(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (() {
                        if(data[index].id == -1){
                          if (kDebugMode) {
                            print('all products');
                          }
                        }else{
                          if (kDebugMode) {
                            print('category ${data[index].id }');
                          }
                        }
                      }),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: 127,
                              height: 127,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: FittedBox(
                                  child: Image.network(
                                      '${Strings.baseUrl}${Strings.imageUrl}/${data[index].image}')),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(data[index].name ?? '')
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

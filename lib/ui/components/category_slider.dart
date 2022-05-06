import 'package:booze_flutter/bloc/categories/categories_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_strings/strings.dart';

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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 120.0,
                child: ListView.separated(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: state.categoriesModel.data?.length ?? 0,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (() {
                        if (kDebugMode) {
                          print('we clicked an ob');
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
                                      '${Strings.baseUrl}${Strings.imageUrl}/${state.categoriesModel.data?[index].image}')),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(state.categoriesModel.data?[index].name ?? '')
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

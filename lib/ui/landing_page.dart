import 'package:booze_flutter/bloc/auth/auth_bloc.dart';
import 'package:booze_flutter/ui/body_builder.dart';
import 'package:booze_flutter/ui/components/header.dart';
import 'package:booze_flutter/ui/products/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../responsive/responsive.dart';
import 'components/category_slider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return BodyBuilder(body: landingPageBody());
  }

  SingleChildScrollView landingPageBody() {
    return SingleChildScrollView(
      child: Column(children: [
        const Header(),
        const SizedBox(
          height: 1,
        ),
        const CategorySlider(),
        // const BannerPage(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Responsive.isDesktop(context)
                  ? const SizedBox(
                      width: 200,
                      height: 50,
                    )
                  : const SizedBox(),
              Expanded(
                flex: 3,
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ProductsPage(),
                    ),
                  ],
                ),
              ),
              Responsive.isDesktop(context)
                  ? const SizedBox(
                      width: 200,
                      height: 50,
                    )
                  : const SizedBox(),
            ],
          ),
        )
      ]),
    );
  }

  Widget authListener() {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('You are logged in as  ' +
                  state.authModel.user!.name.toString())));
        }
      },
      child: Container(),
    );
  }
}

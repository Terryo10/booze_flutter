import 'package:booze_flutter/bloc/auth/auth_bloc.dart';
import 'package:booze_flutter/ui/body_builder.dart';
import 'package:booze_flutter/ui/components/banner.dart';
import 'package:booze_flutter/ui/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: Column(children: const [
        Header(),
        CategorySlider(),
        BannerPage(),
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

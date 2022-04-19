import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:booze_flutter/bloc/auth/auth_bloc.dart';
import 'package:booze_flutter/responsive/responsive.dart';
import 'package:booze_flutter/ui/auth/helpers/validator.dart';
import 'package:booze_flutter/ui/components/header.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: ListView(
        children: [
          const Header(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 8),
            child: const Body(),
          )
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  Validator validator = Validator();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Responsive.isMobile(context)
            ? Container()
            : Responsive.isTablet(context)
                ? Container()
                : Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sign In to \n Booze',
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "If you don't have an account",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "You can",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: () {
                                  context.navigateNamedTo('/register-page');
                                },
                                child: const Text(
                                  "Register here!",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            'images/illustration-2.png',
                            // width: 300,
                          ),
                        ],
                      ),
                    ),
                  ),
        Responsive.isMobile(context)
            ? Container()
            : Expanded(
                flex: 2,
                child: Image.asset(
                  'images/illustration-1.png',
                ),
              ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 6),
            child: SizedBox(
              child: _formLogin(),
            ),
          ),
        )
      ],
    );
  }

  Widget _formLogin() {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            validator.validateEmail(_emailController.text);
            setState(() {});
          },
          controller: _emailController,
          decoration: InputDecoration(
            errorText: _emailController.text.isEmpty
                ? null
                : validator.validateEmail(_emailController.text)
                    ? null
                    : 'invalid email',
            hintText: 'Enter email or Phone number',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          onChanged: (x) {
            setState(() {});
          },
          obscureText: true,
          controller: _passwordController,
          decoration: InputDecoration(
            errorText: _passwordController.text.isEmpty
                ? null
                : (_passwordController.text.length < 6)
                    ? 'Password too short'
                    : null,
            hintText: 'Password',
            counterText: 'Forgot password?',
            suffixIcon: const Icon(
              Icons.visibility_off_outlined,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.shade100,
                spreadRadius: 10,
                blurRadius: 20,
              ),
            ],
          ),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              
              if (state is AuthErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return Container();
                } else {
                  return ElevatedButton(
                    child: const SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Center(child: Text("Sign In"))),
                    onPressed: () {
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty &&
                          _passwordController.text.length > 6 &&
                          validator.validateEmail(_emailController.text)) {
                        BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                            email: _emailController.text,
                            password: _passwordController.text));
                      }else{
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content:  Text('Please fill in the required fields')));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 40),
        Row(children: [
          Expanded(
            child: Divider(
              color: Colors.grey[300],
              height: 50,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: FittedBox(child: Text("Or continue with")),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey[400],
              height: 50,
            ),
          ),
        ]),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1, child: _loginWithButton(image: 'images/google.png')),
            Expanded(
                flex: 1,
                child: _loginWithButton(
                    image: 'images/github.png', isActive: true)),
            Expanded(
                flex: 1, child: _loginWithButton(image: 'images/facebook.png')),
          ],
        ),
      ],
    );
  }

  Widget _loginWithButton({required String image, bool isActive = false}) {
    return Container(
      width: 90,
      height: 70,
      decoration: isActive
          ? BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 10,
                  blurRadius: 30,
                )
              ],
              borderRadius: BorderRadius.circular(15),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade400),
            ),
      child: Center(
          child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 2,
                    blurRadius: 15,
                  )
                ],
              )
            : const BoxDecoration(),
        child: Image.asset(
          image,
          width: 35,
        ),
      )),
    );
  }
}

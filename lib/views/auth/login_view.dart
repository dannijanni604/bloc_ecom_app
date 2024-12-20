import 'package:bloc_ecom_app/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/config.dart';
import '../../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  late LoginBloc _loginBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  void dispose() {
    _loginBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: authAppBar(),
        body: BlocProvider(
            create: (context) => _loginBloc,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Please login to your account",
                              style: kFont16W500),
                          const SizedBox(height: 10),
                          BlocBuilder<LoginBloc, LoginState>(
                              buildWhen: (current, previous) =>
                                  current.email != previous.email,
                              builder: (context, state) {
                                return TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    focusNode: emailFocusNode,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Email',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onChanged: (value) {
                                      context
                                          .read<LoginBloc>()
                                          .add(EmailChanged(email: value));
                                    },
                                    onFieldSubmitted: (value) {});
                              }),
                          const SizedBox(height: 20),
                          BlocBuilder<LoginBloc, LoginState>(
                              buildWhen: (current, previous) =>
                                  current.password != previous.password,
                              builder: (context, state) {
                                return TextFormField(
                                  keyboardType: TextInputType.text,
                                  focusNode: passwordFocusNode,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Password',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onChanged: (value) {
                                    context
                                        .read<LoginBloc>()
                                        .add(PasswordChanged(password: value));
                                  },
                                  onFieldSubmitted: (value) {},
                                );
                              }),
                          const SizedBox(height: 50),
                          Center(
                              child: BlocListener<LoginBloc, LoginState>(
                                  listenWhen: (previous, current) =>
                                      current.apiStatus != previous.apiStatus,
                                  listener: (context, state) {
                                    if (state.apiStatus == ApiStatus.error) {
                                      showSnackBar(
                                          context: context,
                                          title: state.message.toString());
                                    }
                                    if (state.apiStatus == ApiStatus.success) {
                                      ///TODO
                                      showSnackBar(
                                          context: context,
                                          title: 'Login Success');
                                    }
                                  },
                                  child: BlocBuilder<LoginBloc, LoginState>(
                                      buildWhen: (current, previous) =>
                                          current.apiStatus !=
                                          previous.apiStatus,
                                      builder: (context, state) {
                                        return ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: primaryColor),
                                            onPressed: () {
                                              context
                                                  .read<LoginBloc>()
                                                  .add(LoginApi());
                                            },
                                            child: state.apiStatus ==
                                                    ApiStatus.loading
                                                ? appLoadingIndicator()
                                                : Text('Login',
                                                    style: kFont18White));
                                      }))),
                          const Spacer(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account?"),
                                TextButton(
                                    style: ButtonStyle(
                                        padding: WidgetStateProperty.all(
                                            EdgeInsets.zero)),
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, AppRoutes.signupView);
                                    },
                                    child: const Text('Sign up'))
                              ])
                        ])))));
  }
}

import 'package:bloc_ecom_app/utils/consts.dart';
import 'package:bloc_ecom_app/utils/enums.dart';
import 'package:bloc_ecom_app/utils/themes/light_theme.dart';
import 'package:bloc_ecom_app/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/signup/signup_bloc.dart';
import '../../config/app_common_functions.dart';
import '../../config/custom_widgets/app_loading_indicator.dart';
import '../../config/custom_widgets/custom_app_bar.dart';
import '../../config/routes/app_routes.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  late SignupBloc _signupBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _signupBloc = SignupBloc();
  }

  @override
  void dispose() {
    _signupBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: authAppBar(),
        body: BlocProvider(
            create: (context) => _signupBloc,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                    key: _formKey,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text("Please signup for new account", style: kFont16W500),
                      const SizedBox(height: 10),
                      BlocBuilder<SignupBloc, SignupState>(
                          buildWhen: (current, previous) => current.email != previous.email,
                          builder: (context, state) {
                            return TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              focusNode: emailFocusNode,
                              decoration: InputDecoration(isDense: true, hintText: 'Email', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                              onChanged: (value) {
                                context.read<SignupBloc>().add(EmailChanged(email: value));
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Email';
                                }
                                if (!Validations.emailValidator(value)) {
                                  return 'Please enter a valid Email';
                                }
                                return null;
                              },
                            );
                          }),
                      const SizedBox(height: 20),
                      BlocBuilder<SignupBloc, SignupState>(
                        buildWhen: (current, previous) => current.password != previous.password,
                        builder: (context, state) {
                          return TextFormField(
                            keyboardType: TextInputType.text,
                            focusNode: passwordFocusNode,
                            decoration: InputDecoration(isDense: true, hintText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                            onChanged: (value) {
                              context.read<SignupBloc>().add(PasswordChanged(password: value));
                            },
                            validator: (value) {
                              if (value!.isEmpty) return 'Please enter password';
                              if (value.length < 6) return 'Please enter at least 6 digits';
                              return null;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 50),
                      Center(
                        child: BlocListener<SignupBloc, SignupState>(
                          listenWhen: (previous, current) => current.apiStatus != previous.apiStatus,
                          listener: (context, state) {
                            if (state.apiStatus == ApiStatus.error) {
                              showSnackBar(context: context, title: state.message.toString());
                            }
                            if (state.apiStatus == ApiStatus.success) {
                              Navigator.pushReplacementNamed(context, AppRoutes.appBottomNav);
                              showSnackBar(context: context, title: 'Signup Success');
                            }
                          },
                          child: BlocBuilder<SignupBloc, SignupState>(
                            buildWhen: (current, previous) => current.apiStatus != previous.apiStatus,
                            builder: (context, state) {
                              return ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<SignupBloc>().add(SubmitSignup());
                                    }
                                  },
                                  child: state.apiStatus == ApiStatus.loading
                                      ? appLoadingIndicator()
                                      : Text(
                                    'Signup',
                                    style: kFont18White,
                                  ));
                            },
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        const Text("Already have an account?"),
                        TextButton(
                            style: ButtonStyle(padding: WidgetStateProperty.all(EdgeInsets.zero)),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, AppRoutes.loginView);
                            },
                            child: const Text('Sign in'))
                      ])
                    ])))));
  }
}

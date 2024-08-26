import 'package:bloc_ecom_app/app/app_common_functions.dart';
import 'package:bloc_ecom_app/app/custom_widgets/app_loading_indicator.dart';
import 'package:bloc_ecom_app/app/custom_widgets/custom_app_bar.dart';
import 'package:bloc_ecom_app/bloc/login/login_bloc.dart';
import 'package:bloc_ecom_app/utils/consts.dart';
import 'package:bloc_ecom_app/utils/enums.dart';
import 'package:bloc_ecom_app/utils/themes/light_theme.dart';
import 'package:bloc_ecom_app/views/app_bottom_navigation/app_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Please login to your account", style: kFont16W500),
                  const SizedBox(height: 10),
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (current, previous) => current.email != previous.email,
                    builder: (context, state) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        focusNode: emailFocusNode,
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Email', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        onChanged: (value) {
                          context.read<LoginBloc>().add(EmailChanged(email: value));
                        },
                        onFieldSubmitted: (value) {},
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (current, previous) => current.password != previous.password,
                    builder: (context, state) {
                      return TextFormField(
                        keyboardType: TextInputType.text,
                        focusNode: passwordFocusNode,
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        onChanged: (value) {
                          context.read<LoginBloc>().add(PasswordChanged(password: value));
                        },
                        onFieldSubmitted: (value) {},
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: BlocListener<LoginBloc, LoginState>(
                      listenWhen: (previous, current) => current.loginStatus != previous.loginStatus,
                      listener: (context, state) {
                        if (state.loginStatus == LoginStatus.error) {
                          showSnackBar(context: context, title: state.message.toString());
                        }
                        if (state.loginStatus == LoginStatus.success) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AppBottomNavigation(),));
                          showSnackBar(context: context, title: 'Login Success');
                        }
                      },
                      child: BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: (current, previous) => current.loginStatus != previous.loginStatus,
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                            onPressed: () {
                              context.read<LoginBloc>().add(LoginApi());
                            },
                              child: state.loginStatus == LoginStatus.loading ? appLoadingIndicator():  Text('Login',style: kFont18White,)
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}






// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../bloc/login/login_bloc.dart';
// import '../../utils/enums.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   late LoginBloc _loginBlocs;
//
//   final emailFocusNode = FocusNode();
//   final passwordFocusNode = FocusNode();
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _loginBlocs = LoginBloc();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _loginBlocs.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: BlocProvider(
//         create: (_) => _loginBlocs,
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Form(
//             key: _formKey,
//             child: BlocListener<LoginBloc, LoginState>(
//               listenWhen: (previous, current) => current.loginStatus != previous.loginStatus,
//               listener: (context, state) {
//                 if (state.loginStatus == LoginStatus.error) {
//                   ScaffoldMessenger.of(context)
//                     ..hideCurrentSnackBar()
//                     ..showSnackBar(
//                       SnackBar(content: Text(state.message.toString())),
//                     );
//                 }
//
//                 if (state.loginStatus == LoginStatus.success) {
//                   ScaffoldMessenger.of(context)
//                     ..hideCurrentSnackBar()
//                     ..showSnackBar(
//                       const SnackBar(content: Text('Login successful')),
//                     );
//                 }
//               },
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   BlocBuilder<LoginBloc, LoginState>(
//                       buildWhen: (current, previous) => current.email != previous.email,
//                       builder: (context, state) {
//                         return TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           focusNode: emailFocusNode,
//                           decoration: const InputDecoration(hintText: 'Email', border: OutlineInputBorder()),
//                           onChanged: (value) {
//                             context.read<LoginBloc>().add(EmailChanged(email: value));
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Enter email';
//                             }
//                             return null;
//                           },
//                           onFieldSubmitted: (value) {},
//                         );
//                       }),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   BlocBuilder<LoginBloc, LoginState>(
//                       buildWhen: (current, previous) => current.password != previous.password,
//                       builder: (context, state) {
//                         return TextFormField(
//                           keyboardType: TextInputType.text,
//                           focusNode: passwordFocusNode,
//                           decoration: const InputDecoration(hintText: 'Password', border: OutlineInputBorder()),
//                           onChanged: (value) {
//                             context.read<LoginBloc>().add(PasswordChanged(password: value));
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Enter password';
//                             }
//                             return null;
//                           },
//                           onFieldSubmitted: (value) {},
//                         );
//                       }),
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   BlocBuilder<LoginBloc, LoginState>(
//                       buildWhen: (current, previous) => current.loginStatus != previous.loginStatus,
//                       builder: (context, state) {
//                         return ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 context.read<LoginBloc>().add(LoginApi());
//                               }
//                             },
//                             child: state.loginStatus == LoginStatus.loading ? CircularProgressIndicator() : const Text('Login'));
//                       })
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
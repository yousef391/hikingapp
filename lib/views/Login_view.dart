import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hiking_app/const.dart';
import 'package:hiking_app/core/utils/Go_router.dart';
import 'package:hiking_app/core/utils/api_service.dart';
import 'package:hiking_app/data/repo/Home_repoimpl.dart';
import 'package:hiking_app/viewmodels/cubit/auth_cubit.dart';
import 'package:hiking_app/viewmodels/cubit/getposition_cubit.dart';
import 'package:hiking_app/views/widgets/custom_Tf.dart';
import 'package:hiking_app/views/widgets/custom_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

// ignore: must_be_immutable
class Login_View extends StatelessWidget {
  Login_View({super.key});

  final emailController = TextEditingController();
  bool loading = false;
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) =>  GetpositionCubit(Homerepoimpl(api_services: Api_services(dio: Dio()))),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is Authsucces) {
              loading = false;
              GoRouter.of(context).push(routerapp.Khomepath);
              
            }
            if (state is Authloading) {
              loading = true;
            }

            if (state is Authfailure) {
              loading = false;
              QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  title: state.message,
                  confirmBtnText: 'Ok',
                  confirmBtnColor: Color(0xff2185D5),
                  borderRadius: 8);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              blur: 20,
              progressIndicator: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: primaryColot,
                  size: 50,
                ),
              ),
              inAsyncCall: loading,
              child: Form(
                key: _formKey,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Flexible(
                          child: FadeInUp(
                              duration: const Duration(milliseconds: 1200),
                              child: Image.asset(
                                'assets/images/logo.png',
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        FadeInDown(
                            duration: const Duration(milliseconds: 1600),
                            child: const Text(
                              'Welcome Back ',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        FadeInDown(
                            duration: const Duration(milliseconds: 1800),
                            child: const Text(
                              'Login to access your account',
                              style: TextStyle(
                                  color: Color(0xff888888), fontSize: 14),
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        custom_TF(
                          keyboard:TextInputType.emailAddress,
                          controller: emailController,
                          hint: 'Enter your email',
                          password: false,
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'void informations';
                            }
                            if (!EmailValidator.validate(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        custom_TF(
                          keyboard: TextInputType.visiblePassword,
                          controller: passwordController,
                          hint: 'Enter your Password',
                          password: true,
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'void informations';
                            }
                            if (value.length < 3) {
                              return 'Use at least 8 characteres';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Text('Forget Password ?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Color(0xff888888), fontSize: 14)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        custom_button(
                            ontap: () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context).login(
                                    emailController.text,
                                    passwordController.text);
                              }
                            },
                            color: const Color(0xff2185D5),
                            content: const Text('Login',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

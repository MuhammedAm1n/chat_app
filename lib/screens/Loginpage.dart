import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mu7achatapp/helpr/Snakbar.dart';
import 'package:mu7achatapp/screens/Chatpage.dart';
import 'package:mu7achatapp/screens/Cubit/cubit/chatpage_cubit.dart';
import 'package:mu7achatapp/screens/Cubit/cubit/login_cubit.dart';
import 'package:mu7achatapp/screens/registerpage.dart';
import 'package:mu7achatapp/widgets_custom/Submitbuttoncustom.dart';
import 'package:mu7achatapp/widgets_custom/Textfield_custom.dart';

class LoginPage extends StatelessWidget {
  static String id = 'Loginpage';
  String? Email, Password;
  bool isloading = false;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isloading = true;
        } else if (state is LoginSuccs) {
          BlocProvider.of<ChatpageCubit>(context).getMassge();
          Navigator.pushNamed(context, Chatpage.id);
          isloading = false;
        } else if (state is LoginFailuer) {
          ShowSnackbar(context, state.eMassge);
          isloading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Image.asset(
                      'images/logo_transparent.png',
                      scale: 5,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text('Login',
                          style: TextStyle(color: Colors.white, fontSize: 28))
                    ]),
                    /* Email Text Field */ Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: CustomTextField(
                        onchange: (data) {
                          Email = data;
                        },
                        hintext: 'Email',
                      ),
                    ),
                    /* Password Text Field */ Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: CustomTextField(
                        obscure: true,
                        onchange: (data) {
                          Password = data;
                        },
                        hintext: 'Password',
                      ),
                    ),
                    /*Login In button Button */ Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: CustomButton(
                            ontap: () async {
                              if (formkey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context).Loginuser(
                                    Email: Email!, Password: Password!);
                              } else {}
                            },
                            Textz: 'Login')) /*Register Section */,
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('don\'t have an accout',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17)),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, RigsterPage.id);
                              },
                              child: Text(
                                '  Register',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

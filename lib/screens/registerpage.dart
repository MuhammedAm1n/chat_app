import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mu7achatapp/helpr/Snakbar.dart';
import 'package:mu7achatapp/screens/Chatpage.dart';
import 'package:mu7achatapp/screens/Cubit/cubit/rigster_cubit.dart';
import 'package:mu7achatapp/screens/Loginpage.dart';
import '../widgets_custom/Submitbuttoncustom.dart';
import '../widgets_custom/Textfield_custom.dart';

class RigsterPage extends StatelessWidget {
  String? Email;
  String? Password;
  static String id = 'Registerpage';
  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RigsterCubit, RigsterState>(
      listener: (context, state) {
        if (state is RigsterLoading) {
          isloading = true;
        } else if (state is RigsterSuccs) {
          Navigator.pushNamed(context, Chatpage.id);
          isloading = false;
        } else if (state is RigsterFaliuer) {
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
                      Text('Register',
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
                        onchange: (dataz) {
                          Password = dataz;
                        },
                        hintext: 'Password',
                      ),
                    ),
                    /*Login In button Button */ Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: CustomButton(
                            ontap: () async {
                              if (formkey.currentState!.validate()) {
                                BlocProvider.of<RigsterCubit>(context)
                                    .registerUser(
                                        Email: Email!, Password: Password!);
                              }
                            },
                            Textz: 'Register')) /*Register Section */,
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
                                Navigator.pop(context);
                              },
                              child: Text(
                                '  Login',
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

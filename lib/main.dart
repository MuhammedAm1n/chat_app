import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mu7achatapp/firebase_options.dart';
import 'package:mu7achatapp/screens/Cubit/cubit/chatpage_cubit.dart';
import 'package:mu7achatapp/screens/Cubit/cubit/login_cubit.dart';
import 'package:mu7achatapp/screens/Cubit/cubit/rigster_cubit.dart';
import 'package:mu7achatapp/screens/Loginpage.dart';
import 'package:mu7achatapp/screens/Chatpage.dart';
import 'package:mu7achatapp/screens/registerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(Mu7achatapp());
}

class Mu7achatapp extends StatelessWidget {
  const Mu7achatapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RigsterCubit()),
        BlocProvider(create: (context) => ChatpageCubit())
      ],
      child: MaterialApp(
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RigsterPage.id: (context) => RigsterPage(),
          Chatpage.id: (context) => Chatpage()
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> Loginuser(
      {required String Email, required String Password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: Email, password: Password);
      emit(LoginSuccs());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailuer(eMassge: 'user-not-found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailuer(eMassge: 'wrong-password'));
      }
    } catch (e) {
      emit(LoginFailuer(eMassge: 'something wrong please try againe'));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'rigster_state.dart';

class RigsterCubit extends Cubit<RigsterState> {
  RigsterCubit() : super(RigsterInitial());

  Future<void> registerUser(
      {required String Email, required String Password}) async {
    emit(RigsterLoading());

    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: Email, password: Password);
      emit(RigsterSuccs());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'email-already-in-use') {
        emit(RigsterFaliuer(eMassge: 'email-already-in-use'));
      } else if (ex.code == 'weak-password') {
        emit(RigsterFaliuer(eMassge: 'weak-password'));
      }
    } catch (e) {
      emit(RigsterFaliuer(eMassge: 'something wrong please try againe'));
    }
  }
}

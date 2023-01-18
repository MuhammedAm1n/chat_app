import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:mu7achatapp/models/massges.dart';

part 'chatpage_state.dart';

class ChatpageCubit extends Cubit<ChatpageState> {
  ChatpageCubit() : super(ChatpageInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  void sendMassge({required String data, required var email}) {
    messages.add({'message': data, 'createdAt': DateTime.now(), 'id': email});
  }

  void getMassge() {
    messages.orderBy('createdAt', descending: true).snapshots().listen((event) {
      List<Message> MessagesList = [];
      for (var doc in event.docs) {
        MessagesList.add(Message.fromJson(doc));
      }
      emit(ChatpageSuccs(message: MessagesList));
    });
  }
}

part of 'chatpage_cubit.dart';

@immutable
abstract class ChatpageState {}

class ChatpageInitial extends ChatpageState {}

class ChatpageSuccs extends ChatpageState {
  List<Message> message;
  ChatpageSuccs({required this.message});
}

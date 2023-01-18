import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mu7achatapp/models/massges.dart';
import 'package:mu7achatapp/screens/Cubit/cubit/chatpage_cubit.dart';
import 'package:mu7achatapp/widgets_custom/chatpubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chatpage extends StatelessWidget {
  Chatpage({Key? key}) : super(key: key);
  final _controller = ScrollController();
  static String id = "Chatpage";
  List<Message> messageslist = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'images/logo_transparent.png',
            height: 70,
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(children: [
          Expanded(
            child: BlocConsumer<ChatpageCubit, ChatpageState>(
              listener: (context, state) {
                if (state is ChatpageSuccs) {
                  messageslist = state.message;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messageslist.length,
                    itemBuilder: (context, index) {
                      return messageslist[index].id == email
                          ? Chatpubbles(
                              message: messageslist[index],
                            )
                          : Chatpubblesforfriend(message: messageslist[index]);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatpageCubit>(context)
                    .sendMassge(data: data, email: email);
                controller.clear();
                _controller.animateTo(0,
                    duration: Duration(seconds: 1), curve: Curves.easeIn);
              },
              decoration: InputDecoration(
                  hintText: 'Send Message',
                  suffixIcon: Icon(Icons.send),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.black))),
            ),
          )
        ]));
  }
}

class Message {
  final String message;
  var id;
  Message(this.message, this.id);

  factory Message.fromJson(Jsondata) {
    return Message(Jsondata['message'], Jsondata['id']);
  }
}

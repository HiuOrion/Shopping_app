import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final String userSend;

  final String created_at;

  @override
  final Key key;

  const MessageBubble(
      {required this.text,
        required this.userSend,
        required this.created_at,
        required this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      subtitle: Text(userSend),
      // trailing: Text(DateTime.parse(created_at).toLocal().toString()),
    );
  }
}
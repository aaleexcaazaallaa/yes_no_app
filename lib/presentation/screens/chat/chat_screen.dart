import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widget/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widget/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(backgroundImage: NetworkImage('https://images.hola.com/imagenes/mascotas/20191218155663/gatos-memes-divertidos-2019-gt/0-755-567/gato-tosiendo-z.jpg'),),
        ),
        title: const Text("Mi amor 🥵"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return (index % 2 == 0)
                ? const MyMessageBubble()
                : const HerMessageBubble();
          }))
        ],
      ),
    ));
  }
}

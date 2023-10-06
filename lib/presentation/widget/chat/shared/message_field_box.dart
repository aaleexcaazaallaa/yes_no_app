import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class MessageFieldBox extends StatelessWidget {
  //final ValueChanged<String> onValue;
  //const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();

    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(20));

    final inputDecoration = InputDecoration(
        hintText: 'End your text with a "??"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              final textValue = textController.value.text;
              chatProvider.sendMessage(textValue);
              //onValue(textValue);
              textController.clear();
            },
            icon: const Icon(Icons.send_outlined)));

    return TextFormField(
      onTap: chatProvider.refresh,
      onTapOutside: (over) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        chatProvider.sendMessage(value);
        //onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_bot/providers/chats_provider.dart';
import 'package:mobile_bot/widgets/chat_item.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/text_and_voice_field.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const MyAppBar(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/darkside.png'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Text("Today, ${DateFormat("Hm").format(DateTime.now())}", style: const TextStyle(fontSize: 20
                  ),),
                ),
              ),
              Expanded(
                child: Consumer(builder: (context, ref, child) {
                  final chats = ref.watch(chatsProvider).reversed.toList();
                  return ListView.builder(
                    reverse: true,
                    itemCount: chats.length,
                    itemBuilder: (context, index) => ChatItem(
                      text: chats[index].message,
                      isMe: chats[index].isMe,
                    ),
                  );
                }),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: TextAndVoiceField(),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
    );
  }
}
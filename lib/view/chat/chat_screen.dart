import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/chat/chat_burble.dart';

import '../../controller/chat_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatController chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Chat', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Obx(() {
        // Kiểm tra nếu account hoặc messagesRef chưa sẵn sàng
        if (chatController.isLoadingAccount.value || chatController.messagesRef == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: chatController.messagesRef!.onValue, // Sử dụng ! vì đã kiểm tra null
                builder: (context, AsyncSnapshot<DatabaseEvent> snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snap.hasData &&
                      !snap.hasError &&
                      snap.data!.snapshot.value != null) {
                    Map<dynamic, dynamic> data =
                    snap.data!.snapshot.value as Map<dynamic, dynamic>;
                    List<Map<String, dynamic>> items = [];

                    data.forEach((key, value) {
                      items.add({
                        'key': key,
                        'text': value['text'] ?? '',
                        'created_at': value['created_at'] ?? '',
                        'user_send': value['user_send'] ?? '',
                      });
                    });

                    items.sort((a, b) {
                      try {
                        final createdAtA = DateTime.parse(a['created_at']);
                        final createdAtB = DateTime.parse(b['created_at']);
                        return createdAtB.compareTo(createdAtA);
                      } catch (e) {
                        print('Error parsing date: $e');
                        return 0;
                      }
                    });

                    return ListView.builder(
                      // scrollDirection: Axis.vertical,
                      reverse: true,
                      itemCount: items.length,
                      itemBuilder: (ctx, index) => MessageBubble(
                        key: ValueKey(items[index]['key']),
                        text: items[index]['text'],
                        userSend: items[index]['user_send'],
                        created_at: items[index]['created_at'],
                      ),
                    );
                  } else {
                    return const Center(child: Text("No messages yet."));
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: chatController.textController,
                      decoration: const InputDecoration(labelText: 'Send a message...'),
                      onSubmitted: (_) => chatController.sendMessage(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: chatController.sendMessage,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:whats_app/features/users/models/user_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CustomInboxScreen extends StatefulWidget {
  const CustomInboxScreen({
    Key? key,
    required this.userModel,
    required this.sourcChat,
  }) : super(key: key);

  final UserModel userModel;
  final UserModel sourcChat;

  @override
  State<CustomInboxScreen> createState() => _CustomInboxScreenState();
}

class _CustomInboxScreenState extends State<CustomInboxScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = []; // List to store messages with sender info
  late IO.Socket socket;

  @override
  void initState() {
    connect();
    super.initState();
  }

  void connect() {
    socket = IO.io("http://192.168.11.35:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("signin", widget.userModel.id);
    socket.onConnect((data) => print("socket is connected"));

    // Listen for incoming messages
    socket.on("messages", (data) {
      setState(() {
        messages.add({
          "message": data['message'],
          "senderId": data['sourceId'], // Storing who sent the message
        });
      });
    });
  }

  void sendMessage(String message, int sourceId, int targetId) {
    if (message.isNotEmpty) {
      setState(() {
        messages.add({
          "message": message,
          "senderId": sourceId, // Mark the current user as the sender
        });
      });

      socket.emit("messages", {
        "message": message,
        "sourceId": sourceId,
        "targetId": targetId,
      });

      _controller.clear(); // Clear the text field
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sourcChat.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                // Check if the message is sent by the current user
                bool isSentByUser = messages[index]['senderId'] == widget.sourcChat.id;
                return Align(
                  alignment: isSentByUser
                      ? Alignment.centerRight // Sent by user, show on the right
                      : Alignment.centerLeft,  // Received message, show on the left
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: isSentByUser ? Colors.green[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(messages[index]['message']),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Enter message...",
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    sendMessage(_controller.text, widget.sourcChat.id,
                        widget.userModel.id);
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:whats_app/features/custom_chat/components/custom_chat_card.dart';
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
  List<String> messages = []; // List to store messages
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
  }

  void sendMessage(String message, int sourceId, int targetId) {
    if (message.isNotEmpty) {
      setState(() {
        messages.add(message); // Add the message to the list
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
                return ListTile(
                  title: Align(
                    alignment: widget.sourcChat.id == widget.userModel.id
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: widget.sourcChat.id == widget.userModel.id
                            ? Colors.green[100]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(messages[index]),
                    ),
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
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    sendMessage(_controller.text, widget.sourcChat.id,
                        widget.userModel.id);
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

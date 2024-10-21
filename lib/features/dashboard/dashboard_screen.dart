import 'package:flutter/material.dart';
import 'package:whats_app/features/custom_chat/all_chat.dart';
import 'package:whats_app/features/users/models/user_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen(
      {super.key, required this.userModel, required this.sourcChat});
  final UserModel userModel;
  final UserModel sourcChat;
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("---${widget.userModel.name}"),
          bottom: TabBar(
            indicatorColor: Colors.white,
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white30,
            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: "Chats"),
              Tab(text: "Status"),
              Tab(text: "Calls"),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Center(child: Icon(Icons.camera_alt, size: 100)),
            AllChatScreen(
                userModel: widget.userModel, sourcChat: widget.sourcChat),
            Center(child: Text("Status Tab")),
            Center(child: Text("Calls Tab")),
          ],
        ),
      ),
    );
  }
}

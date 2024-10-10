import 'package:flutter/material.dart';
import 'package:whats_app/features/users/models/user_model.dart';

class CustomChatCard extends StatelessWidget {
  const CustomChatCard({
    super.key, required this.userModel, required this.sourchChat,
  });
final UserModel userModel;
final UserModel sourchChat;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}
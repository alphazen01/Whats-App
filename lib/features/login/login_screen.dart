import 'package:flutter/material.dart';
import 'package:whats_app/features/dashboard/dashboard_screen.dart';
import 'package:whats_app/features/home/home_screen.dart';
import 'package:whats_app/features/users/models/user_model.dart';
import 'package:whats_app/screens/chat_screen/chat_screen.dart';
import 'package:whats_app/screens/inbox_screen/inbox_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserModel? sourchChat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final data = userList[index];
            return ListTile(
              onTap: () {
                setState(() {
                  sourchChat = data; // Assign the tapped user to sourceChat
                });
                // sourchChat = userList.removeAt(
                //     index); // Here sourchChat gets removed from userList

                // Navigate to the DashboardScreen, passing the userModel and sourcChat
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DashboardScreen(
                      userModel:
                          data, // This should be the recipient (target user)
                      sourcChat:
                          sourchChat!, // This should be the current user (source user)
                    ),
                  ),
                );
              },
              leading: CircleAvatar(
                child: Text(data.id.toString()),
              ),
              title: Text(
                data.name,
                style: TextStyle(color: Colors.red),
              ),
            );
          }),
    );
  }
}

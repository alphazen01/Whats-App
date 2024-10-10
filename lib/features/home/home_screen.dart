import 'package:flutter/material.dart';
import 'package:whats_app/constants.dart';
import 'package:whats_app/features/users/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userModel});
final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userModel.name),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
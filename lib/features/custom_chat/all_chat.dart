import 'package:flutter/material.dart';
import 'package:whats_app/constants.dart';
import 'package:whats_app/features/custom_chat/custom_inbox.dart';
import 'package:whats_app/features/custom_chat/model/chat_model.dart';
import 'package:whats_app/features/users/models/user_model.dart';
import 'package:whats_app/models/Chat.dart';
import 'package:whats_app/screens/chat_screen/chat_screen.dart';
import 'package:whats_app/screens/inbox_screen/components/chats_card.dart';
import 'package:whats_app/screens/inbox_screen/inbox_screen.dart';

class AllChatScreen extends StatelessWidget {
  const AllChatScreen({super.key,required this.userModel, required this.sourcChat});
final UserModel userModel;
final UserModel sourcChat;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ListView.builder(
                padding: const EdgeInsets.only(top: kMedPadding),
                itemCount: userList.length ,
                itemBuilder: ((context, index) =>  
                ListTile(
                  onTap: (){
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  CustomInboxScreen( 
                                userModel: userModel, 
                                sourcChat: userList[index])
                              
                              ));
                  },
                  title: Text(
                    userList[index].name
                  ),
                )
                // ChatCard(
                //       userModel: userModel,
                //       sourcChat: sourcChat,
                //         chat: chatModel[index],
                //         press: () {
                //           print("skdfjasdf");
                //         } 
                //         // Navigator.push(
                //         //   context,
                //         //   MaterialPageRoute(
                //         //       builder: (context) => const InboxScreen()
                //         //       ),
                //         // ),
                //       )
                     
                    ),
              ),
    );
  }
}
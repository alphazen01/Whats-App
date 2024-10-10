import 'package:flutter/material.dart';
import 'package:whats_app/constants.dart';
import 'package:whats_app/features/custom_chat/model/chat_model.dart';
import 'package:whats_app/features/users/models/user_model.dart';
import 'package:whats_app/models/chat.dart';
import 'package:whats_app/models/chat_message.dart';
import 'package:whats_app/screens/camera_screen/camera_screen.dart';
import 'package:whats_app/screens/chat_screen/components/chat_body.dart';
import 'package:whats_app/screens/info_screen/info_screen.dart';

import '../caller_screen/caller_screen.dart';
import 'package:socket_io_client/socket_io_client.dart'as IO;

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.status,
      required this.chat, 
      required this.userModel, required this.sourcChat})
      : super(key: key);
  final String image, name;
  final Chat chat;
  final bool status;
  final UserModel userModel;
final UserModel sourcChat;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;

  // @override
  // void initState() {
  //   super.initState();

  //   focusNode.addListener(() {
  //     if (focusNode.hasFocus) {
  //       setState(() {
  //         show = false;
  //       });
  //     }
  //   });
  // }
 late IO.Socket socket;
 @override
  void initState() {
   connect();
    super.initState();
  }
 void connect(){
  socket=IO.io("http://192.168.11.35:5000",<String,dynamic>{
    "transports":["websocket"],
    "autoConnect":false,
  });
  socket.connect();
  socket.emit("signin",widget.sourcChat.id);
  socket.onConnect((data)=>print("socket is connected"));
  
 }

void sendMessage(String message, int sourceId, int targetId) {
  socket.emit("messages", {
    "message": message,
    "sourceId": sourceId,
    "targetId": targetId,
  });
}





  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            opacity: isDarkMode ? 0.32 : 1,
            image: isDarkMode
                ? const AssetImage('assets/images/dark background.png')
                : const AssetImage('assets/images/backgorund.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          
          elevation: 0,
          toolbarHeight: 60,
          leadingWidth: 75,
          titleSpacing: 5,
          backgroundColor: isDarkMode ? kBlackShadowBgColor : kPrimaryColor,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Row(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kSmallPadding * 0.5),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(widget.image),
                ),
              ],
            ),
          ),
          title: InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => InfoScreen(chat: widget.chat),
              //   ),
              // );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 17,
                    color: kBackgroundColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    widget.status == true
                        ? "online"
                        : "last seen today at 3:31 pm",
                    style:
                        const TextStyle(color: kBackgroundColor, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CallerScreen(
                              image: widget.image,
                              name: widget.name,
                              status: widget.chat.isActive == true
                                  ? "Available"
                                  : "Unavailable",
                            )));
              },
              icon: const Icon(Icons.videocam_rounded,color: Colors.white, size: 24),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CallerScreen(
                              image: widget.image,
                              name: widget.name,
                              status: widget.chat.isActive == true
                                  ? "Available"
                                  : "Unavailable",
                            )));
              },
              icon: const Icon(Icons.call_rounded,color: Colors.white, size: 24),
            ),
            PopupMenuButton<String>(
              
              onSelected: (value) {
                // TO-DO
              },
              itemBuilder: (BuildContext contesxt) {
                return [
                  const PopupMenuItem(
                    value: "View contact",
                    child: Text("View contact"),
                  ),
                  const PopupMenuItem(
                    value: "Media, links, and docs",
                    child: Text("Media, links, and docs"),
                  ),
                  const PopupMenuItem(
                    value: "Search",
                    child: Text("Search"),
                  ),
                  const PopupMenuItem(
                    value: "Mute notifications",
                    child: Text("Mute notifications"),
                  ),
                  const PopupMenuItem(
                    value: "Disappearing messages",
                    child: Text("Disappearing messages"),
                  ),
                  const PopupMenuItem(
                    value: "Wallpaper",
                    child: Text("Wallpaper"),
                  ),
                  PopupMenuItem(
                    
                    value: "More",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("More"),
                        Icon(
                          Icons.arrow_right,
                          color: kTextColor,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
          
          ],
        ),
        body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).viewInsets.bottom) *
                    0.795,
                child: ListView.builder(
                  reverse: true,
                  itemCount: chatMessagesData.length,
                  itemBuilder: ((context, index) =>  Padding(
                          padding: const EdgeInsets.only(top: kLargePadding),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                 
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.8,
                              ),
                          ),
                        )
                     ),
                ),
              ),
              
              Container(
                margin: const EdgeInsets.only(top: kSmallPadding),
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.bottom -
                        MediaQuery.of(context).viewInsets.bottom) *
                    0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                        margin:
                            const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextFormField(
                          controller: _controller,
                          focusNode: focusNode,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                sendButton = true;
                              });
                            } else {
                              setState(() {
                                sendButton = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Message",
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            prefixIcon: IconButton(
                              icon: Icon(
                                show
                                    ? Icons.keyboard
                                    : Icons.emoji_emotions_outlined,
                                color: kDarkGreyColor,
                              ),
                              onPressed: () {
                                if (!show) {
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus = false;
                                }
                                setState(() {
                                  show = !show;
                                });
                              },
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Transform.rotate(
                                  angle: -2.3,
                                  child: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (builder) => bottomSheet());
                                    },
                                    icon: const Icon(
                                      Icons.attachment,
                                      size: 26,
                                      color: kDarkGreyColor,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: kDarkGreyColor,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CameraScreen(
                                                  isCamTab: false,
                                                )));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                        right: 2,
                        left: 2,
                      ),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor:
                            isDarkMode ? kFreshPrimaryColor : kPrimaryColor,
                        child: IconButton(
                          icon: Icon(
                            sendButton ? Icons.send : Icons.mic,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (sendButton) {
                              sendMessage(_controller.text, widget.sourcChat.id, widget.userModel.id);
                              _controller.clear();
                              print("-------------${_controller.text}");
                              setState(() {
                                sendButton = false;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
        // ChatBody(
        //   image: widget.image,
        //   name: widget.name,
        // ),
      ),
    );
  }
   Widget bottomSheet() {
    return Container(
      margin: const EdgeInsets.only(
          left: kSmallPadding,
          right: kSmallPadding,
          bottom: kLargePadding * 3.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),

      ),
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kLargePadding * 4.5, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                AttachmentToolCard(
                  name: 'Document',
                  icon: Icons.description,
                  colors: [
                    Color.fromARGB(255, 72, 16, 105),
                    Color.fromARGB(255, 140, 23, 207)
                  ],
                ),
                AttachmentToolCard(
                  name: 'Camera',
                  icon: Icons.photo_camera,
                  colors: [
                    Color.fromARGB(255, 122, 47, 54),
                    Color.fromARGB(255, 182, 83, 93),
                  ],
                ),
                AttachmentToolCard(
                  name: 'Gallery',
                  icon: Icons.photo,
                  colors: [
                    Color.fromARGB(255, 144, 48, 161),
                    Color.fromARGB(255, 218, 115, 236),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                AttachmentToolCard(
                  name: 'Audio',
                  icon: Icons.headphones,
                  colors: [
                    Color.fromARGB(255, 187, 89, 8),
                    Color.fromARGB(255, 212, 117, 39),
                  ],
                ),
                AttachmentToolCard(
                  name: 'Location',
                  icon: Icons.location_on,
                  colors: [
                    Color.fromARGB(255, 47, 102, 21),
                    Color.fromARGB(255, 82, 150, 50),
                  ],
                ),
                AttachmentToolCard(
                  name: 'Contact',
                  icon: Icons.person,
                  colors: [
                    Color.fromARGB(255, 19, 86, 141),
                    Color.fromARGB(255, 47, 127, 192),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

class CustomChatModel {
  final String name, currentMessage,  time ;
  final bool isGroup;




  CustomChatModel({
   required this.name,
   required this.currentMessage,
   required this.time,
   required this.isGroup,
   
  });
}

List chatModel = [
  CustomChatModel(
    name: "Shakib Al Hasan",
    currentMessage: "Hope you are doing well.",
   
    time: "3m ago",
    isGroup: false,
   
  ),
  CustomChatModel(
    name: "Tamim Iqbal",
    currentMessage: "Hope you are doing well.",
   
    time: "3m ago",
    isGroup: false,
   
  ),
  CustomChatModel(
    name: "Mushfiqur Rahim",
    currentMessage: "Hope you are doing well.",
   
    time: "3m ago",
    isGroup: false,
   
  ),
  CustomChatModel(
    name: "Mashrafee Bin Mortaza",
    currentMessage: "Hope you are doing well.",
   
    time: "3m ago",
    isGroup: false,
   
  ),
  
];

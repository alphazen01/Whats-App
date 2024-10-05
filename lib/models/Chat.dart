class Chat {
  final String name, lastMessage, image, time, status, number, joinDate;
  final bool isActive, isSeen;
  bool isSelect;
  final int msgTotal;
  final List<String> images;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
    this.isSeen = false,
    this.msgTotal = 0,
    this.status = '',
    this.number = '',
    this.joinDate = '',
    this.isSelect = false,
    required this.images,
  });
}

List chatsData = [
  Chat(
    name: "John Wilson",
    lastMessage: "Hope you are doing well.",
    image: "assets/images/user1.jpg",
    time: "3m ago",
    isActive: true,
    isSeen: false,
    msgTotal: 0,
    status: 'Available',
    number: '+92 331 2198312',
    joinDate: '10 August 2021',
    isSelect: false,
    images: [
      "assets/images/mount1.jpg",
      "assets/images/sea1.jpg",
      "assets/images/mount2.jpg",
      "assets/images/sea2.jpeg",
      "assets/images/sea3.jpeg",
    ],
  ),
  Chat(
    name: "Amy Howard",
    lastMessage: "Hello Ali!",
    image: "assets/images/user4.jpg",
    time: "8m ago",
    isActive: false,
    isSeen: true,
    msgTotal: 3,
    status: 'Hey there! I am using WhatsApp.',
    number: '+92 336 2198909',
    joinDate: '19 May 2021',
    isSelect: false,
    images: [
      "assets/images/mount1.jpg",
      "assets/images/sea1.jpg",
      "assets/images/mount2.jpg",
      "assets/images/sea2.jpeg",
      "assets/images/sea3.jpeg",
    ],
  ),
  Chat(
    name: "Edward Rayen",
    lastMessage: "Do you have update about the project?",
    image: "assets/images/user2.jpg",
    time: "5d ago",
    isActive: true,
    isSeen: false,
    msgTotal: 0,
    status: 'In a meeting',
    number: '+92 332 2198707',
    joinDate: '22 March 2021',
    isSelect: false,
    images: [
      "assets/images/mount1.jpg",
      "assets/images/sea1.jpg",
      "assets/images/mount2.jpg",
      "assets/images/sea2.jpeg",
      "assets/images/sea3.jpeg",
    ],
  ),
  Chat(
    name: "Jacob Jones",
    lastMessage: "You’re welcome :)",
    image: "assets/images/user3.jpg",
    time: "5d ago",
    isActive: false,
    isSeen: true,
    msgTotal: 2,
    status: 'Urgent calls only.',
    number: '+92 334 3243127',
    joinDate: '22 October 2021',
    isSelect: false,
    images: [
      "assets/images/mount1.jpg",
      "assets/images/sea1.jpg",
      "assets/images/mount2.jpg",
      "assets/images/sea2.jpeg",
      "assets/images/sea3.jpeg",
    ],
  ),
  Chat(
    name: "Albert Flores",
    lastMessage: "Thanks",
    image: "assets/images/user5.jpg",
    time: "6d ago",
    isActive: false,
    isSeen: true,
    msgTotal: 1,
    status: 'Available',
    number: '+92 332 2138913',
    joinDate: '19 September 2021',
    isSelect: false,
    images: [
      "assets/images/mount1.jpg",
      "assets/images/sea1.jpg",
      "assets/images/mount2.jpg",
      "assets/images/sea2.jpeg",
      "assets/images/sea3.jpeg",
    ],
  ),
  Chat(
    name: "Olivia Koben",
    lastMessage: "Kindly let me know when you are free.",
    image: "assets/images/user6.jpg",
    time: "3m ago",
    isActive: false,
    isSeen: true,
    msgTotal: 0,
    status: 'Busy',
    number: '+92 331 1298213',
    joinDate: '11 December 2021',
    isSelect: false,
    images: [
      "assets/images/mount1.jpg",
      "assets/images/sea1.jpg",
      "assets/images/mount2.jpg",
      "assets/images/sea2.jpeg",
      "assets/images/sea3.jpeg",
    ],
  ),
  Chat(
    name: "Diana Warner",
    lastMessage: "Hello! Ali here.",
    image: "assets/images/user7.jpg",
    time: "8m ago",
    isActive: true,
    isSeen: false,
    msgTotal: 0,
    status: 'Away',
    number: '+92 331 2198312',
    joinDate: '25 January 2021',
    isSelect: false,
    images: [
      "assets/images/mount1.jpg",
      "assets/images/sea1.jpg",
      "assets/images/mount2.jpg",
      "assets/images/sea2.jpeg",
      "assets/images/sea3.jpeg",
    ],
  ),
  Chat(
    name: "Tim Scouter",
    lastMessage: "Do remind me about the meeting.",
    image: "assets/images/user8.jpg",
    time: "5d ago",
    isActive: false,
    isSeen: true,
    msgTotal: 1,
    status: 'Hey there! I am using WhatsApp.',
    number: '+92 335 9918125',
    joinDate: '12 April 2021',
    isSelect: false,
    images: [
      "assets/images/mount1.jpg",
      "assets/images/sea1.jpg",
      "assets/images/mount2.jpg",
      "assets/images/sea2.jpeg",
      "assets/images/sea3.jpeg",
    ],
  ),
  Chat(
    name: "Emmaly Jane",
    lastMessage: "Yeah! That will work.",
    image: "assets/images/user9.jpg",
    time: "3d ago",
    isActive: false,
    isSeen: true,
    msgTotal: 2,
    status: 'Available.',
    number: '+92 335 9914315',
    joinDate: '04 April 2021',
    isSelect: false,
    images: [
      "assets/images/mount1.jpg",
      "assets/images/sea1.jpg",
      "assets/images/mount2.jpg",
      "assets/images/sea2.jpeg",
      "assets/images/sea3.jpeg",
    ],
  ),
];
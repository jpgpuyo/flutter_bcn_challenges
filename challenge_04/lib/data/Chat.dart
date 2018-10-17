class Chat {
  final userAvatarUrl;
  final userName;
  final lastMessage;
  final time;
  int unreadMessages;

  Chat({
    this.userAvatarUrl,
    this.userName,
    this.lastMessage,
    this.time,
    this.unreadMessages,
  });
}

List globalChatList = [
  Chat(
    userAvatarUrl: "https://randomuser.me/api/portraits/thumb/men/1.jpg",
    userName: "Dennis Peterson",
    lastMessage: "Okay, I'll call you later!",
    time: "08:24",
    unreadMessages: 3,
  ),
  Chat(
    userAvatarUrl: "https://randomuser.me/api/portraits/thumb/women/2.jpg",
    userName: "Victoria Delgado",
    lastMessage: "What do you think about it?",
    time: "16:08",
    unreadMessages: 0,
  ),
  Chat(
    userAvatarUrl: "https://randomuser.me/api/portraits/thumb/men/3.jpg",
    userName: "Ryan Robinson",
    lastMessage: "Hello, okay.",
    time: "12:56",
    unreadMessages: 1,
  ),
  Chat(
    userAvatarUrl: "https://randomuser.me/api/portraits/thumb/men/4.jpg",
    userName: "Kiril Vovk ",
    lastMessage: "I'll write you later, I'm busy.",
    time: "22:04",
    unreadMessages: 1,
  ),
  Chat(
    userAvatarUrl: "https://randomuser.me/api/portraits/thumb/men/5.jpg",
    userName: "Jonny Coleman",
    lastMessage: "Do you think that's true?",
    time: "00:16",
    unreadMessages: 0,
  ),
  Chat(
    userAvatarUrl: "https://randomuser.me/api/portraits/thumb/women/6.jpg",
    userName: "Diana Davis",
    lastMessage:
        "Yes, I like it) Where did you buy these  shoes, I want the same",
    time: "Tue",
    unreadMessages: 0,
  ),
  Chat(
    userAvatarUrl: "https://randomuser.me/api/portraits/thumb/women/7.jpg",
    userName: "Sarah Bisop",
    lastMessage: "OK!",
    time: "Mon",
    unreadMessages: 0,
  ),
  Chat(
    userAvatarUrl: "https://randomuser.me/api/portraits/thumb/men/8.jpg",
    userName: "Michael Morrison",
    lastMessage: "Thank you very much!",
    time: "Mon",
    unreadMessages: 0,
  ),
];

import 'package:challenge_04/ui/ChatListPage.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Chats',
      home: new ChatPage(title: 'Chats'),
    );
  }
}

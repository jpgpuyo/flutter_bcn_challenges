import 'package:challenge_04/data/Chat.dart';
import 'package:challenge_04/styles/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ChatPageState createState() => new _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.photo_camera),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.conversation_bubble),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            title: Text(''),
          )
        ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                  builder: (context) =>
                      NotAvailableTab(icon: CupertinoIcons.home),
                  defaultTitle: "Home");
              break;
            case 1:
              return CupertinoTabView(
                  builder: (context) =>
                      NotAvailableTab(icon: CupertinoIcons.phone),
                  defaultTitle: "Recent calls");
              break;
            case 2:
              return CupertinoTabView(
                  builder: (context) =>
                      NotAvailableTab(icon: CupertinoIcons.photo_camera),
                  defaultTitle: "Camera");
              break;
            case 3:
              return CupertinoTabView(
                  builder: (context) =>
                      CupertinoChatListTab(chatList: globalChatList),
                  defaultTitle: "Chats");
              break;
            case 4:
              return CupertinoTabView(
                  builder: (context) =>
                      NotAvailableTab(icon: CupertinoIcons.settings),
                  defaultTitle: "Settings");
              break;
          }
        });
  }
}

class NotAvailableTab extends StatelessWidget {
  final IconData icon;

  NotAvailableTab({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.colorBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: Style.dummyTabIconSize),
          Text(
            "Not available",
            style: Style.dummyTabMessage,
          )
        ],
      ),
    );
  }
}

class CupertinoChatListTab extends StatelessWidget {
  final chatList;

  static const _horizontalPadding = EdgeInsets.symmetric(horizontal: 8.0);

  CupertinoChatListTab({
    Key key,
    @required this.chatList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.colorBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _tabToolbar(context),
          _tabTitle(context),
          _divider(),
          _chatList(context),
        ],
      ),
    );
  }

  Widget _tabToolbar(context) {
    return Container(
      /*TODO: I would like to put the same padding that in the other elements, but:
       - System toolbar is over the tabToolbar
       - Fonts from different sizes have different paddings 
       */
      padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 8.0),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Edit", style: Style.tabOption),
          Icon(CupertinoIcons.create, color: Style.colorAccent),
        ],
      ),
    );
  }

  Widget _tabTitle(context) {
    return Container(
      padding: _horizontalPadding,
      width: double.infinity,
      child: Text(
        "Chats",
        style: Theme.of(context).textTheme.display1.copyWith(
              color: Style.colorHeadLines,
            ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      color: Style.colorBorders,
      width: double.infinity,
      height: 1.0,
    );
  }

  Widget _chatList(BuildContext context) {
    return Flexible(
      child: Container(
        padding: _horizontalPadding,
        child: ListView.builder(
          padding: EdgeInsets.all(0.0),
          itemCount: this.chatList.length,
          itemBuilder: (context, index) {
            return new ChatWidget(
              chat: chatList[index],
            );
          },
          shrinkWrap: true,
        ),
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  final Chat chat;

  var _chatHeight = 72.0;
  var _userAvatarWidth = 60.0;
  var _dividerWidth = 300.0;
  var _lastMessageWidth = 260.0;

  ChatWidget({Key key, @required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this._chatHeight,
        padding: EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _userAvatar(),
            _chatMainContent(context),
          ],
        ));
  }

  Widget _userAvatar() {
    return Container(
      width: this._userAvatarWidth,
      alignment: Alignment.topCenter,
      child: CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage(chat.userAvatarUrl),
      ),
    );
  }

  Widget _chatMainContent(context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 8.0),
        child: Stack(
          children: <Widget>[
            Positioned(top: 0.0, left: 0.0, child: _userName()),
            Positioned(top: 16.0, left: 0.0, child: _lastMessage()),
            Positioned(top: 0.0, right: 8.0, child: _time()),
            Positioned(bottom: 16.0, right: 8.0, child: _numberOfNewMessages()),
            Positioned(bottom: 0.0, left: 0.0, child: _divider(context))
          ],
        ),
      ),
    );
  }

  Widget _userName() {
    return Text(chat.userName, style: Style.chatHeadline);
  }

  Widget _lastMessage() {
    return Container(
        margin: EdgeInsets.only(top: 5.0),
        width: this._lastMessageWidth,
        child: Text(
          chat.lastMessage,
          maxLines: 3,
          style: Style.chatSubhead,
        ));
  }

  Widget _time() {
    return Text(chat.time, style: Style.chatTime);
  }

  Widget _numberOfNewMessages() {
    if (chat.unreadMessages > 0) {
      return Container(
          child: CircleAvatar(
              backgroundColor: Style.colorAccent,
              radius: 8.0,
              child: Text(chat.unreadMessages.toString(),
                  style: Style.chatUnreadMessages)));
    } else {
      return Container();
    }
  }

  Widget _divider(context) {
    return Container(
      color: Style.colorBorders,
      width: this._dividerWidth,
      height: 1.0,
    );
  }
}

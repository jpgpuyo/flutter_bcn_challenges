import 'package:flutter/material.dart';

import 'strings.dart';
import 'styles.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Strings.appName,
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new CrowdfounderPage(title: Strings.appName),
    );
  }
}

class CrowdfounderPage extends StatefulWidget {
  CrowdfounderPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CrowdFounderPageState createState() => new _CrowdFounderPageState();
}

class _CrowdFounderPageState extends State<CrowdfounderPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new Toolbar(),
      body: ListView(
        children: <Widget>[
          _header(context),
          _mainContent(context),
          _fundingInformation(context),
          _backProjectButton(context),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return new SizedBox(
      height: 230.0,
      child: Stack(children: <Widget>[
        _projectImage(context),
        _category(context),
        _author(context)
      ]),
    );
  }

  Widget _mainContent(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: new Column(
        children: <Widget>[
          _projectName(context),
          _projectDescription(context),
          _readMore(context),
        ],
      ),
    );
  }

  Widget _fundingInformation(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          _fundingProgress(context),
          _fundingItems(context),
        ],
      ),
    );
  }

  Widget _backProjectButton(BuildContext context) => new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(horizontal: 64.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text(Strings.backProject, style: Styles.backProjectButton),
              color: Colors.orange),
        ],
      );

  Widget _projectImage(BuildContext context) =>
      Image.asset('assets/street_fighter.jpg');

  Widget _category(BuildContext context) => new Positioned(
        left: 16.0,
        bottom: 0.0,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.videogame_asset,
              size: 20.0,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(Strings.category, style: Styles.category),
            ),
          ],
        ),
      );

  Widget _author(BuildContext context) => Positioned(
        right: 48.0,
        bottom: 0.0,
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: ExactAssetImage('assets/avatar.jpg'),
              ),
              backgroundColor: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.0),
              child: Text(Strings.author, style: Styles.author),
            ),
          ],
        ),
      );

  Widget _projectName(BuildContext context) => Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Text(Strings.projectName, style: Styles.projectName));

  Widget _projectDescription(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 16.0),
        child:
            Text(Strings.projectDescription, style: Styles.projectDescription),
      );

  Widget _readMore(BuildContext context) => Row(
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(Strings.readMore, style: Styles.readMore),
            onPressed: () {},
          ),
        ],
      );

  Widget _fundingProgress(BuildContext context) => Container(
        child: LinearProgressIndicator(
          backgroundColor: Colors.grey.shade400,
          value: 0.65,
        ),
      );

  Widget _fundingItems(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: <Widget>[
            _fundingInfoItem(
                context, Strings.fundsAchieved, Strings.fundsNeeded),
            _fundingInfoItem(context, '300', Strings.backers),
            _fundingInfoItem(context, '30', Strings.daysToGo),
          ],
        ),
      );

  Widget _fundingInfoItem(
          BuildContext context, String topText, String bottomText) =>
      Expanded(
        child: Column(
          children: <Widget>[
            Text(topText, style: Styles.fundingItemHighlight),
            Text(
              bottomText,
            ),
          ],
        ),
      );
}

class Toolbar extends AppBar {
  Toolbar()
      : super(
            title: new Text(Strings.appName),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ));
}

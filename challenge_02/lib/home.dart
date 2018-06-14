import 'package:flutter/material.dart';

import 'data.dart';
import 'detail.dart';
import 'widgets.dart';

/**
 * To generate images: https://placem.at/?ref=producthunt
 * For instance: https://placem.at/places?random=1&w=300&h=195&txt=0
 */
class HomePage extends StatelessWidget {
  const HomePage();

  static const tabItems = [
    Tab(text: "SCENIC"),
    Tab(text: "RESTAURANT"),
    Tab(text: "GROGSHOP")
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabItems.length,
        child: Scaffold(
            appBar: toolbar(),
            body: TabBarView(
              children: [
                scenesList(),
                scenesList(),
                scenesList(),
              ],
            )));
  }

  Widget toolbar() {
    const actionMenuItems = [
      PopupMenuItem(value: 'Settings', child: Text('Settings'))
    ];

    return AppBar(
        title: Text("Travel"),
        actions: [
          PopupMenuButton(
              itemBuilder: (BuildContext context) => actionMenuItems)
        ],
        bottom: TabBar(tabs: tabItems));
  }

  Widget scenesList() => new ListView.builder(
      itemCount: kScenes.length,
      itemBuilder: (BuildContext context, int index) =>
          SceneItem(kScenes[index]));
}

class SceneItem extends StatelessWidget {
  final Scene scene;

  static const colorTransparentOrange = Color(0xE6F4B30F);

  SceneItem(this.scene);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => Navigator.of(context).push(new PageRouteBuilder(
            pageBuilder: (_, __, ___) => new DetailPage(scene),
          )),
      child: new Container(
        padding: EdgeInsets.all(8.0),
        height: 200.0,
        child: new Stack(
          children: [sceneImage(), sceneTitle()],
        ),
      ),
    );
  }

  Widget sceneImage() {
    return Container(
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
        child: SceneImage(scene: this.scene));
  }

  Widget sceneTitle() {
    return SceneTitle(
        scene: this.scene,
        color: colorTransparentOrange,
        width: 188.0);
  }
}

import 'package:flutter/material.dart';

import 'data.dart';
import 'widgets.dart';

/**
 * To generate images: https://placem.at/?ref=producthunt
 * For instance: https://placem.at/places?random=1&w=300&h=195&txt=0
 */
class DetailPage extends StatelessWidget {
  final Scene scene;

  DetailPage(this.scene);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new ListView(
      children: [header(), mainContent()],
    ));
  }

  Widget header() {
    return SceneImage(scene: this.scene);
  }

  Widget mainContent() {
    return Container(
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0, bottom: 32.0),
        child: Column(children: [topCard(), bottomCard()]));
  }

  Widget topCard() {
    return new Container(
        height: 145.0,
        child: Card(
            child: Row(children: <Widget>[
          SceneAreaPopulation(scene: this.scene),
          SceneTitle(scene: this.scene, color: Colors.orange),
        ])));
  }

  Widget bottomCard() {
    return Container(
        height: 145.0,
        child: Card(
            child: Row(children: <Widget>[
          SceneDescription(scene: this.scene),
        ])));
  }
}

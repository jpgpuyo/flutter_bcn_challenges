import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'data.dart';
import 'styles.dart';

class SceneImage extends StatelessWidget {
  SceneImage({Key key, @required this.scene}) : super(key: key);

  final Scene scene;

  @override
  Widget build(BuildContext context) {
    return new Row(children: [
      new Expanded(
          child: new Hero(
              tag: 'scene-${scene.image}',
              child: new Image.asset(scene.image, fit: BoxFit.fill)))
    ]);
  }
}

class SceneTitle extends StatelessWidget {
  SceneTitle(
      {Key key,
      @required this.scene,
      @required this.color,
      @required this.width,
      @required this.height})
      : super(key: key);

  final Scene scene;
  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return new Hero(
      tag: 'scene-${scene.shortDescription}',
      child: Container(
          width: width,
          height: height,
          decoration: new BoxDecoration(color: color),
          padding: new EdgeInsets.only(left: 16.0, right: 16.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(scene.shortDescription, style: Style.titleBox),
              Text(scene.cityName, style: Style.subtitleBox)
            ],
          )),
    );
  }
}

class SceneAreaPopulation extends StatelessWidget {
  SceneAreaPopulation({Key key, @required this.scene}) : super(key: key);

  final Scene scene;

  final formatNumber = new NumberFormat("###.0#");

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.only(left: 35.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(formatNumber.format(scene.area), style: Style.number),
          Text("Area"),
          Text(formatNumber.format(scene.population), style: Style.number),
          Text("Populace")
        ],
      ),
    ));
  }
}

class SceneDescription extends StatelessWidget {
  SceneDescription({Key key, @required this.scene}) : super(key: key);

  final Scene scene;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.only(left: 15.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(scene.shortDescription, style: Style.titleCard),
          Text(scene.cityName, style: Style.subTitleCard),
          Container(height: 20.0),
          Text(scene.longDescription),
        ],
      ),
    ));
  }
}

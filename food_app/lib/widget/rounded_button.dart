import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class RoundedButton extends StatelessWidget {
  String url;

  RoundedButton(this.url);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
      RaisedButton.icon(
      shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),
      side: BorderSide(
        color: Color(0xEAFFE1E1),
      ),
    ),
    color: Color(0xEAFFE1E1),
    onPressed: () {
        _launchURL(url);


    },
    icon: Icon(
    Icons.play_circle_filled,
    color: Colors.red,
    ),
    label: Text('YouTube'))]));
  }
  _launchURL(String url) async {
    //launch(url);
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

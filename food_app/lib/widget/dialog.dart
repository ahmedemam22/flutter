import 'package:flutter/material.dart';
import 'package:foodapp/utilits/color.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class Dialoge{
void buildDialog(BuildContext context, String name, String desc) {
Alert(
context: context,
style: AlertStyle(
animationType: AnimationType.fromRight,
isCloseButton: true,
isOverlayTapDismiss: true,
descStyle: TextStyle(fontSize: 15),
animationDuration: Duration(milliseconds: 400),
alertBorder: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10),
side: BorderSide(
color: PrimaryDarkColor,
),
),
titleStyle: TextStyle(
fontSize: 18,
color: Colors.grey[700],
),
//backgroundColor: PrimaryLightColor
),
type: AlertType.none,
title: name,
desc: desc,
).show();
}
}
import 'package:flutter/material.dart';
class FadeImage extends StatelessWidget {
  final image;
  FadeImage(this.image);
  @override
  Widget build(BuildContext context) {
    return    FadeInImage.assetNetwork(
      placeholder: 'assets/images/loading1.gif',
      image: image,
    );
  }
}

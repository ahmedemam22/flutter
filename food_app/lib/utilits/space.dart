import 'package:flutter/cupertino.dart';

class Space{
  BuildContext context;
  Space(this.context);
  double get height{
    return MediaQuery.of(context).size.height;

  }
  double get width{
    return MediaQuery.of(context).size.width;

  }
}
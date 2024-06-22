import 'package:flutter/cupertino.dart';

class CarousalWidget extends StatelessWidget {
  final String url;
   CarousalWidget ({Key? key,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}

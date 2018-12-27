import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/NewsSection/NewsPage.dart';

class NewsAnimatedContainer extends StatefulWidget {
  const NewsAnimatedContainer({Key key, this.child}) : super(key: key);

  @override
  _NewsAnimatedContainerState createState() => _NewsAnimatedContainerState();

  final Widget child;
}

class _NewsAnimatedContainerState extends State<NewsAnimatedContainer>  with SingleTickerProviderStateMixin {
  AnimationController _controller;


  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds:5000));
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NewsPage(controller: _controller,);
  }
}
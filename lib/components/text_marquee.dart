import 'package:flutter/cupertino.dart';
import 'package:nardis/utils/marquee_widget.dart';

class TextMarquee extends StatelessWidget
{

  Widget child;
  TextMarquee(this.child);

  @override
  Widget build(BuildContext context) {
    return  Marquee(animationDuration: Duration(seconds: 20) ,
                  backDuration: Duration(milliseconds: 10000),
                  direction: Axis.horizontal,
                  textDirection: TextDirection.rtl,
                  pauseDuration: Duration(seconds: 3),
                    child: child,
                  );
  }
  
}
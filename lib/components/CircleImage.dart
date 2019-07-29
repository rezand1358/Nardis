import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:nardis/components/no_image.dart';
import 'package:nardis/translation_strings.dart';

class CircleImage extends StatelessWidget
{
  final String imageUrl;
  final ImageProvider imageProvider;
  final double width;
  final double height;
  final double radius;
  const CircleImage({Key key, this.imageUrl, this.width, this.height,this.radius =50.0, this.imageProvider}) : super(key: key);

Widget showImage()
{
 return Container (
    height: this.width,
    width : this.height,
    margin: const EdgeInsets.only(top:0.0, left: 0.0, right:0.0),
decoration: BoxDecoration(                    
    border: Border.all(width: 0.5,color: Colors.white),
    borderRadius: new BorderRadius.all(new Radius.circular(this.radius))//new BorderRadius.only( topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0) ),
    ),
    child: TransitionToImage(
      borderRadius: new BorderRadius.all(new Radius.circular(this.radius)),
      width: this.width,
      height: this.height,

      image:
        AdvancedNetworkImage(imageUrl ?? NoImageAvatar(),
        fallbackAssetImage:  'assets/images/no_image_available.jpg',
        loadFailedCallback: () {
            NoImageAvatar();
        },
        loadingProgress: (double p,List<int> i) => Text(p.toString()), cacheRule: CacheRule(maxAge: const Duration(days: 7)), 
        timeoutDuration: Duration(seconds: 1), useDiskCache: true,
    
  ),
    // placeholder: CircularProgressIndicator(),
    
    duration: Duration(milliseconds: 300),
    fit: BoxFit.cover,
    loadingWidget: const CircularProgressIndicator(),
    placeholder: const Icon(Icons.refresh),
    enableRefresh: true,   
    loadingWidgetBuilder: (
            BuildContext context,
            double progress,
            Uint8List imageData,
          ) {
            // print(imageData.lengthInBytes);
            return Container(
              width: this.width,
              height: this.height,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                value: progress == 0.0 ? null : progress,
              ),
            );
          },
                       
    ),
    
  );


  // Container(
  //   width: double.infinity,
  //   margin: const EdgeInsets.only(bottom:20.0, left: 20.0, right:20.0),
  //   padding: const EdgeInsets.all(10.0),
  //   decoration: new BoxDecoration(
  //   color: Colors.black,
  //   borderRadius: new BorderRadius.only( bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)  ),
  //   boxShadow: <BoxShadow>[
  //       BoxShadow(
  //       color: Colors.black,
  //       offset: Offset(0.0, -12.0),
  //       blurRadius: 20.0,
  //       ),
  //   ],
  //   ),

  //   // alignment: TextAlign.left,
  //   child: new Text( getTitle(context, i), style: TextStyle( color: Colors.white, fontSize: 30.0,fontWeight: FontWeight.normal) ),
  // ),
 }
  @override
  Widget build(BuildContext context) {
   
   return showImage();

  }
}
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nardis/bloc/values/notify_value.dart';
import 'package:nardis/bloc/widget_events/ButtonDefinition.dart';
import 'package:nardis/components/BorderedButton.dart';
import 'package:nardis/components/image_picker_handler.dart';
//import 'package:nardis/components/image_picker_handler.dart';
import 'package:nardis/constants/constants.dart';

import 'package:nardis/models/viewmodels/imagefile_model.dart';
import 'package:nardis/models/viewmodels/upload_image_vm.dart';
import 'package:nardis/translation_strings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';





class UploadImage extends StatefulWidget {
  UploadImage({Key key, this.title,this.type,this.noty,this.forWhich,this.model}) : super(key: key);

  UploadImageModel model;
  final String title;
  final int type;
  final String forWhich;
  NotyBloc<UploadedImageFile> noty;
  @override
  _UploadImagePageState createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImage> with
    TickerProviderStateMixin,
    ImagePickerListener {
  File _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;
  VideoPlayerController _controller;
  String _retrieveDataError;

  File _image;
  AnimationController _animationController;
  ImagePickerHandler imagePicker;

  void _onImageButtonPressed(ImageSource source) async {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.removeListener(_onVideoControllerUpdate);
    }
    if (isVideo) {
      ImagePicker.pickVideo(source: source).then((File file) {
        if (file != null && mounted) {
          setState(() {
            _controller = VideoPlayerController.file(file)
              ..addListener(_onVideoControllerUpdate)
              ..setVolume(1.0)
              ..initialize()
              ..setLooping(true)
              ..play();

            widget.model.valueNotyImageBloc.updateValue(new UploadedImageFile(file: file,type: widget.model.forWhich));
          });
        }
      });
    } else {
      try {

         ImagePicker.pickImage(source: source).then((File file) {
           if(file!=null) {
             _imageFile = file;
             widget.model.valueNotyImageBloc.updateValue(new UploadedImageFile(file: _imageFile, type: widget.model.forWhich));
             setState(() {});
           }
         }
         );

      } catch (e) {
        _pickImageError = e;
      }

    }
  }

  void _onVideoControllerUpdate() {
    setState(() {});
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.removeListener(_onVideoControllerUpdate);
    }
    super.deactivate();
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller.dispose();
    }

    _animationController.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    imagePicker=new ImagePickerHandler(this,_animationController);
    imagePicker.init();
  }

  Widget _previewVideo(VideoPlayerController controller) {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (controller == null) {
      return  Text(
        Translations.current.notYetPickVideo(),
        textAlign: TextAlign.center,
      );
    } else if (controller.value.initialized) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: AspectRatioVideo(controller),
      );
    } else {
      return  Text(
        Translations.current.errorLoadingVideo(),
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      return Image.file(_imageFile);
    } else if (_pickImageError != null) {
      return Text(
        Translations.current.pickImageError() + ' $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return  Text(
        Translations.current.notYetPickImage(),
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await ImagePicker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        if (response.type == RetrieveType.video) {
          isVideo = true;
          _controller = VideoPlayerController.file(response.file)
            ..addListener(_onVideoControllerUpdate)
            ..setVolume(1.0)
            ..initialize()
            ..setLooping(true)
            ..play();
        } else {
          isVideo = false;
          _imageFile = response.file;
        }
      });
    } else {
      _retrieveDataError = response.exception.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
        Container(
          height: MediaQuery.of(context).size.height-10,
          margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child:
        ListView(
          children: <Widget>[
      Column (
      children: <Widget> [
      Container(
      height: 200,
          width: 250,
          margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child:
      /* Center(
        child:*/ Platform.isAndroid
            ? FutureBuilder<void>(
          future: retrieveLostData(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return  Text(
                  Translations.current.notYetPickImage(),
                  textAlign: TextAlign.center,
                );
              case ConnectionState.done:
                return isVideo
                    ? _previewVideo(_controller)
                    : _previewImage();
              default:
                if (snapshot.hasError) {
                  return Text(
                    Translations.current.errorPickImageVideo() +' ${snapshot.error}}',
                    textAlign: TextAlign.center,
                  );
                } else {
                   Text(
                    Translations.current.notYetPickImage(),
                    textAlign: TextAlign.center,
                  );
                }
            }
            return  Text(
              Translations.current.notYetPickImage(),
              textAlign: TextAlign.center,
            );
          },
        )
            : (isVideo ? _previewVideo(_controller) : _previewImage()),
      //),
      ),

 Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          BorderedButton(MediaQuery.of(context).size.width-100,48.0,30.0,10.0,"انتخاب تصویر",_onPressed,onSelected( new ButtonDefinition(message: "",selectedId: -1,selectedTitle: "",taskId: -1))),
          // Padding(
          //   padding: const EdgeInsets.only(top: 16.0),
          //   child: FloatingActionButton(
          //     onPressed: () {
          //       isVideo = false;
          //       _onImageButtonPressed(ImageSource.camera);
          //     },
          //     heroTag: 'image1',
          //     tooltip: Translations.current.takePhoto(),
          //     child: const Icon(Icons.camera_alt),
          //   ),
          // ),
          BorderedButton(MediaQuery.of(context).size.width-100,48.0,30.0,10.0,"دوربین",_onPressed,onSelected( new ButtonDefinition(message: "",selectedId: -1,selectedTitle: "",taskId: -1))),

          // Padding(
          //   padding: const EdgeInsets.only(top: 16.0),
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.red,
          //     onPressed: () {
          //       isVideo = true;
          //       _onImageButtonPressed(ImageSource.gallery);
          //     },
          //     heroTag: 'video0',
          //     tooltip: Translations.current.pickVideofromGallery(),
          //     child: const Icon(Icons.video_library),
          //   ),
          // ),
          BorderedButton(MediaQuery.of(context).size.width-100,48.0,30.0,10.0,"گالری",_onPressed,onSelected( new ButtonDefinition(message: "",selectedId: -1,selectedTitle: "",taskId: -1))),
          // Padding(
          //   padding: const EdgeInsets.only(top: 16.0),
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.red,
          //     onPressed: () {
          //       isVideo = true;
          //       _onImageButtonPressed(ImageSource.camera);
          //     },
          //     heroTag: 'video1',
          //     tooltip: Translations.current.takeVideo(),
          //     child: const Icon(Icons.videocam),
          //   ),
          // ),
          BorderedButton(MediaQuery.of(context).size.width-100,48.0,30.0,10.0,"دوربین",_onPressed,onSelected( new ButtonDefinition(message: "",selectedId: -1,selectedTitle: "",taskId: -1))),
          new BorderedButton(MediaQuery.of(context).size.width-100, 48.0,30.0,10.0, "تایید", _onConfirm, null)
        ],
      ),
      ],
      ),
          ],
      ),
        ),
    );
  }

onSelected(ButtonDefinition btnDefinition)
  {
    // setState(() {
      
    // });
  }

  _onConfirm()
  {
    Navigator.pop(context);
  }
  _onPressed()
  {


    if(widget.model.type==AppConstants.IMAGE_FROM_GALLERY_TYPE){
     isVideo = false;
      //        _onImageButtonPressed(ImageSource.gallery);
     imagePicker.showDialog(context);
    }
    if(widget.model.type==AppConstants.IMAGE_FROM_CAMERA_TYPE)
    {
      isVideo = false;
                 _onImageButtonPressed(ImageSource.camera);
    }
    if(widget.model.type==AppConstants.VIDEO_FROM_GALLERY_TYPE)
    {
       isVideo = true;
                _onImageButtonPressed(ImageSource.gallery);
    }
    if(widget.model.type==AppConstants.VIDEO_FROM_CAMERA_TYPE)
    {
      isVideo = true;
      _onImageButtonPressed(ImageSource.camera);
    }
  }
  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  @override
  userImage(File _image) {
    if(_image!=null)
      {
        widget.model.valueNotyImageBloc.updateValue(new UploadedImageFile(file: _image,type: widget.model.forWhich));
      }
    setState(() {
      this._image = _image;
      this._imageFile=_image;
    });

  }
}

class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final VideoPlayerController controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller.value.initialized) {
      initialized = controller.value.initialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    controller.addListener(_onVideoControllerUpdate);
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller.value?.aspectRatio,
          child: VideoPlayer(controller),
        ),
      );
    } else {
      return Container();
    }
  }
}
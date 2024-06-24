import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CustomAppBar extends StatefulWidget {
  final int selectedItemIndex;

  CustomAppBar({required this.selectedItemIndex});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

bool toggle = true;

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2), // Padding on all sides
      margin: EdgeInsets.all(8), // Margin on all sides
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30), // Rounded sides
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.5), // Transparent
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                    context, Icons.home_outlined, Icons.home_filled, 0),
                _buildNavItem(
                    context, Icons.explore_outlined, Icons.explore_rounded, 1),
                SizedBox(width: 48), // Same width as the FAB
                _buildNavItem(context, Icons.favorite_outline_rounded,
                    Icons.favorite_rounded, 2),
                _buildNavItem(context, Icons.person_outline_rounded,
                    Icons.person_rounded, 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, IconData icon, IconData iconfilled, int index) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(widget.selectedItemIndex == index ? iconfilled : icon,
              color: widget.selectedItemIndex == index
                  ? AppColor.pink
                  : Colors.white),
          onPressed: () {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/home');

                break;
              case 1:
                Navigator.pushNamed(context, '/discover');
                break;
              case 2:
                Navigator.pushNamed(context, '/favorites');
                break;
              case 3:
                Navigator.pushNamed(context, '/profile');
                break;
            }
          },
        ),
        Positioned(
          bottom: -5,
          left: 0,
          right: 0,
          child: Visibility(
            visible: widget.selectedItemIndex == index,
            child: Container(
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.pink,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomFloatingActionButton extends StatefulWidget {
  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  late Animation _animation;


  Alignment alignment1 = Alignment.bottomCenter;
  Alignment alignment2 = Alignment.bottomCenter;

 Uint8List? _image;
  File? selectedIMage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
      reverseDuration: Duration(milliseconds: 270),
    );

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    _controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: [
            AnimatedAlign(
              duration: toggle
                  ? Duration(milliseconds: 275)
                  : Duration(milliseconds: 875),
              alignment: alignment1,
              curve: toggle ? Curves.easeIn : Curves.elasticOut,
              child: GestureDetector(
                onTap: () async {
                  print("Gallery Clicked");
                 _pickImageFromGallery();
                },
                child: AnimatedContainer(
                  duration: toggle
                      ? Duration(milliseconds: 275)
                      : Duration(milliseconds: 875),
                  curve: toggle ? Curves.easeIn : Curves.easeOut,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColor.dark_1,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    Icons.image_outlined,
                    color: AppColor.light,
                  ),
                ),
              ),
            ),
            AnimatedAlign(
              duration: toggle
                  ? Duration(milliseconds: 275)
                  : Duration(milliseconds: 875),
              alignment: alignment2,
              curve: toggle ? Curves.easeIn : Curves.elasticOut,
              child: GestureDetector(
                onTap: () async {
                  print("Camera Clicked");
               
                  _pickImageFromCamera();

              
                },
                child: AnimatedContainer(
                  duration: toggle
                      ? Duration(milliseconds: 275)
                      : Duration(milliseconds: 875),
                  curve: toggle ? Curves.easeIn : Curves.easeOut,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColor.dark_1,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    Icons.photo_camera_outlined,
                    color: AppColor.light,
                  ),
                ),
              ),
            ),
            Transform.rotate(
              angle: _animation.value * (3 / 4),
              origin: Offset(
                  0.0, 76.0), // Half the width of the FloatingActionButton
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  curve: Curves.easeOut,
                  duration: Duration(milliseconds: 300),
                  height: toggle ? 56 : 50,
                  width: toggle ? 56 : 50,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        if (toggle) {
                          toggle = !toggle;
                          _controller!.forward();
                          Future.delayed(Duration(milliseconds: 10), () {
                            alignment1 = Alignment(-0.4, -0.01);
                          });
                          Future.delayed(Duration(milliseconds: 10), () {
                            alignment2 = Alignment(0.4, -0.01);
                          });
                        } else {
                          toggle = !toggle;
                          _controller!.reverse();
                          alignment1 = Alignment.bottomCenter;
                          alignment2 = Alignment.bottomCenter;
                        }
                      });
                    },
                    child: Icon(
                      Icons.add,
                      color: toggle ? AppColor.dark_1 : AppColor.light,
                    ),
                    backgroundColor: toggle ? AppColor.pink : AppColor.dark_1,
                    shape: CircleBorder(), // Round shape
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 
  Future _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;

    // Crop the selected image
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: pickedImage.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
uiSettings: [AndroidUiSettings(
        cropStyle: CropStyle.rectangle, // Use rectangle crop style

  hideBottomControls: true,
toolbarWidgetColor: AppColor.pink,
toolbarColor: AppColor.dark_2,
toolbarTitle: "Crop Image",
showCropGrid: false,
backgroundColor: AppColor.dark_1,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: true,),
          IOSUiSettings(
                    minimumAspectRatio: 1.0, // Set minimum aspect ratio for iOS
            title: 'Cropper',
          ),],
      
      
    );

    if (croppedImage == null) return;

    setState(() {
      print("fingers crossed");
      selectedIMage = File(croppedImage.path) ;
    });

    // Navigate to EditScreen with the cropped image
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditScreen(imagepath: selectedIMage!),
      ),
    );
  }
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;

    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    // Navigator.of(context).pop();
     Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditScreen(imagepath: selectedIMage ?? File('')),
      ),
    );
  }

}

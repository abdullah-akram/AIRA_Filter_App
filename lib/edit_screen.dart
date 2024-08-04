import 'dart:io';
import 'dart:math';

import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/data/imageList.dart';
import 'package:crop_image/crop_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'edit_filters.dart';

class EditScreen extends StatefulWidget {
  final File imagepath;
  EditScreen({super.key, required this.imagepath});
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  int selectedIndex = 0; // Initially no text is selected
  Rect aspectRatioRect = Rect.fromLTWH(0, 0, 3, 4); // Default aspect ratio box

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.dark_1,
      appBar: AppBar(
        backgroundColor: AppColor.dark_1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add navigation logic here
          },
        ),
        actions: selectedIndex != 3
            ? [
                SizedBox(
                  width: 40, // Adjust the width as needed
                  child: IconButton(
                    icon: Icon(Icons.cloud_upload),
                    onPressed: () {
                      // Add upload button logic here
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: OutlinedButton(
                    onPressed: () {
                      // Add text button logic here
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(color: AppColor.light, fontSize: 11),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Make it round
                      ),
                      side: BorderSide(
                          color: AppColor.dark_3), // Add outline border color
                    ),
                  ),
                ),
              ]
            : [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.dark_2,
                        child: IconButton(
                          icon: Icon(Icons.brightness_1),
                          onPressed: () {
                            // Add first button logic here
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: AppColor.dark_2,
                        child: IconButton(
                          icon: Icon(Icons.contrast),
                          onPressed: () {
                            // Add second button logic here
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: AppColor.dark_2,
                        child: IconButton(
                          icon: Icon(Icons.crop),
                          onPressed: () {
                            // Add third button logic here
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40, // Adjust the width as needed
                  child: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      // Add check button logic here
                    },
                  ),
                ),
              ],
      ),
      body: EditScreenBody(
        imagepath: widget.imagepath,
        onIndexChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        aspectRatioRect: aspectRatioRect,
        onAspectRatioChanged: (rect) {
          setState(() {
            aspectRatioRect = rect;
          });
        },
      ),
    );
  }
}

class EditScreenBody extends StatefulWidget {
  final File imagepath;
  final ValueChanged<int> onIndexChanged;
  final ValueChanged<Rect> onAspectRatioChanged;
  int selectedIndex;
  Rect aspectRatioRect;

  EditScreenBody({
    super.key,
    required this.imagepath,
    required this.onIndexChanged,
    required this.selectedIndex,
    required this.aspectRatioRect,
    required this.onAspectRatioChanged,
  });

  @override
  State<EditScreenBody> createState() => _EditScreenBodyState();
}

class _EditScreenBodyState extends State<EditScreenBody> {
  RulerPickerController? _rulerPickerController;
  final controller = CropController(
    aspectRatio: 0.7,
    defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
  );

  File? _croppedImage;
  num currentValue = 40;
  int selectedfil = 0;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: currentValue);
  }

  @override
  Widget build(BuildContext context) {
    print("hola" + currentValue.toString());
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: FileImage(_croppedImage ?? widget.imagepath),
                fit: BoxFit.contain,
              ),
            ),
            if (widget.selectedIndex == 0 || widget.selectedIndex == 1)
              EditFilters(),
            if (widget.selectedIndex == 2 || widget.selectedIndex == 3)
              itemsRow(context, widget.selectedIndex),
            if (widget.selectedIndex == 2 || widget.selectedIndex == 3)
              itemsRowSub(widget.selectedIndex),
            Container(
              height: 40, // Adjust the height as needed
              padding: EdgeInsets.only(left: 50, right: 50),
              margin: EdgeInsets.only(top: 4),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 31, 1, 11),
                    Color.fromARGB(255, 70, 5, 39),
                    Color.fromARGB(255, 31, 1, 11),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mainEditsTexts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.onIndexChanged(index);
                        print("selected index" + index.toString());
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        mainEditsTexts[index],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: widget.selectedIndex == index
                              ? Colors.pink // Change text color if selected
                              : Colors.white, // Default text color
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        if (widget.selectedIndex == 3) _buildAspectRatioBox(),
      ],
    );
  }

  Container itemsRowSub(int selectedIndex) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationX(pi),
        child: RulerPicker(
          controller: _rulerPickerController!,
          width: 300,
          height: 80,
          onBuildRulerScaleText: (index, rulerScaleValue) {
            return "";
          },
          rulerBackgroundColor: AppColor.dark_1,
          marker: Container(
            width: 2,
            height: 30,
            color: AppColor.pink,
          ),
          scaleLineStyleList: const [
            ScaleLineStyle(color: Colors.grey, width: 1.5, height: 30, scale: 0),
            ScaleLineStyle(color: Colors.grey, width: 1, height: 15, scale: 5),
            ScaleLineStyle(color: Colors.grey, width: 1, height: 10, scale: -1)
          ],
          onValueChanged: (value) {
            setState(() {
              currentValue = value;
              print(currentValue.toString());
            });
          },
          ranges: const [
            RulerRange(begin: 0, end: 100, scale: 2),
          ],
        ),
      ),
    );
  }

  Container itemsRow(BuildContext context, int selectedIndexSub) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            selectedIndexSub == 2 ? filterItemIcons.length : filterItemTexts.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedfil = index;
                    widget.onAspectRatioChanged(_getAspectRatioRect(filterItemTexts[index]));
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: selectedfil == index
                          ? Colors.pink
                          : Color.fromARGB(0, 177, 90, 90),
                      width: 1.5,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: selectedfil == index
                        ? Color.fromARGB(255, 57, 2, 21)
                        : Colors.black,
                    radius: 25,
                    child: selectedIndexSub == 2
                        ? Icon(filterItemIcons[index])
                        : selectedIndexSub == 3
                            ? Text(
                                filterItemTexts[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Container(), // Handle other cases if necessary
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Rect _getAspectRatioRect(String aspectRatio) {
    print("aspect ratio" + aspectRatio.toString());
    switch (aspectRatio) {
      case '1:1':
        return Rect.fromLTWH(0, 0, 3, 4);
      case '3:4':
        return Rect.fromLTWH(0, 0, 3, 4);
      case '4:5':
        return Rect.fromLTWH(0, 0, 4, 5);
      case '5:4':
        return Rect.fromLTWH(0, 0, 5, 4);
      case '9:16':
        return Rect.fromLTWH(0, 0, 9, 16);
      default:
        return Rect.fromLTWH(0, 0, 1, 1);
    }
  }
Widget _buildAspectRatioBox() {
  final double imageWidth = MediaQuery.of(context).size.width * 0.8;
  final double imageHeight = MediaQuery.of(context).size.height * 0.65;

  final double aspectRatio = widget.aspectRatioRect.width / widget.aspectRatioRect.height;

  double boxWidth;
  double boxHeight;

  if (imageWidth / imageHeight > aspectRatio) {
    boxHeight = imageHeight;
    boxWidth = boxHeight * aspectRatio;
  } else {
    boxWidth = imageWidth;
    boxHeight = boxWidth / aspectRatio;
  }

  return Positioned(
    top: (MediaQuery.of(context).size.height * 0.70 - boxHeight) / 2,
    left: (MediaQuery.of(context).size.width - boxWidth) / 2,
    child: Container(
      width: boxWidth,
      height: boxHeight,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink, width: 2),
      ),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          color: Colors.transparent,
        ),
      ),
    ),
  );
}

}

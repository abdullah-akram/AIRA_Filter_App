import 'dart:io';
import 'dart:math';

import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/data/imageList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'edit_filters.dart';

class EditScreen extends StatefulWidget {
  File imagepath;
  EditScreen({super.key, required this.imagepath});
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
        actions: [
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
        ],
      ),
      body: EditScreenBody(
        imagepath: widget.imagepath,
      ),
    );
  }
}

class EditScreenBody extends StatefulWidget {
  File imagepath;

  EditScreenBody({super.key, required this.imagepath});

  @override
  State<EditScreenBody> createState() => _EditScreenBodyState();
}

class _EditScreenBodyState extends State<EditScreenBody> {
  RulerPickerController? _rulerPickerController;
  int selectedIndex = 0; // Initially no text is selected

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _rulerPickerController = RulerPickerController(value: currentValue);
  }
  late File _croppedImage;

   Future<void> _cropImage() async {
    final cropped = await ImageCropper().cropImage(
      sourcePath: widget.imagepath.path,
    
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio16x9,
    
      ],
      
      uiSettings:[AndroidUiSettings(
toolbarWidgetColor: AppColor.pink,
dimmedLayerColor: AppColor.dark_1,
cropGridColor: AppColor.dark_1,
toolbarColor: AppColor.dark_2,
showCropGrid: false,

toolbarTitle: " ",
backgroundColor: AppColor.dark_1,
statusBarColor: AppColor.dark_2,
activeControlsWidgetColor: AppColor.pink,

        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: true,),
          IOSUiSettings(
                    minimumAspectRatio: 1.0, // Set minimum aspect ratio for iOS
            title: 'Cropper',
          ),],
    );

    if (cropped != null) {
      setState(() {
        _croppedImage = File(cropped.path);
        selectedIndex=2;

      });
    }
  }



  num currentValue = 40;
  int selectedfil = 0;
  @override
  Widget build(BuildContext context) {
    print("hola" + currentValue.toString());
     if(selectedIndex==3)
                   _cropImage();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
              
        Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: FileImage(widget.imagepath),
              fit: BoxFit.fill,
            )),

if(selectedIndex==0 || selectedIndex==1)
         EditFilters(),
  if(selectedIndex==2 || selectedIndex==3)       
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(filterItemIcons.length, (index) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedfil = index;
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
                            width: 1.5)),
                    child: CircleAvatar(backgroundColor:selectedfil==index?  Color.fromARGB(255, 57, 2, 21):Colors.black,
                  radius: 25,
                  child: Icon(filterItemIcons[index]),
                  ),));
            })),
          ),
        ),
      if(selectedIndex==2 || selectedIndex==3)
        Container(
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
                ScaleLineStyle(
                    color: Colors.grey, width: 1.5, height: 30, scale: 0),
                ScaleLineStyle(
                    color: Colors.grey, width: 1, height: 15, scale: 5),
                ScaleLineStyle(
                    color: Colors.grey, width: 1, height: 10, scale: -1)
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
        ),


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
                selectedIndex = index; 
                print("selected index"+selectedIndex.toString());
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
                  color: selectedIndex == index
                      ? Colors.pink // Change text color if selected
                      : Colors.white, // Default text color
                ),
              ),
            ),
          );
        },
      ),
    )



      ],
    );
  }
}

// class MainEditTexts extends StatefulWidget {
//   const MainEditTexts({
//     super.key,
//   });

//   @override
//   State<MainEditTexts> createState() => _MainEditTextsState();
// }

// class _MainEditTextsState extends State<MainEditTexts> {
//   int selectedIndex = -1; // Initially no text is selected

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40, // Adjust the height as needed
//       padding: EdgeInsets.only(left: 50, right: 50),
//       margin: EdgeInsets.only(top: 4),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color.fromARGB(255, 31, 1, 11),
//             Color.fromARGB(255, 70, 5, 39),
//             Color.fromARGB(255, 31, 1, 11),
//           ],
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//         ),
//       ),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: mainEditsTexts.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedIndex = index; 
//                 print("selected index"+selectedIndex.toString());
//               });
//             },
//             child: Container(
//               alignment: Alignment.center,
//               padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
//               margin: EdgeInsets.symmetric(horizontal: 8),
//               child: Text(
//                 mainEditsTexts[index],
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                   color: selectedIndex == index
//                       ? Colors.pink // Change text color if selected
//                       : Colors.white, // Default text color
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

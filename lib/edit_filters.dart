import 'package:aira_filter_app/data/imageList.dart';
import 'package:flutter/material.dart';

class EditFilters extends StatefulWidget {
  const EditFilters({
    super.key,
  });

  @override
  State<EditFilters> createState() => _EditFiltersState();
}

class _EditFiltersState extends State<EditFilters> {
int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(imageUrls.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
               selectedItem = index;
              });
            },
            child: Padding(
              
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: index == selectedItem? Colors.pink: Colors.transparent,
                  width: 1.5,
                ),
              ),
                child: Stack(
                  children: [
                    Image.asset(
                      imageUrls[index],
                      fit: BoxFit.fill,
                      width: 70, // Adjust image width as needed
                      height: 100,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              index == selectedItem? Colors.pink.withOpacity(0.0): Colors.black.withOpacity(0.0),
                              index == selectedItem? Colors.pink.withOpacity(0.9): Colors.black.withOpacity(0.9),
                              
                            ], // Adjust colors as needed
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                        child: Text(
                          texts[index % texts.length],
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        })),
      ),
    );
  }
}

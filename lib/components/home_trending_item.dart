import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/discover_screen.dart';
import 'package:aira_filter_app/filter_cover.dart';
import 'package:flutter/material.dart';
class HomeTrendingItem extends StatelessWidget {
  final List<String> imageUrls;
  final List<String> texts;
  final String title;

  HomeTrendingItem({required this.imageUrls,  this.texts = const [" "] ,this.title = "Title"});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const Row(
                children: [
                  Text('All', style: TextStyle(fontSize: 16)),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.215,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilterCoverScreen(index: index,)),
                );
                },
                child: Container(
                  width: 90,
                
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(imageUrls[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(bottom:8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(texts[index%texts.length],textAlign: TextAlign.center),
                    ), 
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

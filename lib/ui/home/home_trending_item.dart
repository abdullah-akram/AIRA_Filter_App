import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/data/imageList.dart';
import 'package:aira_filter_app/ui/discover/discover_screen.dart';
import 'package:aira_filter_app/ui/filter_cover/filter_cover.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class HomeTrendingItem extends StatefulWidget {
  List<String> imageUrls;
  List<String> texts;
  final String title;

  HomeTrendingItem({required this.imageUrls,  this.texts = const [" "] ,this.title = "Title"});

  @override
  State<HomeTrendingItem> createState() => _HomeTrendingItemState();
}

class _HomeTrendingItemState extends State<HomeTrendingItem> {

List<String> imageUrls_ = [];
  List<String> texts_ = [];

 @override
  void initState() {
    super.initState();
          print("---------------------------------------------------------------------");

    fetchImageUrls();
  }

  Future<void> fetchImageUrls() async {
    print("han na");
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('filters').get();
    print("han na1");

    final List<String> fetchedImageUrls = [];
    final List<String> fetchedTexts = []; 

    snapshot.docs.forEach((doc) {
      fetchedImageUrls.add(doc['image']);
      fetchedTexts.add(doc['title']);
    });
    print("han na2");


      print(fetchedImageUrls);
      print(fetchedTexts);
    print("han na3");
    setState(() {
      imageUrls_ = fetchedImageUrls;
      texts_ = fetchedTexts;
      widget.imageUrls = imageUrls_;
      widget.texts = texts_;

    });
  }



  @override
  Widget build(BuildContext context) {
          print("oooooooooooooooooooooooooooooooooooooooooooooooooo");
     print(texts_);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
            itemCount: imageUrls_.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilterCoverScreen(index: index,image: imageUrls_[index], title: texts_[index])),
                );
                },
                child: Container(
                  width: 90,
                
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imageUrls_[index]),
                      
                      fit: BoxFit.cover,
                    ),
                  ),
                
                  child: Container(
                    margin: const EdgeInsets.only(bottom:8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(texts_[index%texts_.length],textAlign: TextAlign.center),
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

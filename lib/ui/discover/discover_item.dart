import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DiscoverItem extends StatefulWidget {
  List<String> imageUrls;
  List<String> texts;
 
  final String title;

  DiscoverItem({required this.imageUrls,required this.texts, this.title = "Title"});

  @override
  State<DiscoverItem> createState() => _DiscoverItemState();
}

class _DiscoverItemState extends State<DiscoverItem> {



List<String> imageUrls_ = [];
  List<String> texts_ = [];
  List<String> by_ = [];

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

    final List<String> fetchedImageUrls = [];
    final List<String> fetchedTexts = []; 
     final List<String> fetchedTextsBy = []; 

    snapshot.docs.forEach((doc) {
      fetchedImageUrls.add(doc['image']);
      fetchedTexts.add(doc['title']);
      fetchedTextsBy.add(doc['by']);

    });


    setState(() {
      imageUrls_ = fetchedImageUrls;
      texts_ = fetchedTexts;
      by_ = fetchedTextsBy;
      widget.imageUrls = imageUrls_;
      widget.texts = texts_;

    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const Row(
                children: [
                  Text('View', style: TextStyle(fontSize: 16)),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.84,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,  
            childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.5),),
            scrollDirection: Axis.vertical,
            itemCount: imageUrls_.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageUrls_[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.065,
                      
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8,4,4,4),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
Text(
  texts_[2 * index % texts_.length].length > 10
      ? texts_[2 * index % texts_.length].substring(0, 9) + '...'
      : texts_[2 * index % texts_.length],
  textAlign: TextAlign.start,
  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
),                            Text("Artist", textAlign: TextAlign.start,style: const TextStyle(fontSize: 10),),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: 40,
                        child: RoundedButton(title: "Connect", onClick:() => {}, bgcolor: AppColor.pink,padding: 4,margin:4),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

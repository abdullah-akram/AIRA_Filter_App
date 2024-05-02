import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:flutter/material.dart';

class DiscoverItem extends StatelessWidget {
  final List<String> imageUrls;
  final List<String> texts;
  final String title;

  DiscoverItem({required this.imageUrls, this.texts = const [" ", " "], this.title = "Title"});

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
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
          height: MediaQuery.of(context).size.height * 0.85,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,  
            childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.5),),
            scrollDirection: Axis.vertical,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(imageUrls[index]),
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
                            Text(texts[2*index%texts.length], textAlign: TextAlign.start,style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                            Text(texts[(2*index+1)%texts.length], textAlign: TextAlign.start,style: const TextStyle(fontSize: 10),),
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

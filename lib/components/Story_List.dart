import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/data/imageList.dart';
import 'package:flutter/material.dart';
class StoryListView extends StatelessWidget {
  final List<String> imageUrls;
  final List<String> names;

  StoryListView({required this.imageUrls, required this.names});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(4.0,8.0,4.0,4.0),
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 60.0,
                      height:60.0,
                      decoration: BoxDecoration(
                        border: const Border(
                          top: BorderSide(width: 1.0, color: AppColor.pink),
                          left: BorderSide(width: 1.0, color: AppColor.pink),
                          right: BorderSide(width: 1.0, color: AppColor.pink),
                          bottom: BorderSide(width: 1.0, color: AppColor.pink),
                        ),
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue, Colors.red],
                        ),
                        image: DecorationImage(
                          image: AssetImage(imageUrls[index]),
                          fit: BoxFit.cover,
                          colorFilter: index == 0 ? ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken) : null,
                        ),
                      ),
                    ),
                    if (index == 0) const Icon(Icons.add, size: 30.0,color: AppColor.light,),
                  ],
                ),
                Text(
                  index==0?'You':names[index%names.length],
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

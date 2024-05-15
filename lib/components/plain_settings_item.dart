
import 'package:aira_filter_app/constants/colors.dart';
import 'package:flutter/material.dart';

class PlainSettingsItem extends StatelessWidget {
  final int index;
  final List<IconData> icons;
  final List<String> texts;
 
  const PlainSettingsItem({
    super.key,required this.index, required this.icons, required this.texts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      child: ListTile(
        horizontalTitleGap: 5,
        leading: CircleAvatar(
          backgroundColor: AppColor.pink,
          child: Icon(
            size: 16,
            icons[index],
            color: Colors.black,
          ),
        ),
        title: Text(
          '${texts[index]}',
          style: TextStyle(fontSize: 15),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

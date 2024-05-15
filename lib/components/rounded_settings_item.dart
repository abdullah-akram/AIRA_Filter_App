
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/data/profile_lists.dart';
import 'package:flutter/material.dart';

class RoundedSettingsItem extends StatelessWidget {
  final int index;
  final List<IconData> icons;
  final List<String> texts;
  const RoundedSettingsItem({
    super.key, required this.index, required this.icons, required this.texts,
  });


  

  @override
  Widget build(BuildContext context) {
    return Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child:  Row(
                      children: [
                         CircleAvatar(
          backgroundColor: AppColor.pink,
          child: Icon(
            size: 16,
            icons[index],
            color: Colors.black,
          ),
        ),
                        const SizedBox(width: 10),
                        Text(
    texts[index],
    style: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Icon(
    size: 16,
    Icons.arrow_forward_ios,
    color: Colors.white,
                        ),
                      ],
                    ),
                  );
  }
}

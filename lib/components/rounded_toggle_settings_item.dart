import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/data/profile_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedToggleSettingsItem extends StatefulWidget {
  final int index;
  final List<IconData> icons;
  final List<String> texts;
  const RoundedToggleSettingsItem({
    super.key, required this.index, required this.icons, required this.texts,
  });

  @override
  _RoundedToggleSettingsItemState createState() => _RoundedToggleSettingsItemState();
}

class _RoundedToggleSettingsItemState extends State<RoundedToggleSettingsItem> {
  bool _isSwitched = false;

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
              widget.icons[widget.index],
              size: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            widget.texts[widget.index],
            style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
        const VerticalDivider(),
          Switch(
            value: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
            },
            activeTrackColor: AppColor.pink,
            activeColor: Colors.white,
            inactiveThumbColor: AppColor.dark_3,
            inactiveTrackColor: AppColor.dark_2,
            trackOutlineColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
            thumbIcon: MaterialStateProperty.resolveWith((states) =>  Icon(_isSwitched? Icons.check:null, color: Colors.pink, size: 16,)),
            
          ),
        ],
      ),
    );
  }
}

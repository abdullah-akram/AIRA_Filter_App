import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeTryItem extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
    return  Container(
              margin: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                    
                  ),
                ),
                child:  Container(
                  margin: const EdgeInsets.fromLTRB(0,10,10,5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Try Out The Latest & Greatest',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                      const Text('The latest presets at your fingertips',style: TextStyle(fontSize: 11),),
                      Expanded(child: Container()),
                      RoundedButton(title: "Try Now", onClick:() => {}, bgcolor: AppColor.pink,width:200.0)
            
                    ],
                  ),
                ),
              )
                ; 
    }
}
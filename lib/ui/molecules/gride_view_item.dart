import 'package:flutter/material.dart';
import 'package:simplify_synergy_2/ui/molecules/textview/app_textview.dart';
import 'package:simplify_synergy_2/utils/constant/image_url.dart';
import 'package:simplify_synergy_2/utils/ui_manager/synergy_ui_manager.dart';

class GridViewItem extends StatelessWidget {
  final String title;
  final String imageURL;
   const GridViewItem({required this.title,required this.imageURL,Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final uiManager = SynergyUIManager(context);
    return Container(

      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular( 8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Padding(
            padding:  EdgeInsets.only(top: uiManager.height(context, 190),bottom:  uiManager.height(context, 116)),
            child: Image.asset(imageURL,height: 40,width: 40,),
          ),
          SizedBox(
            height: uiManager.height(context, 130),
          ),
          AppText(label: title,color: Colors.black,size: 6,weight: 9,)
        ],
      ),
    );
  }

}

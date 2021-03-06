import 'package:flutter/material.dart';
import 'package:my_thai_star_flutter/ui/localization.dart';
import 'package:my_thai_star_flutter/ui/ui_helper.dart';

///Defines a part of the [OrderPage] that let's the user
///navigate to the previous [Route]
class ResumeHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UiHelper.standard_padding),
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            Translation.of(context).get('sidenav/title'),
            style: Theme.of(context)
                .textTheme
                .subtitle
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';

class NoConnectionPage extends StatelessWidget {
  final VoidCallback? retry;

  const NoConnectionPage({Key? key, this.retry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You're offline",
            style: AppStyle.txtRobotoBold15,
            textAlign: TextAlign.center,
          ),
          Text(
            'Please check your connection and try again',
            style: AppStyle.txtRobotoRegular14,
            textAlign: TextAlign.center,
          ),
          (this.retry != null)
              ? ElevatedButton(
                  onPressed: () => retry!(),
                  child: Text('Retry'),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';

class NoItemsFound extends StatelessWidget {
  final VoidCallback onPressed;
  final bool? retry;

  const NoItemsFound({Key? key, required this.onPressed, this.retry = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No items found',
            style: AppStyle.txtRobotoBold15,
          ),
          Text(
            'the list is currently empty',
            style: AppStyle.txtRobotoRegular12,
          ),
          (retry != null && retry == true)
              ? ElevatedButton(
                  onPressed: () => onPressed(),
                  child: Text(
                    'Retry',
                    style: AppStyle.txtRobotoRegular12,
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}

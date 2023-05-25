import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlertDialogContainer extends StatelessWidget {
  final String _title;
  final String _content, _buttonText;
  final String? _buttonText2;
  final VoidCallback _onDone;
  final VoidCallback? _onOk;
  const AlertDialogContainer(
    this._title,
    this._content,
    this._buttonText,
    this._onDone,
    this._buttonText2,
    this._onOk, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: Text(_title),
            content: Center(child: Text(_content)),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: _onDone,
                child: Text(
                  _buttonText,
                  style: const TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          )
        : AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            title: Text(
              _title,
            ),
            content: Text(_content),
            actions: <Widget>[
              TextButton(
                onPressed: _onDone,
                child: Text(
                  _buttonText,
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              (_onOk != null)
                  ? TextButton(
                      onPressed: _onOk,
                      child: Text(
                        _buttonText2 ?? '',
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          );
  }
}

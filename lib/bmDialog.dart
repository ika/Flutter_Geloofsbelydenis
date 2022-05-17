import 'package:flutter/material.dart';

enum ConfirmAction { CANCEL, ACCEPT }

String note = "";

class BMDialog {
  Future showBmDialog(context, arr) async {
    String txt = arr[1].toString();

    // txt = txt.replaceAll(RegExp(r'[0-9]+'), '');
    // txt = txt.replaceAll(RegExp(r'[\(\)\-]+'), '');

    if (txt.length > 35) {
      txt = txt.substring(0, 35);
    }

    TextEditingController _controller = TextEditingController();
    note = _controller.text = txt;

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Boekmerk?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  arr[0].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      autofocus: true,
                      maxLength: 50,
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Tik teks in',
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onChanged: (value) {
                        note = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ja', style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.ACCEPT);
              },
            ),
            TextButton(
              child: const Text('Nee', style: const TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
          ],
        );
      },
    );
  }
}

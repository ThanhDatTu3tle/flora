import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage extends StatefulWidget {
  const ToastMessage({Key? key}) : super(key: key);

  @override
  State<ToastMessage> createState() => _ToastMessageState();
}

class _ToastMessageState extends State<ToastMessage> {
  final buttonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 50),
    textStyle: const TextStyle(fontSize: 20),
  );

  final toast = FToast();

  @override
  void initState() {
    super.initState();

    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: showTopToast,
              style: buttonStyle,
              child: const Text('Cummm'),
            )
          ],
        ),
      ),
    );
  }

  void showTopToast() => toast.showToast(child: buildToast(), gravity: ToastGravity.TOP);

  Widget buildToast() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
      color: Colors.green.shade200,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.check, color: Colors.green),
        SizedBox(width: 12.0,),
        Text(
          "Thêm vào giỏ hàng",
          style: TextStyle(
              color: Colors.green, fontSize: 20
          ),
        )
      ],
    ),
  );
}

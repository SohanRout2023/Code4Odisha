import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final double width;
  final Function onpressed;

  RoundedButtonWidget({
    required this.buttonText,
    required this.width,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          color:Color.fromRGBO(239, 91, 12,1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all(Size(width, 10)),
              backgroundColor:
                  MaterialStateProperty.all(Colors.transparent),
              // elevation: MaterialStateProperty.all(3),
              shadowColor:
                  MaterialStateProperty.all(Colors.transparent),
                  ),
          onPressed: () {
            onpressed();
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 18,
                // fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
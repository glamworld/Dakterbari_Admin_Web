import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Button(BuildContext context, String ButtonName) {
  Size size = MediaQuery.of(context).size;
  return Material(
    elevation: 2,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    child: Container(
      alignment: Alignment.center,
      height:size.height*.05,
      width: size.width*.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).primaryColor,
      ),
      child: Center(
        child: Text(
          ButtonName,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: size.width / 70),
        ),
      ),
    ),
  );
}
const FormDecorationWithoutPrefix = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
  fillColor: Colors.white,
  hintText: "Write Title",
  border: InputBorder.none,
  filled: true,
);
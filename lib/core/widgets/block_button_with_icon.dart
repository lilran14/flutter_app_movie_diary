import 'package:flutter/material.dart';

class BlockButtonWithIcon extends StatelessWidget {
  const BlockButtonWithIcon({
    Key? key,
    required this.icon,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);
  final Icon icon;
  final String textButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: deviceSize.height * 0.065,
      child: MaterialButton(
          elevation: 0,
          onPressed: onPressed,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Theme.of(context).accentColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(
                width: 5,
              ),
              Text(textButton, style: Theme.of(context).textTheme.button),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';

class BlockButton extends StatelessWidget {
  const BlockButton({
    Key? key,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).accentColor,
        child: Text(
          textButton,
          style: Theme.of(context).textTheme.button,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

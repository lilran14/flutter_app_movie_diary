import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Gap.defaultPadding, vertical: Gap.defaultGap * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.subtitle1),
          InkWell(
              onTap: onPressed,
              child: Text("See All",
                  style: Theme.of(context).textTheme.subtitle2)),
        ],
      ),
    );
  }
}

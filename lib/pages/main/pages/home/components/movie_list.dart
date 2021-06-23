import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';
import 'package:get/get.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: Gap.defaultPadding),
          itemBuilder: (context, index) => Container(
                width: 85,
                height: 120,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () => Get.toNamed("/movie"),
                  child: Stack(
                    children: [
                      Container(
                        width: 85,
                        height: 120,
                        child: Image.network(
                          "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/06/18/386827737.jpg",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Color(0xFF9BFE5E),
                          child: Text("8.0",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: Gap.defaultGap + 5,
              ),
          itemCount: 5),
    );
  }
}

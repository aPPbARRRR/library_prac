import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreenButton extends StatelessWidget {
  const HomeScreenButton(
      {Key? key,
      required this.leadingText,
      required this.contentText,
      required this.padding,
      required this.targetScreenName,
      this.assetUri})
      : super(key: key);
  final String leadingText;
  final String contentText;
  final String targetScreenName;
  final String? assetUri;
  final double padding;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: GestureDetector(
        onTap: () {
          context.goNamed(targetScreenName);
        },
        child: FadeIn(
          child: Container(
            height: height / 6 < 150 ? 150 : height / 6,
            decoration: BoxDecoration(
              color: Colors.orange[700],
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [Colors.orange[700]!, Colors.orange[900]!]),
            ),
            child: height > width
                ? Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: width / 5,
                          height: height / 6,
                          child: assetUri != null
                              ? Image.asset(
                                  assetUri!,
                                )
                              : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: VerticalDivider(
                          thickness: 1,
                          color: Colors.orange[900],
                        ),
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                            fontSize: width / 32 < 16 ? 16 : width / 32,
                            color: Colors.black),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              leadingText,
                              style: TextStyle(
                                  fontSize: width / 28 < 20 ? 20 : width / 28,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(contentText),
                          ],
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    width: width / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: width / 5,
                            height: height / 6,
                            child: assetUri != null
                                ? Image.asset(
                                    assetUri!,
                                  )
                                : null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                              indent: 20, endIndent: 20, color: Colors.black),
                        ),
                        DefaultTextStyle(
                          style: TextStyle(
                              fontSize: width / 40 < 16 ? 16 : width / 40,
                              color: Colors.black),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  leadingText,
                                  style: TextStyle(
                                      fontSize:
                                          width / 28 < 20 ? 20 : width / 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(contentText),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

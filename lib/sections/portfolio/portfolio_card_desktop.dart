import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/configs.dart';
import '../../provider/app_provider.dart';
import '_portfolio_card_back.dart';

class PorfolioCardDesktop extends StatefulWidget {
  // final String? banner;
  final String? projectLink;
  final String? projectIcon;
  final String projectTitle;
  final String projectDescription;
  final IconData? projectIconData;

  const PorfolioCardDesktop({
    Key? key,
    // this.banner,
    this.projectIcon,
    this.projectLink,
    this.projectIconData,
    required this.projectTitle,
    required this.projectDescription,
  }) : super(key: key);

  @override
  PorfolioCardDesktopState createState() => PorfolioCardDesktopState();
}

class PorfolioCardDesktopState extends State<PorfolioCardDesktop> {
  bool isHover = false;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    double height = MediaQuery.of(context).size.height;

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (widget.projectDescription.isNotEmpty) {
          cardKey.currentState!.toggleCard();
        }
      },
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: FlipCard(
        flipOnTouch: kIsWeb ? false : true,
        key: cardKey,
        back: Container(
          width: AppDimensions.normalize(100),
          height: AppDimensions.normalize(80),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: appProvider.isDark ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      color: AppTheme.c!.primary!.withAlpha(100),
                      blurRadius: 12.0,
                      offset: const Offset(0.0, 0.0),
                    )
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withAlpha(100),
                      blurRadius: 12.0,
                      offset: const Offset(0.0, 0.0),
                    )
                  ],
          ),
          child: PortFolioCardBackWidget(
            title: widget.projectTitle,
            desc: widget.projectDescription,
            link: widget.projectLink.toString(),
          ),
        ),
        front: Container(
          width: AppDimensions.normalize(100),
          height: AppDimensions.normalize(80),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: appProvider.isDark ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      color: AppTheme.c!.primary!.withAlpha(100),
                      blurRadius: 12.0,
                      offset: const Offset(0.0, 0.0),
                    )
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withAlpha(100),
                      blurRadius: 12.0,
                      offset: const Offset(0.0, 0.0),
                    )
                  ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.projectIcon != null
                      // ? (width > 1135 || width < 950)
                      //     ? Image.asset(
                      //         widget.projectIcon!,
                      //         height: height * 0.10,
                      //       )
                      //     : Row(
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           Image.asset(
                      //             widget.projectIcon!,
                      //             height: height * 0.03,
                      //           ),
                      //           SizedBox(
                      //             width: width * 0.01,
                      //           ),
                      //           Text(
                      //             widget.projectTitle,
                      //             style: AppText.b2b,
                      //             textAlign: TextAlign.center,
                      //           ),
                      //         ],
                      //       )
                      ? Image.asset(
                          widget.projectIcon!,
                          height: height * 0.10,
                        )
                      : Container(),
                  // widget.projectIconData != null
                  //     ? Icon(
                  //         widget.projectIconData,
                  //         color: AppTheme.c!.primary!,
                  //         size: height * 0.1,
                  //       )
                  //     : Container(),
                  // (width > 1135 || width < 950)
                  //     ? SizedBox(
                  //         height: height * 0.02,
                  //       )
                  //     : const SizedBox(),
                  // (width > 1135 || width < 950)
                  //     ? Text(
                  //         widget.projectTitle,
                  //         style: AppText.h3,
                  //         textAlign: TextAlign.center,
                  //         maxLines: 2,
                  //       )
                  //     : Container(),
                  Text(
                    widget.projectTitle,
                    style: AppText.h3!.copyWith(
                      color: appProvider.isDark ? Colors.white : Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

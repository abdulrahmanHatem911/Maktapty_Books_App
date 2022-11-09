import '../../layout/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'book_data.dart';

Widget commonBookItem(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 2,
      vertical: 20,
    ).copyWith(
      bottom: 0,
    ),
    height: 180,
    child: Stack(
      children: [
        PageView(
          controller: LayoutCubit.pageController,
          children: CommonBook.getCommonBooks()
              .map((e) => Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            '${e.image}',
                            fit: BoxFit.cover,
                            scale: 1,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.black,
                                  Colors.black45,
                                  Colors.black12,
                                  Colors.black.withOpacity(0)
                                ])),
                      ),
                      Positioned(
                        left: 30,
                        top: 20,
                        child: Text(AppLocalizations.of(context)!.upcomingBook,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontSize: 24.0,
                                    color: Colors.grey.shade200)),
                      ),
                      Positioned(
                          right: 20.0,
                          bottom: 10.0,
                          child: Text(
                            '30+ new book coming with various \ngames are waiting for you',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade300,
                            ),
                          ))
                    ],
                  ))
              .toList(),
        ),
        Positioned(
            left: 30,
            bottom: 10,
            child: SmoothPageIndicator(
              controller: LayoutCubit.pageController,
              count: CommonBook.getCommonBooks().length,
              effect: const ExpandingDotsEffect(
                expansionFactor: 4,
                dotWidth: 8,
                dotHeight: 4,
                activeDotColor: Colors.white,
              ),
              onDotClicked: (index) {
                LayoutCubit.pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut);
              },
            ))
      ],
    ),
  );
}

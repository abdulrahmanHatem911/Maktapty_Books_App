import 'package:book/core/constant/app_size.dart';

import '../../models/onboardin_data.dart';
import 'package:flutter/material.dart';

import '../constant/const.dart';

Widget onBoardingItem(BuildContext context, OnBoarding data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage(data.image),
        ),
      ),
      AppSize.sv_20,
      Text(
        data.title,
        style: Theme.of(context).textTheme.headline2,
      ),
      AppSize.sv_10,
      Text(data.description,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.grey,
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
              )),
    ],
  );
}

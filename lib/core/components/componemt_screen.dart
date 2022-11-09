//
import 'package:book/core/style/app_color.dart';
import 'package:book/layout/cubit/cubit.dart';
import 'package:book/modules/screens/book_details.dart';
import 'package:flutter/material.dart';
import '../constant/const.dart';

Widget buildListItems(String title, BuildContext context, List model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      const SizedBox(height: 5),
      Container(
        width: double.infinity,
        height: 330.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          color: LayoutCubit.get(context).isDark
              ? Colors.black26
              : Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return buildSuggestionItem(model[index], context);
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: model.length,
          ),
        ),
      ),
    ],
  );
}

Widget buildSuggestionItem(Map<String, dynamic> model, context) {
  return SizedBox(
    width: 140,
    //height: 600.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            LayoutCubit.get(context).getDownloadList(model);
            navigateToDetail(
              context,
              BookDetails(modelData: model),
            );
          },
          child: Container(
            height: 200,
            width: 130.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(model['book_image']),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          model['title'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textWidthBasis: TextWidthBasis.longestLine,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
        ),
        const SizedBox(height: 8.0),
        Text(
          model['publisher'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textWidthBasis: TextWidthBasis.longestLine,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w100,
              ),
        ),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: () {
            LayoutCubit.get(context).getFavoriteData(model);
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.perper,
            ),
            child: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 20.0,
            ),
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.star_rate_rounded,
              color: Colors.amber.shade800,
              size: 20.0,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: Colors.amber.shade800,
              size: 20.0,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: Colors.amber.shade800,
              size: 20.0,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: Colors.amber.shade800,
              size: 20.0,
            ),
          ],
        )
      ],
    ),
  );
}

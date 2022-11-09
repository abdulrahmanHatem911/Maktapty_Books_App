import '../../core/constant/const.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';
import 'book_details.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: ConditionalBuilder(
                condition: cubit.favoriteData.isNotEmpty,
                builder: (context) {
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildItemInLibrary(
                        context,
                        LayoutCubit.get(context).favoriteData[index],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.black,
                    ),
                    itemCount: cubit.favoriteData.length,
                  );
                },
                fallback: (context) => Center(
                  child: Image.asset('assets/images/error404.png'),
                ),
              )),
        );
      },
    );
  }

  Widget buildItemInLibrary(BuildContext context, Map<String, dynamic> model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            navigateToDetail(
              context,
              BookDetails(modelData: model),
            );
            LayoutCubit.get(context).getDownloadList(model);
          },
          child: Container(
            width: 130,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.shade100,
              image: DecorationImage(
                image: NetworkImage('${model['book_image']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: SizedBox(
            height: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${model['title']}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 20.0),
                ),
                //SizedBox(height: 5.0),
                Text(
                  '${model['author']}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.grey),
                ),
                //const Spacer(),
                Text(
                  '${model['price']}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //SizedBox(height: 10.0),
              ],
            ),
          ),
        )
      ],
    );
  }
}

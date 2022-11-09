import 'package:conditional_builder/conditional_builder.dart';

import '../../core/constant/const.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';
import 'book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadingScreen extends StatelessWidget {
  const ReadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConditionalBuilder(
            condition: cubit.libraryData.isNotEmpty,
            builder: (context) {
              return Container(
                decoration: const BoxDecoration(),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 4.6 / 8,
                  ),
                  itemBuilder: (context, index) {
                    return buildGridItem(cubit.libraryData[index], context);
                  },
                  itemCount: cubit.libraryData.length,
                ),
              );
            },
            fallback: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
                strokeWidth: 3.0,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildGridItem(Map<String, dynamic> model, BuildContext context) {
    return GestureDetector(
      onTap: () {
        LayoutCubit.get(context).getDownloadList(model);
        navigateToDetail(
          context,
          BookDetails(modelData: model),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: NetworkImage('${model['book_image']}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

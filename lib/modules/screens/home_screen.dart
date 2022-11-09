// for home_screen.dart:
import 'package:book/layout/cubit/state.dart';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/components/common_book.dart';
import '../../core/components/componemt_screen.dart';
import '../../layout/cubit/cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        // var for cubit
        var cubit = LayoutCubit.get(context);
        // list of data

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //search bar
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: LayoutCubit.get(context).isDark
                        ? Colors.black26
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(children: [
                      const Icon(Icons.search),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: AppLocalizations.of(context)!.search,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: state is! LayoutGetCurrentMangaDataLoadingState,
                    builder: (context) {
                      return ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          // common book
                          commonBookItem(context),
                          const SizedBox(height: 20),
                          buildListItems(
                            AppLocalizations.of(context)!.suggestions,
                            context,
                            cubit.dataHardcoverFiction,
                          ),
                          const SizedBox(height: 35.0),
                          buildListItems(
                            AppLocalizations.of(context)!.bestSeller,
                            context,
                            cubit.dataPictureBooks,
                          ),
                          const SizedBox(height: 35.0),
                          buildListItems(
                            AppLocalizations.of(context)!.offers,
                            context,
                            cubit.dataScience,
                          ),
                          const SizedBox(height: 35.0),
                          buildListItems(
                            AppLocalizations.of(context)!.newRelease,
                            context,
                            cubit.dataSports,
                          ),
                          const SizedBox(height: 35.0),
                          buildListItems(
                            AppLocalizations.of(context)!.whatFriendsRead,
                            context,
                            cubit.dataManga,
                          ),
                          const SizedBox(height: 35.0),
                        ],
                      );
                    },
                    fallback: (context) => Center(
                      child: CircularProgressIndicator(
                        color: Colors.purple.shade200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

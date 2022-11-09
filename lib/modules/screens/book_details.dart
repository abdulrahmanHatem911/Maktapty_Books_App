import 'package:book/core/constant/app_size.dart';
import 'package:book/layout/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constant/const.dart';
import '../../layout/cubit/cubit.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookDetails extends StatefulWidget {
  final Map<String, dynamic> modelData;
  const BookDetails({
    Key? key,
    required this.modelData,
  }) : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  List<String> items = [
    'Details',
    'Language',
    'Publisher',
    'Date of publication',
    'Book weight'
  ];
  List<String> itemsDetails = [
    'wise book',
    'English',
    'Fatima or Rai',
    'March 9, 2019',
    '750 g'
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(elevation: 0.0),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 200.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.modelData['book_image']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          AppSize.sh_10,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.modelData['title'],
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Text(
                                  widget.modelData['author'],
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 18.0,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 1,
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star_rate_rounded,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 3.0),
                                            Text(
                                              '4.1',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                    color: Colors.grey.shade500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5.0),
                                        Row(
                                          children: [
                                            Text(
                                              'View',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                    color: Colors.grey.shade500,
                                                  ),
                                            ),
                                            const SizedBox(width: 3.0),
                                            Text(
                                              '907',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                    color: Colors.grey.shade500,
                                                  ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '450',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                color: Colors.grey.shade500,
                                              ),
                                        ),
                                        const SizedBox(height: 5.0),
                                        Text(
                                          'Pages',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                color: Colors.grey.shade500,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.language,
                                          color: Colors.grey,
                                          size: 20.0,
                                        ),
                                        const SizedBox(height: 5.0),
                                        Text(
                                          'English',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                color: Colors.grey.shade500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    AppLocalizations.of(context)!.aboutTheBook,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 18.0),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: LayoutCubit.get(context).isDark
                          ? Colors.black12
                          : Colors.grey.shade100,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${widget.modelData['description']}',
                          style: TextStyle(
                            color: LayoutCubit.get(context).isDark
                                ? Colors.white
                                : Colors.black45,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          color: Colors.grey.shade500,
                          height: 45.0,
                          onPressed: () {},
                          child: Text('Free sample',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    color: Colors.white,
                                  )),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: MaterialButton(
                          color: Colors.purple.shade400,
                          height: 45.0,
                          onPressed: () {},
                          child: Text(
                            'Add to list',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    AppLocalizations.of(context)!.bookDetails,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 18.0),
                  ),
                  AppSize.sv_10,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: LayoutCubit.get(context).isDark
                          ? Colors.black12
                          : Colors.grey.shade100,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: items.map((e) {
                              return Column(
                                children: [
                                  Text(
                                    e,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                      color: LayoutCubit.get(context).isDark
                                          ? Colors.white
                                          : Colors.black45,
                                    ),
                                  ),
                                  AppSize.sv_5,
                                ],
                              );
                            }).toList(),
                          ),
                          const SizedBox(width: 15.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: itemsDetails.map((e) {
                                return Column(
                                  children: [
                                    Text(
                                      e,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    AppSize.sv_5,
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppSize.sv_20,
                  // download button
                  Wrap(
                    spacing: 10.0,
                    children: [
                      Text(
                        'Download',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 18.0),
                      ),
                      const SizedBox(width: 10.0),
                      ...cubit.downloadData.map((e) {
                        return InkWell(
                          onTap: () {
                            cubit.launchURLBrowser(e['url']);
                          },
                          child: Chip(
                            label: Text(e['name']),
                            backgroundColor: LayoutCubit.get(context).isDark
                                ? Colors.black12
                                : Colors.grey.shade100,
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

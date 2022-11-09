import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../layout/cubit/cubit.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static List<Map<String, String>> data = [
    {
      'title': 'calculation',
      'supTitle': '265',
    },
    {
      'title': 'Shipping',
      'supTitle': '10',
    },
    {
      'title': 'discount',
      'supTitle': '0',
    },
  ];

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var numberOfBooks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 120.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      constraints: const BoxConstraints.expand(
                        width: 90.0,
                        height: 120.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/books/9.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name of the book',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 20.0),
                              ),
                              SizedBox(width: 10.0),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  constraints: const BoxConstraints.expand(
                                    width: 90.0,
                                    height: 40.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.purple.shade100,
                                    border: Border.all(
                                        color: Colors.purple.shade800,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                    child: Text('Audio',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(fontSize: 16.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Name of the author',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.grey),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.68,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$334',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(fontSize: 18.0),
                                ),
                                Container(
                                  constraints: BoxConstraints.expand(
                                    width: MediaQuery.of(context).size.width *
                                        0.24,
                                    height: MediaQuery.of(context).size.width *
                                        0.08,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            numberOfBooks++;
                                          });
                                        },
                                        child: Container(
                                          width: 22.0,
                                          height: 22.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: Colors.purple.shade200,
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(
                                        '${numberOfBooks}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      const SizedBox(width: 10.0),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            numberOfBooks--;
                                          });
                                        },
                                        child: Container(
                                          width: 22.0,
                                          height: 22.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: Colors.purple.shade200,
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 120.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      constraints: const BoxConstraints.expand(
                        width: 90.0,
                        height: 120.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/books/3.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name of the book',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 20.0),
                              ),
                              SizedBox(width: 10.0),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  constraints: const BoxConstraints.expand(
                                    width: 90.0,
                                    height: 40.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.purple.shade100,
                                    border: Border.all(
                                        color: Colors.purple.shade800,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                    child: Text('Audio',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(fontSize: 16.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Name of the book',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.grey),
                          ),
                          const SizedBox(height: 10.0),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.68,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$334',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(fontSize: 18.0),
                                ),
                                Container(
                                  constraints: BoxConstraints.expand(
                                    width: MediaQuery.of(context).size.width *
                                        0.24,
                                    height: MediaQuery.of(context).size.width *
                                        0.08,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            numberOfBooks++;
                                          });
                                        },
                                        child: Container(
                                          width: 22.0,
                                          height: 22.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: Colors.purple.shade200,
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(
                                        '${numberOfBooks}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      const SizedBox(width: 10.0),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            numberOfBooks--;
                                          });
                                        },
                                        child: Container(
                                          width: 22.0,
                                          height: 22.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: Colors.purple.shade200,
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                constraints: const BoxConstraints.expand(
                  width: double.infinity,
                  height: 50.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.purple.shade700),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints.expand(
                        width: 140.0,
                        height: 50.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade300,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Discount code',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ubuntu',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter the code of discount',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // for purchase
              Container(
                constraints: const BoxConstraints.expand(
                  width: double.infinity,
                  height: 230.0,
                ),
                color: LayoutCubit.get(context).isDark
                    ? Colors.black12
                    : Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 7.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Purchase details :',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 18.0, color: Colors.purple.shade800),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        constraints: const BoxConstraints.expand(
                          width: double.infinity,
                          height: 160.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return purchesDitailsItem(
                                      context, PaymentScreen.data[index]);
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 8.0),
                                itemCount: 3,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                height: 1.0,
                                width: double.infinity,
                                color: Colors.grey,
                              ),
                              purchesDitailsItem(
                                context,
                                {'title': 'Total', 'supTitle': '275'},
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Center(
                child: MaterialButton(
                  height: 50.0,
                  minWidth: 170.0,
                  color: Colors.purple.shade400,
                  onPressed: () {},
                  child: Text('Pay',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 21.0, color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget purchesDitailsItem(BuildContext context, dynamic model) {
    return Row(
      children: [
        Text(
          model['title'],
          style:
              Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18.0),
        ),
        Spacer(),
        Text(
          model['supTitle'] + ' EGP',
        )
      ],
    );
  }
}

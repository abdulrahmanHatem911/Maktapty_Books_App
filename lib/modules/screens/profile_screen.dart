import 'package:flutter/material.dart';

import '../../core/constant/app_size.dart';
import '../../core/constant/const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            //color: Colors.yellow,
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/profile/cover.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.19,
                  left: MediaQuery.of(context).size.width * 0.35,
                  child: const CircleAvatar(
                    radius: 53,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        'assets/images/profile/user.png',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          AppSize.sv_10,
          Text(
            'Abdulrahman Hatem',
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 23.0),
          ),
          AppSize.sv_5,
          Text(
            'Flutter Developer at Google',
            style: Theme.of(context).textTheme.headline1,
          ),
          AppSize.sv_20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '23',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'Followers',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '104',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'Following',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '12',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'Posts',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

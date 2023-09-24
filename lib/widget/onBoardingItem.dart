import 'package:flutter/cupertino.dart';

import '../Models/onboardModel.dart';

Widget onBoardItem(OnBoardModel onBoardList) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 400,
            width: double.infinity,
            child: Image(
              image: AssetImage(onBoardList.image),
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: 30,
        ),
        Text(
          onBoardList.tittle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:w_commerce_abd/widget/onBoardingItem.dart';
import 'Models/onboardModel.dart';
import 'login/login_screen.dart';

class OnBoardView extends StatefulWidget {
  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  List<OnBoardModel> onBoardList = [
    OnBoardModel(
        image: 'assets/images/onboard1.jpg', tittle: "You can now go shopping"),
    OnBoardModel(
        image: 'assets/images/delivary.jpg',
        tittle: "  There is home delivery"),
    OnBoardModel(
        image: 'assets/images/onboard3.jpg', tittle: "You can shop online")
  ];

  var controller = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                if (index == onBoardList.length - 1) {
                  isLast = true;
                  setState(() {});
                } else {
                  isLast = false;
                  setState(() {});
                }
              },
              controller: controller,
              itemBuilder: (context, index) => onBoardItem(onBoardList[index]),
              itemCount: onBoardList.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return  LoginScreen();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(50, 50)),
                    child: const Text(
                      "Skip",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                SmoothPageIndicator(
                  controller: controller,
                  count: onBoardList.length,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.blue,
                      dotHeight: 7,
                      dotWidth: 20,
                      expansionFactor: 4,
                      spacing: 5),
                ),
                SizedBox(
                  width: 60,
                  height: 65,
                  child: FloatingActionButton(
                    elevation: 0,
                    child: const Icon(size: 35, Icons.arrow_forward_ios),
                    onPressed: () {
                      if (isLast) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  LoginScreen(),
                          ),
                          (route) => false,
                        );
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

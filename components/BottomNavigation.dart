import 'package:flutter/material.dart';
import 'package:foodie_buddy/screens/camera.dart';
import 'package:foodie_buddy/screens/cart.dart';
import 'package:foodie_buddy/screens/favourite.dart';
import 'package:foodie_buddy/screens/home/homepage.dart';
import 'package:foodie_buddy/screens/more.dart';

import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  List<Widget> screens = [
    homepage(
      
    ),
    FavouritePage(
      
    ),
    camera(
      title: '',
    ),
    cart(
      title: '',
    ),
    more(
      title: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screens[index]));
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Color(0xFF4AA469),
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SvgPicture.asset(
                'assets/icons/house-solid.svg',
                width: 20,
                height: 20,
                //   color: _currentIndex == 0 ? Colors.white : null,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SvgPicture.asset(
                'assets/icons/heart-solid.svg',
                width: 20,
                height: 20,
                //       color: _currentIndex == 1 ? Colors.white : null,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SvgPicture.asset(
                'assets/icons/camera-solid.svg',
                width: 21,
                height: 21,
                //   color: _currentIndex == 2 ? Colors.white : null,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SvgPicture.asset(
                'assets/icons/cart-shopping-solid.svg',
                width: 20,
                height: 20,
                //   color: _currentIndex == 3 ? Colors.white : null,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SvgPicture.asset(
                'assets/icons/ellipsis-solid.svg',
                width: 20,
                height: 20,
                // color: _currentIndex == 4 ? Colors.white : null,
              ),
            ),
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:nectar/screens/bottom_navigation_screens/cart_screen.dart';
import 'package:nectar/screens/bottom_navigation_screens/explore_screen.dart';
import 'package:nectar/screens/bottom_navigation_screens/favorite_screen.dart';
import 'package:nectar/screens/bottom_navigation_screens/store_screen.dart';

import 'bottom_navigation_screens/account_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;  
  static const List<Widget> _widgetOptions = <Widget>[  
    StoreScreen(),
    ExploreScreen(),
    CartScreen(),
    FavoriteScreen(),
    AcoountScreen(),
  ];  
  
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_work_rounded,),
          label: "Shop",
          
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search,),
          label: "Explore",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,),
          label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,),
          label: "Favorite",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person,),
          label: "Account",
          ),
        ],
        currentIndex: _selectedIndex,   
        onTap: _onItemTapped,  
        selectedItemColor: const Color(0xFF53B175),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
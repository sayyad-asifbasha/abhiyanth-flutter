import 'package:abhiyanth/services/Routes/navigation_service.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/widgets/gradient_icon.dart';
import 'package:abhiyanth/views/landing_page.dart';
import 'package:abhiyanth/views/departments_page.dart';
import 'package:abhiyanth/views/event_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:abhiyanth/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState()
  {
    super.initState();
    notificationServices.firebaseInit(context);
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onBottomNavTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leadingWidth: 60,
          backgroundColor: Colors.transparent,
          title: InkWell(
            onTap: (){
              NavigationService().pushScreen(RoutesName.aboutus);
            },
            child: const Text(
              "Abhiyanth 2K25",
              style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.notification);
                },
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),),
          ],
          centerTitle: true,
          elevation: 0,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children:  [
            LandingPage(),
            EventPage(),
            DepartmentsPage(),
            // AboutUsPage(),
            ProfilePage(),
            // MapPage(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF261E35),
                Colors.black,
                Colors.black,
                Colors.black, // Third black (extra stop)
                Color(0xFF261E35), // Side color
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.005, 0.4, 0.5, 0.6, 0.995],
            ),
          ),
          child: CurvedNavigationBar(
            index: _currentPage,
            height: 55,
            color: Colors.black,
            animationDuration: const Duration(milliseconds: 400),
            backgroundColor: Colors.transparent, // Make background transparent
            buttonBackgroundColor: Colors.white,
            items: const <Widget>[
              GradientIcon(
                icon: Icons.home,
                size: 30,
              ),
              GradientIcon(
                icon: Icons.event,
                size: 30,
              ),
              GradientIcon(
                icon: Icons.apartment_outlined,
                size: 30,
              ),
              GradientIcon(
                icon: Icons.person,
                size: 30,
              ),
              // GradientIcon(
              //   icon: Icons.map,
              //   size: 30,
              // ),
            ],
            onTap: _onBottomNavTapped,
          ),
        ),
      ),
    );
  }
}

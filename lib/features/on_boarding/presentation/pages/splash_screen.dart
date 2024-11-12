import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghala_new_app/features/on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:http/http.dart' as http;
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manger.dart';
import '../../../../core/utils/screen_util_new.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoggedIn = false; // State variable to track login status.

  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _checkInternetConnectivity();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenUtilNew.init(context); // Initialize ScreenUtil here
  }
  Future<void> _checkInternetConnectivity() async {
    try {
      final response = await http.get(Uri.parse('https://chat.localproductsnetwork.com/'));
      print("status code ${response.statusCode}");
      if (response.statusCode == 200) {
        setState(() {
          _isConnected = true;
          print("true ------- status 200 ---------");
        });
      } else {
        setState(() {
          _isConnected = false;
        });
      }
    } catch (e) {
      setState(() {
        _isConnected = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.backgroundSplashScreen,
            ),
          ),
          // Scaffold content
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  height: ScreenUtilNew.height(227),
                  width: ScreenUtilNew.width(191),
                  AssetsManger.splashImageNum1,
                  fit: BoxFit.contain,
                ),
              ),
              const Expanded(child: SizedBox()),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
                  );
                },
                child: Center(
                  child: SvgPicture.asset(
                    height: ScreenUtilNew.height(308),
                    width: ScreenUtilNew.width(336),
                    AssetsManger.logoApp,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset(
                  height: ScreenUtilNew.height(227),
                  width: ScreenUtilNew.width(191),
                  AssetsManger.splashImageNum2,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          //CircularProgressIndicator
          Padding(
            padding: EdgeInsets.only(top: ScreenUtilNew.height(600)),
            child: const Align(
              alignment: Alignment.topCenter,
              child: CircularProgressIndicator(
                color: AppColors.circularProgressIndicatorColorInSplashScreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/on_boarding/presentation/widgets/get_started_widget.dart';
import 'package:ghala_new_app/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../widgets/column_on_boarding_screen_widget.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int indexPageView = 0;
  String image1 = AssetsManger.onBoardingImageNum3;
  String image2 = AssetsManger.onBoardingImageNum2;
  late PageController pageController;
  bool isLastPage = false;
  Color colorButton=const Color(0XFF72B3C0);

  @override
  void initState() {
    pageController = PageController(initialPage: 2); // Start from the last page
    super.initState();
  }



  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenUtilNew.init(context); // Initialize ScreenUtil here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedCrossFade(
            firstChild: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              child: SizedBox(
                height: ScreenUtilNew.height(520),
                width: ScreenUtilNew.width(375),
                child: Image.asset(
                  image1,
                  height: ScreenUtilNew.height(520),
                  width: ScreenUtilNew.width(375),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            secondChild: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              child: Image.asset(
                image2,
                height: ScreenUtilNew.height(520),
                width: ScreenUtilNew.width(375),
                fit: BoxFit.cover,
              ),
            ),
            crossFadeState: indexPageView == 0
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
          ),
          Padding(
            padding:  EdgeInsets.only(top: ScreenUtilNew.height(540)),
            child: SizedBox(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: PageView(
                  // physics: Ne,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      indexPageView = index;
                      isLastPage = index == 0; // Adjust for reverse
                    });
                  },
                  children:  [
                    ColumnOnBoardingScreenWidget(title: context.localizations.onboarding3text1, subTitle: context.localizations.onboarding3text2,colorText: Color(0XFF72A7B9),),
                    ColumnOnBoardingScreenWidget(title: context.localizations.onboarding2text1, subTitle: context.localizations.onboarding2text2,colorText: Color(0XFF705A5A),),
                    ColumnOnBoardingScreenWidget(title:  context.localizations.onboarding1text1, subTitle: context.localizations.onboarding1text2,colorText: const Color(0XFF72A7B9),)
                  ],
                ),
              ),
            ),
          ),
          isLastPage
              ? Padding(
              padding: EdgeInsets.only(top: ScreenUtilNew.height(680),), child: const GetStartedWidget())
              : Padding(
            padding: EdgeInsets.only(top: ScreenUtilNew.height(710)),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width:ScreenUtilNew.width(24)
                  ),
                  // Next Button
                  GestureDetector(
                    onTap: (){
                      colorButton=const Color(0XFF6C2D26);
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn,
                      );
                      if(indexPageView==1){
                        image1 = AssetsManger.onBoardingImageNum1;
                        image2 = AssetsManger.onBoardingImageNum1;
                      }
                    },
                    child: Container(
                      width: ScreenUtilNew.width(92),
                      height: ScreenUtilNew.height(52),
                      decoration: BoxDecoration(
                          color:colorButton,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Center(
                        child: Text(
                          context.localizations.onboarding1text3,
                          style: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                  // Indicator
                  const Expanded(child: SizedBox()),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3, // Total number of pages
                    onDotClicked: (index) => pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    ),
                    effect:  WormEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: colorButton,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/assets.dart';
import '../../../../../core/utils/app_router.dart';
import 'animated_sliding_text.dart';
// import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  // AnimationController takes and gives value from 0 to 1
  // so we thing takes value and gives value to animation controller
  late AnimationController animationController;
  // animation to put above animation controller to take
  //bigger values
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    // we shoud make widget with SingleTickerProviderStateMixin to handle rate to changed values

    /////comment this add because i used AnimatedBuilder widget
    /// that listen in slidingAnimation
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });

     navigateToHome();   

  }
 
       
  @override
  void dispose() {
     
    super.dispose();

    animationController.dispose();
   
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsData.logo,
        ),
        const SizedBox(
          height: 6,
        ),
        AnimatedSlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);

    animationController.forward();

    /////comment this add because i used AnimatedBuilder widget
    /// that listen in slidingAnimation
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      //  Get.to(() => const HomePageView(),
      //       transition: Transition.fade,
      //        duration: kTransitionDuration);
      /////////////////////////////
      GoRouter.of(context).push(AppRouter.kHomePageView);
      /////////////////////////////
      // Navigator.push(
      //     context, new MaterialPageRoute(builder: (_) => HomePageView()));
    });
  }
}

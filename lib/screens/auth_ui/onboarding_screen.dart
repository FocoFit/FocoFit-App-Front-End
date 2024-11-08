import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/screens/auth_ui/welcome_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class KOnboardingScreen extends StatelessWidget {
  KOnboardingScreen({super.key});
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final List<String> images = [
    AppImages.onboardingImage1,
    AppImages.onboardingImage2,
    AppImages.onboardingImage3,
  ];
  final List<String> tittleText = [
    AppStrings.onboardingTitleFirst,
    AppStrings.onboardingTitleSecond,
    AppStrings.onboardingTitleThird,
  ];
  final List<String> subTitleText = [
    AppStrings.onboardingSubTitleFirst,
    AppStrings.onboardingSubTitleSecond,
    AppStrings.onboardingSubTitleThird,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(gradient: AppColor.primaryGradient),
            child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              onPageChanged: (index) {
                currentPage.value = index;
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:
            ClipPath(
              clipper: InwardCurveClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height*0.45,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: const  BoxDecoration(
                    color: AppColor.whiteColor,
                    boxShadow: [
                      AppColor.shadow
                    ]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(),
                    Obx(()=> KText(text: tittleText[currentPage.value],
                        textAlign: TextAlign.center,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(()=>KText(text: subTitleText[currentPage.value],
                        textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        images.length,
                            (index) => Obx(()=>AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 8,
                              width: currentPage.value == index ? 40 : 10,
                              decoration: BoxDecoration(
                              gradient: currentPage.value == index
                                  ? AppColor.primaryGradient
                                  : null,
                                color: currentPage.value == index
                                  ? null
                                  : AppColor.startGradient.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    kTextButton(
                      btnText: AppStrings.continuue,
                      onPressed: () {
                        if (currentPage.value < images.length - 1) {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                          currentPage.value++;
                        } else {
                          Get.off(() => const WelcomeScreen());
                        }
                      },
                      useGradient: true,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class InwardCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from the top left
    path.lineTo(0, 0);

    // Draw a curve inward from the center at the top
    var controlPoint = Offset(size.width / 2, 100); // Control point for the curve
    var endPoint = Offset(size.width, 0); // End point at the top right

    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    // Draw the remaining edges down to the bottom right
    path.lineTo(size.width, size.height); // Bottom right
    path.lineTo(0, size.height); // Bottom left
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}




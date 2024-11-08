import 'package:flutter/material.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/recipe_added.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class GeneratingRecipe extends StatefulWidget {
  const GeneratingRecipe({super.key});

  @override
  _GeneratingRecipeState createState() => _GeneratingRecipeState();
}

class _GeneratingRecipeState extends State<GeneratingRecipe> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<String> _loadingTexts = [
    '${AppStrings.analysingIngredients}...',
    '${AppStrings.creatingNewElement}...',
    '${AppStrings.generatingRevenue}...',
    '${AppStrings.pleaseWait}...',
  ];

  final RxInt _currentTextIndex = 0.obs;
  final RxBool _loadingCompleted = false.obs;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startTextRotation();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _loadingCompleted.value = true;
        });
        Future.delayed(const Duration(seconds: 1), () {
          Get.to(() => const RecipeAdded());
        });
      }
    });

    _colorAnimation = ColorTween(
      begin: AppColor.startGradient,
      end: AppColor.endGradient,
    ).animate(_animationController);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeIn),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.2),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  void _startTextRotation() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && !_loadingCompleted.value) {
        setState(() {
          _currentTextIndex.value = (_currentTextIndex.value + 1) % _loadingTexts.length;
        });
        _startTextRotation();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: (){
          Get.back();
        },
        title: AppStrings.createRecipe,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(AppImages.yellowStartImg),
              height: 250,
              width: 250,
            ),
            30.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    backgroundColor: AppColor.lightGreyColor,
                    borderRadius: BorderRadius.circular(12),
                    minHeight: 5,
                    valueColor: _colorAnimation,
                    value: _animationController.value,
                  );
                },
              ),
            ),
            30.height,

            // Slide and Fade transition for text
            if (!_loadingCompleted.value)
              SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: KText(text: _loadingTexts[_currentTextIndex.value],fontSize: 16,textAlign: TextAlign.center,),
                ),
              )
          ],
        ).paddingSymmetric(horizontal: 30, vertical: 10),
      ),
    );
  }
}

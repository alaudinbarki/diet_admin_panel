// import 'package:base_code/data/model/custom_model/recipe_model.dart';
import 'package:flutter/material.dart';

// import '../admin_receipe/dashboard/mobile_receipe.dart';
import 'dashbord/mobile_receipe.dart';
import 'dashbord/web_receipe.dart';

class DetailReceipeScreen extends StatelessWidget {
  // final RecipeModel? recipeModel;
  const DetailReceipeScreen({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    // final RecipeModel recipe =
    //     ModalRoute.of(context)!.settings.arguments as RecipeModel;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return WebDetailReceipeScreen(
              // recipe: recipe
              );
        } else {
          return const MobDetailReceipeScreen();
        }
      },
    );
  }
}

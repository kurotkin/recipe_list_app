import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_list_app/models/recipe.api.dart';
import 'package:recipe_list_app/models/recipe.dart';
import 'package:recipe_list_app/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return _HomePage();
  }
}

class _HomePage extends State {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();

  }

  Future<void> getRecipes() async{
    _recipes = await RecipeApi.getRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10,),
          Text("Рецепты")
        ],),
      ),
      body: RecipeCard(title: "title", rating: "4.3", cookTime: '30m', thumbnailUrl: 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360'),
    );
  }
}
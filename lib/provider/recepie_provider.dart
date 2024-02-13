// import 'dart:js_interop';
import 'dart:typed_data';

// import 'packae_code/view/widgets/extention/object_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

// import '../data/model/custom_model/recepies_model.dart';
import '../data/model/custom_model/recipe_model.dart';
import '../data/model/custom_model/tab_item_model.dart';
import '../utils/collection_string.dart';

class RecepieProvider extends ChangeNotifier {
  final CollectionReference _recipeCollection =
      FirebaseFirestore.instance.collection(FireStoreCollectionString.recepie);
  List<RecipeModel> recipeList = [];
  bool isLoading = false;

  final List<TabItem> tabs = [
    TabItem(label: 'All', count: '0'),
    TabItem(label: 'Drafts', count: '0'),
    TabItem(label: 'Trash', count: '0'),
    TabItem(label: 'Imported', count: '0'),
  ];
  final List<TabItem> courseTabs = [
    TabItem(label: 'All', count: '265'),
    TabItem(label: 'Drafts', count: '10'),
    TabItem(label: 'Published', count: '74'),
    TabItem(label: 'Bin', count: '8'),
  ];
  final List<TabItem> selectedLanguagesList = [
    TabItem(label: 'Afrikaans', count: ''),
    TabItem(label: 'English', count: ''),
  ];
  int selectedAddNewLanguage = 0; // Track the selected index

  // List<Recipe> recipeList = [
  //   Recipe(
  //     title: 'Chicken Salad with Mayonnaise Dressing',
  //     category: 'Chicken & Salad/Vegetables',
  //     author: 'Admin',
  //     uploadDate: '04-Aug-19 14:08',
  //     status: 'Published',
  //   ),
  // ];
  String dropdownValue = 'Select Category';
  String additonalCategoriesValue = 'Select Categories';

  // List of items in our dropdown menu
  var items = [
    'Select Category',
    'Pizza Items',
    'Pasta Items',
  ];
  var additionalItems = [
    'Select Categories',
    'Pasta ',
    'Pasta Items',
  ];

  Future<void> getRecipes() async {
    try {
      setLoading(true);
      QuerySnapshot<Object?> value = await _recipeCollection.get();
      print("🎉 GET request successful!");
      recipeList =
          value.docs.map((doc) => RecipeModel.fromSnapshot(doc)).toList();
      tabs[0].count = recipeList.length.toString();
      notifer();
    } catch (e) {
      print("❌ GET request failed: $e");
    } finally {
      setLoading(false);
    }
  }

  setLoading(bool value) {
    isLoading = value;
    notifer();
  }

  ////[Add Or Update Recipe]////////
  TextEditingController recipeTitle = TextEditingController();
  TextEditingController recipeUpdateDate = TextEditingController();
  TextEditingController autherName = TextEditingController();
  String selectedAutherName = '';
  TextEditingController uploadLang = TextEditingController();
  String photoPath = '';
  TextEditingController totalLikes = TextEditingController(text: '0');
  String selectedCategory = '';
  List<IngredientTextEditor> ingredients = <IngredientTextEditor>[];
  List<TextEditingController> methodText = <TextEditingController>[];
  Uint8List? selectedImage;

  Future updateTextEditor(RecipeModel data) async {
    selectedAutherName = data.author;
    recipeTitle = TextEditingController(text: data.title);
    autherName = TextEditingController(text: data.author);
    recipeUpdateDate = TextEditingController(text: data.updateDate.toString());
    uploadLang = TextEditingController(text: data.languageCode);
    photoPath = data.headerImage;
    totalLikes = TextEditingController(text: data.totalLikes);
    selectedCategory = data.categoryList.first;
    for (var ingredient in data.allIngredients) {
      IngredientTextEditor newIGEditor = IngredientTextEditor(
          amount: ingredient.amount.toString(),
          unit: ingredient.unit,
          name: ingredient.name,
          notes: ingredient.notes);
      // Map<String, TextEditingController> map = {
      //   'amount': TextEditingController(text: ingredient.amount.toString()),
      //   'unit': TextEditingController(text: ingredient.unit.toString()),
      //   'name': TextEditingController(text: ingredient.name.toString()),
      //   'notes': TextEditingController(text: ingredient.notes.toString()),
      // };
      ingredients.add(newIGEditor);
    }
    List<String> methods = separateSteps(data.method);
    for (var meth in methods) {
      TextEditingController editingController =
          TextEditingController(text: meth);
      methodText.add(editingController);
    }
  }

  pickImageFromFiles() async {
    Uint8List? image = await ImagePickerWeb.getImageAsBytes();

    selectedImage = image;
    notifyListeners();
  }

  notifer() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  List<String> separateSteps(String string) {
    List<String> steps = [];
    RegExp regex = RegExp(r'\d+\.\s');
    List<String> splitText = string.split(regex);
    splitText.removeWhere((element) => element.isEmpty);
    for (String step in splitText) {
      steps.add(step.trim());
    }

    return steps;
  }
}

// import 'dart:js_interop';
import 'dart:typed_data';

// import 'packae_code/view/widgets/extention/object_extension.dart';
import 'package:base_code/data/model/custom_model/recipe_category_model.dart';
import 'package:base_code/provider/utils_provider.dart';
import 'package:base_code/utils/date_time_format.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

// import '../data/model/custom_model/recepies_model.dart';
import '../data/model/custom_model/recipe_model.dart';
import '../data/model/custom_model/tab_item_model.dart';
import '../utils/collection_string.dart';
import '../utils/toast.dart';

class RecepieProvider extends ChangeNotifier {
  final CollectionReference _recipeCollection =
      FirebaseFirestore.instance.collection(FireStoreCollectionString.recepie);
  final CollectionReference _recipeCategoryCollection = FirebaseFirestore
      .instance
      .collection(FireStoreCollectionString.recipesCategories);
  List<RecipeModel> recipeList = [];
  List<RecipeCategoryModel> recipeCategoryList = [];
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
  RecipeCategoryModel? dropdownValue;
  RecipeCategoryModel? additonalCategoriesValue;

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
      print("🎉 GET [!!!!===> Recipe <===!!!!] request successful!");
      recipeList =
          value.docs.map((doc) => RecipeModel.fromSnapshot(doc)).toList();
      tabs[0].count = recipeList.length.toString();
      notifer();
    } catch (e) {
      print("❌ GET [!!!!===> Recipe <===!!!!] request failed: $e");
    } finally {
      setLoading(false);
    }
  }

  Future<void> getCategories() async {
    try {
      setLoading(true);
      QuerySnapshot<Object?> value = await _recipeCategoryCollection.get();
      print("🎉 GET [!!!!===> Categories <===!!!!] request successful!");
      recipeCategoryList = value.docs
          .map((doc) => RecipeCategoryModel.fromSnapshot(doc))
          .toList();

      // tabs[0].count = recipeList.length.toString();
      notifer();
    } catch (e) {
      print("❌ GET [!!!!===> Categories <===!!!!] request failed: $e");
    } finally {
      setLoading(false);
    }
  }

  void listforNewRecipe() {
    IngredientTextEditor heading = IngredientTextEditor(
        amountController: TextEditingController(),
        unitController: TextEditingController(),
        nameController: TextEditingController(),
        notesController: TextEditingController(),
        ingredientHeading: TextEditingController(),
        type: 'heading');
    IngredientTextEditor ingre = IngredientTextEditor(
        amountController: TextEditingController(),
        unitController: TextEditingController(),
        nameController: TextEditingController(),
        notesController: TextEditingController(),
        ingredientHeading: TextEditingController(),
        type: 'ingredient');
    ingredients = [heading];
    if (ingredients.isNotEmpty) {
      ingredients.add(ingre);
    }
  }

  void newMethod() {
    RecipeMethods heading = RecipeMethods(instruction: '', type: 'heading');
    RecipeMethods ingre = RecipeMethods(instruction: '', type: 'method');
    // methodText = [heading];
    // if (heading.instructionName.text.isNotEmpty) {
    methodText.add(heading);
    // }
    // if (ingre.instructionName.text.isNotEmpty) {
    methodText.add(ingre);
    // }
  }

  addMethods(String type) {
    RecipeMethods ingre = RecipeMethods(
        type: type == 'heading' ? "heading" : 'method', instruction: '');
    methodText.add(ingre);
    notifyListeners();
  }

  removeMethod(int index) {
    methodText.removeAt(index);
    notifyListeners();
  }

  addIngredient(String type) {
    IngredientTextEditor ingre = IngredientTextEditor(
        amountController: TextEditingController(),
        unitController: TextEditingController(),
        nameController: TextEditingController(),
        notesController: TextEditingController(),
        ingredientHeading: TextEditingController(),
        type: type == 'heading' ? "heading" : 'ingredient');
    ingredients.add(ingre);
    notifyListeners();
  }

  removeIngredient(int index) {
    ingredients.removeAt(index);
    notifyListeners();
  }

  setLoading(bool value) {
    isLoading = value;
    notifer();
  }

  ////[Add Or Update Recipe]////////
  TextEditingController recipeTitle = TextEditingController();
  TextEditingController recipeUpdateDate =
      TextEditingController(text: 'Select Date');
  DateTime selectedTime = DateTime.now();
  TextEditingController autherName = TextEditingController();
  String selectedAutherName = '';
  TextEditingController uploadLang = TextEditingController();
  String photoPath = '';
  TextEditingController totalLikes = TextEditingController(text: '0');
  String selectedCategory = '';
  List<IngredientTextEditor> ingredients = <IngredientTextEditor>[];
  List<RecipeMethods> methodText = <RecipeMethods>[];
  TextEditingController notes = TextEditingController();
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
          amountController:
              TextEditingController(text: ingredient.amount.toString()),
          unitController: TextEditingController(text: ingredient.unit),
          nameController: TextEditingController(text: ingredient.name),
          notesController: TextEditingController(text: ingredient.notes),
          type: ingredient.type,
          ingredientHeading: TextEditingController(text: ingredient.heading));
      ingredients.add(newIGEditor);
    }
    // List<String> methods = separateSteps(data.method);
    // for (var meth in methods) {
    //   TextEditingController editingController =
    //       TextEditingController(text: meth);
    //   // methodText.add(editingController);
    // }
  }

  Future _add(String image, BuildContext context) async {
    List<Methods> updateMethod = [];
    List<Ingredients> allIngredient = [];
    for (var element in methodText) {
      Methods me = Methods(
          type: element.instructionType, method: element.instructionName.text);
      updateMethod.add(me);
    }
    for (var ele in ingredients) {
      Ingredients ingre = Ingredients(
        amount:
            ele.amountController.text.isEmpty ? '0' : ele.amountController.text,
        name: ele.nameController.text,
        unit: ele.unitController.text,
        notes: ele.notesController.text,
        type: ele.type,
        heading: ele.ingredientHeading.text,
      );
      allIngredient.add(ingre);
    }

    List<String> categoryList = [];
    if (dropdownValue != null) {
      categoryList.add(dropdownValue!.id);
    }
    if (additonalCategoriesValue != null) {
      categoryList.add(additonalCategoriesValue!.id);
    }
    Map<String, int> ingreMap = {"Carrots": 0, "Potatoes": 0, "Tomatoes": 0};
    String id = _recipeCollection.doc().id;
    RecipeModel recipe = RecipeModel(
        afrID: '',
        categoryList: categoryList,
        engID: '',
        favouritedBy: [],
        headerImage: image,
        id: id,
        ingredients: '',
        ingredientsMap: ingreMap,
        allIngredients: allIngredient,
        isPremium: true,
        languageCode: selectedAddNewLanguage == 0 ? 'afr' : 'en',
        method: updateMethod,
        notes: notes.text,
        title: recipeTitle.text,
        updateDate: selectedTime,
        author: autherName.text,
        status: true,
        totalLikes: '');
    try {
      _recipeCollection.add(recipe.toMap()).then((value) {
        setLoading(false);
        ShowToasts.showSuccessToast(
            title: "Successful !",
            message: "Recipe successfully added",
            context: context);
      });
    } catch (e) {
      setLoading(false);
      ShowToasts.showInfo(
          title: "Error", message: "Something went wrong", context: context);
      print(
          "<==============Upload Profile Picture Error=====$e====================>");
    }
  }

  Future addRecipe(
    BuildContext context,
  ) async {
    setLoading(true);
    Reference imageRef = FirebaseStorage.instance
        .ref()
        .child('recipe')
        .child('/${DateTime.now().millisecondsSinceEpoch}');
    try {
      if (selectedImage != null) {
        var metadata = SettableMetadata(
          contentType: "image/jpeg",
        );
        await imageRef.putData(selectedImage!, metadata).whenComplete(() async {
          final String url = await imageRef.getDownloadURL();

          _add(url, context);
          selectedImage = null;
        });
      } else {
        setLoading(false);
        ShowToasts.showInfo(
            title: "Required *",
            message: "Please Select Image",
            context: context);
      }
    } on FirebaseException catch (e) {
      setLoading(false);
      ShowToasts.showInfo(
          title: "Error", message: "Something went wrong", context: context);
      print(
          "<==============Upload Recipe Picture Error=====$e====================>");
    }
  }

  pickImageFromFiles() async {
    Uint8List? image = await ImagePickerWeb.getImageAsBytes();

    selectedImage = image;
    notifyListeners();
  }

  Future pickDate(BuildContext context) async {
    final UtilProvider utils = UtilProvider();
    selectedTime = (await utils.selectDate(context)) ?? DateTime.now();
    String updateDate = formatDate(selectedTime);
    recipeUpdateDate = TextEditingController(text: updateDate);
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

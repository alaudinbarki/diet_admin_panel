// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:base_code/provider/utils_provider.dart';
import 'package:base_code/utils/collection_string.dart';
import 'package:base_code/utils/date_time_format.dart';
import 'package:base_code/utils/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:uuid/uuid.dart';

import '../data/model/custom_model/course_model.dart';
import '../data/model/custom_model/tab_item_model.dart';
import '../utils/images.dart';

class CoursesProvider extends ChangeNotifier {
  final CollectionReference _coursesCollection =
      FirebaseFirestore.instance.collection(FireStoreCollectionString.courses);
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController discountPrice = TextEditingController();
  TextEditingController accessPeriod = TextEditingController();
  TextEditingController moduleName = TextEditingController();
  TextEditingController activeEnroll = TextEditingController(text: '0');
  TextEditingController totalEnroll = TextEditingController(text: '0');

  TextEditingController lessionTitle = TextEditingController();
  Module? selectedModule;
  Uint8List? media;
  String mediaType = 'None';
  HtmlEditorController lessionDescription = HtmlEditorController();

  Uint8List? selectedImage;
  Uint8List? selectedLessionImage;
  // String activeEnroll = '0';
  // String totalEnroll = '0';

  TextEditingController uploadDateEditor =
      TextEditingController(text: 'Select Date');
  TextEditingController startDateEditor =
      TextEditingController(text: 'Select Date');
  TextEditingController discountStartDateEditor =
      TextEditingController(text: 'Select Date');
  TextEditingController discountEndDateEditor =
      TextEditingController(text: 'Select Date');

  DateTime _uploadDate = DateTime.now();
  DateTime _startDate = DateTime.now();
  DateTime _discountStartDate = DateTime.now();
  DateTime _discountEndDate = DateTime.now();

  DateTime get uploadDate => _uploadDate;
  DateTime get startDate => _startDate;
  DateTime get discountStartDate => _discountStartDate;
  DateTime get discountEndDate => _discountEndDate;

  List<Module> moduleList = [];

  List<CourseModel> coursesData = [];

  final List<TabItem> courseTabs = [
    TabItem(label: 'All', count: '265'),
    TabItem(label: 'Drafts', count: '10'),
    TabItem(label: 'Published', count: '74'),
    TabItem(label: 'Bin', count: '8'),
  ];
  // List<Lesson> lessionList = [];

  bool loading = false;

  Map<String, dynamic> selected = {
    "name": "None",
    'image': AppIcon.mediaNone,
    'selected': null
  };
  List<Map<String, dynamic>> mediaList = [
    {"name": "None", 'image': AppIcon.mediaNone, 'selected': null},
    {'name': 'Video', 'image': AppIcon.mediaVideo, 'selected': null},
    {'name': 'Audio', 'image': AppIcon.mediaMic, 'selected': null},
    {'name': 'Image', 'image': AppIcon.mediaCamera, 'selected': null},
  ];

  void onContainerTap(int index) {
    selected = mediaList[index];
    if (selected['name'] != "None") {
      pickLessionImage(index);
    }
    notifyListeners();
  }

  void addModule(BuildContext context) {
    List<Lesson> lesson = [];
    if (moduleName.text.isNotEmpty) {
      Module module = Module(
          id: const Uuid().v8(),
          moduleName: moduleName.text,
          status: "Published",
          lessons: lesson);
      moduleList.add(module);
      ShowToasts.showSuccessToast(
          title: "Success",
          message: "Module Added successfully !",
          context: context);
      moduleName = TextEditingController(text: '');
    } else {
      ShowToasts.showInfo(
          title: "Required*",
          message: "Please Enter module name !",
          context: context);
    }
    notifyListeners();
  }

  void removeModule(int index) {
    if (index < moduleList.length) {
      moduleList.removeAt(index);
    }
    notifyListeners();
  }

  pickImageFromFiles() async {
    Uint8List? image = await ImagePickerWeb.getImageAsBytes();

    selectedImage = image;
    notifyListeners();
  }

  pickLessionImage(int index) async {
    Uint8List? image = await ImagePickerWeb.getImageAsBytes();

    selectedLessionImage = image;
    mediaList[index]['selected'] = image;
    notifyListeners();
  }

  void setUploadDate(DateTime date) {
    _uploadDate = date;
    uploadDateEditor = TextEditingController(text: formatDate(date));
    notifyListeners();
  }

  void setStartDate(DateTime date) {
    _startDate = date;
    startDateEditor = TextEditingController(text: formatDate(date));
    notifyListeners();
  }

  void setDiscountStartDate(DateTime date) {
    _discountStartDate = date;
    discountStartDateEditor = TextEditingController(text: formatDate(date));
    notifyListeners();
  }

  void setDiscountEndDate(DateTime date) {
    _discountEndDate = date;
    discountEndDateEditor = TextEditingController(text: formatDate(date));
    notifyListeners();
  }

  Future pickDate(BuildContext context, Function(DateTime) callback) async {
    final UtilProvider utils = UtilProvider();
    DateTime selectedDate = await utils.selectDate(context) ?? DateTime.now();
    callback(selectedDate);
  }

  void addLession(BuildContext context) async {
    if (lessionTitle.text.isNotEmpty && selectedModule != null) {
      String des = await lessionDescription.getText();
      mediaType = selected['name'];
      print(
          "$des                                       Description============================>");
      Lesson lesson = Lesson(
        title: lessionTitle.text,
        moduleId: selectedModule!.id,
        mediaLink: selectedLessionImage,
        mediaType: mediaType,
        description: des,
        downloadFile: [],
        status: 'Published',
      );
      for (var i = 0; i < moduleList.length; i++) {
        if (moduleList[i].id == selectedModule!.id) {
          moduleList[i].lessons.add(lesson);
        }
      }
      selectedModule = null;
      mediaType = '';
      lessionTitle = TextEditingController(text: '');
      selectedLessionImage = null;
      if (context.mounted) {
        ShowToasts.showSuccessToast(
            title: "Success",
            message: "Lesson successfully added",
            context: context);
        Navigator.pop(context);
      }
      // notifyListeners();
    } else {
      ShowToasts.showInfo(
          title: "Required*",
          message: "Please fill the fields",
          context: context);
    }
    notifyListeners();
  }

  Future<void> getCourses() async {
    try {
      setLoading(true);
      QuerySnapshot<Object?> value = await _coursesCollection.get();
      print("🎉 GET [!!!!===> Courses <===!!!!] request successful!");
      coursesData =
          value.docs.map((doc) => CourseModel.fromSnapshot(doc)).toList();

      // tabs[0].count = recipeList.length.toString();
      notifyListeners();
    } catch (e) {
      print("❌ GET [!!!!===> Courses <===!!!!] request failed: $e");
    } finally {
      setLoading(false);
    }
  }

  Future<void> addCourse({required BuildContext context}) async {
    setLoading(true);
    Reference imageRef = FirebaseStorage.instance
        .ref()
        .child('course')
        .child('/${DateTime.now().millisecondsSinceEpoch}');

    Reference lessionImage = FirebaseStorage.instance
        .ref()
        .child('courseLesson')
        .child('/${DateTime.now().millisecondsSinceEpoch}');
    try {
      if (selectedImage != null) {
        var metadata = SettableMetadata(
          contentType: "image/jpeg",
        );
        List<ModuleUpdate> module = [];
        await imageRef.putData(selectedImage!, metadata).whenComplete(
          () async {
            final String url = await imageRef.getDownloadURL();
            for (var i = 0; i < moduleList.length; i++) {
              for (var j = 0; j < moduleList[i].lessons.length; j++) {
                ModuleUpdate update = ModuleUpdate(
                  id: moduleList[i].id,
                  moduleName: moduleList[i].moduleName,
                  status: moduleList[i].status,
                  lessons: [],
                );
                module.add(update);
                if (moduleList[i].lessons[j].mediaLink != null) {
                  await lessionImage
                      .putData(moduleList[i].lessons[j].mediaLink!, metadata)
                      .whenComplete(
                    () async {
                      final String imageUrl =
                          await lessionImage.getDownloadURL();
                      LessonUpdate lessonUpdate = LessonUpdate(
                          title: moduleList[i].lessons[j].title,
                          moduleId: moduleList[i].lessons[j].moduleId,
                          mediaLink: imageUrl,
                          mediaType: moduleList[i].lessons[j].mediaType,
                          description: moduleList[i].lessons[j].description,
                          downloadFile: moduleList[i].lessons[j].downloadFile,
                          status: moduleList[i].lessons[j].status);
                      module[i].lessons.add(lessonUpdate);
                    },
                  );
                } else {
                  LessonUpdate lessonUpdate = LessonUpdate(
                      title: moduleList[i].lessons[j].title,
                      moduleId: moduleList[i].lessons[j].moduleId,
                      mediaLink: '',
                      mediaType: moduleList[i].lessons[j].mediaType,
                      description: moduleList[i].lessons[j].description,
                      downloadFile: moduleList[i].lessons[j].downloadFile,
                      status: moduleList[i].lessons[j].status);
                  module[i].lessons.add(lessonUpdate);
                }
              }
            }
            selectedImage = null;
            if (context.mounted) {
              addCourseFirebase(
                  imageUrl: url, module: module, context: context);
            }
          },
        );
      } else {
        setLoading(false);
        ShowToasts.showInfo(
            title: "Required *",
            message: "Please Select Image",
            context: context);
      }
    } on FirebaseException catch (e) {
      setLoading(false);
      if (context.mounted) {
        ShowToasts.showInfo(
            title: "Error", message: "Something went wrong", context: context);
      }
      print(
          "<==============Upload Course Picture Error=====$e====================>");
    }
  }

  Future addCourseFirebase(
      {required String imageUrl,
      required List<ModuleUpdate> module,
      required BuildContext context}) async {
    CourseModel course = CourseModel(
      image: imageUrl,
      title: title.text,
      uploadDate: uploadDate,
      totalEnroll: totalEnroll.text,
      activeEnroll: activeEnroll.text,
      accessPeriod: accessPeriod.text,
      startDate: startDate,
      shortDescription: description.text,
      pricing: price.text,
      discountedPrice: discountPrice.text,
      discountStartDate: discountStartDate,
      discountEndDate: discountEndDate,
      modules: module,
      createdAt: DateTime.now(),
    );
    try {
      _coursesCollection.add(course.toMap()).then((value) {
        setLoading(false);
        ShowToasts.showSuccessToast(
            title: "Successful !",
            message: "Course successfully added",
            context: context);
      });
    } catch (e) {
      setLoading(false);
      ShowToasts.showInfo(
          title: "Error", message: "Something went wrong", context: context);
      print("<============== Adding Course =====$e====================>");
    }
  }

  Future<void> updateCourseInfo() async {}
  void notifier() {
    notifyListeners();
  }

  void setLoading(bool val) => loading = val;
}

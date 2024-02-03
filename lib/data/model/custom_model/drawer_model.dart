class DrawerItems {
  final String? image;
  final String title;
  final String? path;
  final List<DrawerItems>? subItems;
  bool isExpanded; // Property to track if the item is expanded
  bool isSelected; // Property to track if the item is selected

  DrawerItems({
    this.image,
    required this.title,
    this.path,
    this.subItems,
    this.isExpanded = false,
    this.isSelected = false, // Default to not selected
  });

  bool get isExpandable => subItems != null && subItems!.isNotEmpty;
}

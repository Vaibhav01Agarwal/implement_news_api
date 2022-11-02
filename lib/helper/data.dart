import 'package:implement_api2/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = CategoryModel();

  //1
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //2
  categoryModel.categoryName = "entertainment";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1427301229091-8cd171473e32?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1771&q=80";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //3
  categoryModel.categoryName = "general";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //4
  categoryModel.categoryName = "health";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //5
  categoryModel.categoryName = "science";
  categoryModel.imageUrl =
      "https://plus.unsplash.com/premium_photo-1661274159117-fd9939ef2ed0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //6
  categoryModel.categoryName = "sports technology";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1593051500991-b723adf3b770?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2166&q=80";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //7
  categoryModel.categoryName = "sources";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1503524921528-8f5fa912ea75?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  return category;
}

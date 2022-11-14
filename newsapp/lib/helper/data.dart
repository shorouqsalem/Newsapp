import '../models/catigory_model.dart';

List<CategoryModel>getCategories(){
List<CategoryModel>category=<CategoryModel>[];
CategoryModel categoryModel=CategoryModel();
//1
categoryModel.categoryName="Bussines";
categoryModel.imageUrl="https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2015&q=80";
category.add(categoryModel);
categoryModel=CategoryModel();

//2
categoryModel.categoryName="Sport";
categoryModel.imageUrl="https://images.unsplash.com/photo-1565992441121-4367c2967103?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80";
category.add(categoryModel);
categoryModel=CategoryModel();

//3
categoryModel.categoryName="Technology";
categoryModel.imageUrl="https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
category.add(categoryModel);
categoryModel=CategoryModel();

//4
categoryModel.categoryName="General";
categoryModel.imageUrl="https://images.unsplash.com/photo-1493612276216-ee3925520721?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80";
category.add(categoryModel);
categoryModel=CategoryModel();

//5
categoryModel.categoryName="Enviroment";
categoryModel.imageUrl="https://images.unsplash.com/photo-1472313420546-a46e561861d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80";
category.add(categoryModel);
categoryModel=CategoryModel();
return category;
}
import 'package:flutter/material.dart';
import '../helpers/product.dart';
import '../models/products.dart';

class ProductProvider with ChangeNotifier {
  ProductServices _productServices = ProductServices();
  List<ProductModel> products = [];
  List<ProductModel> honeyCategory = [];
  List<ProductModel> grainsCategory = [];
  List<ProductModel> dietFoodCategory = [];
  List<ProductModel> spirulinaCategory = [];
  List<ProductModel> oilCategory = [];
  List<ProductModel> specialFoodCategory = [];
  List<ProductModel> herbsCategory = [];
  List<ProductModel> beautyCategory = [];
  List<ProductModel> productsSearched = [];

  ProductProvider.initialize() {
    // loadProducts();
    loadHoneyCategory(categoryName: 'honey');
    loadGrainsCategory(categoryName: 'grains');
    loadDietFoodCategory(categoryName: 'dietFood');
    loadSpirulinaCategory(categoryName: 'spirulina');
    loadOilCategory(categoryName: 'oil');
    loadSpecialFoodCategory(categoryName : 'specailFood');
    loadHerbsCategory(categoryName: 'herbs');
    loadBeautyCategory(categoryName: 'beauty');
  }

  // All Products

  // loadProducts() async {
  //   products = await _productServices.getProducts();
  //   notifyListeners();
  // }

  // Honey Category

  Future loadHoneyCategory({String categoryName}) async {
    honeyCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // Grains Category

  Future loadGrainsCategory({String categoryName}) async {
    grainsCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // DietFood Category

  Future loadDietFoodCategory({String categoryName}) async {
    dietFoodCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // Spirulina Category

  Future loadSpirulinaCategory({String categoryName}) async {
    spirulinaCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // Oil Category

  Future loadOilCategory({String categoryName}) async {
    oilCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // Special Food

   Future loadSpecialFoodCategory({String categoryName}) async {
    specialFoodCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // herbs

   Future loadHerbsCategory({String categoryName}) async {
    herbsCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // Beauty

   Future loadBeautyCategory({String categoryName}) async {
    beautyCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // Search

  Future search({String productName}) async {
    productsSearched =
        await _productServices.searchProducts(productName: productName);
    notifyListeners();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_projects/models/catiegory_model.dart';
import 'package:flutter_projects/models/product_model.dart';
class MyFirebaseFirestore {

FirebaseFirestore firestore = FirebaseFirestore.instance;
Future<List<CategoryModel>> readCategory() async {
  List<CategoryModel> itemsList = [];

  QuerySnapshot snapshot =
      await firestore.collection('categories').get();

  print('NUMBER OF DOCUMENTS = ${snapshot.docs.length}');

  for (var doc in snapshot.docs) {
    print('DOCUMENT DATA = ${doc.data()}');

    itemsList.add(
      CategoryModel.fromJson(
        doc.data() as Map<String, dynamic>,
      ),
    );
  }

  print('ITEMS LIST LENGTH = ${itemsList.length}');

  return itemsList;
}
Future<List<ProductModel>> readProduct() async {
  List<ProductModel> itemsList = [];

  QuerySnapshot snapshot =
      await firestore.collection('products').get();

  print('NUMBER OF DOCUMENTS = ${snapshot.docs.length}');

  for (var doc in snapshot.docs) {
    print('DOCUMENT DATA = ${doc.data()}');

    itemsList.add(
      ProductModel.fromJson(
        doc.data() as Map<String, dynamic>,
      ),
    );
  }

  print('ITEMS LIST LENGTH = ${itemsList.length}');

  return itemsList;
}
Future<List<ProductModel>> readProductSale() async {
  List<ProductModel> itemsList = [];

  QuerySnapshot snapshot =
      await firestore.collection('sale').get();

  print('NUMBER OF DOCUMENTS = ${snapshot.docs.length}');

  for (var doc in snapshot.docs) {
    print('DOCUMENT DATA = ${doc.data()}');

    itemsList.add(
      ProductModel.fromJsonForSale(
        doc.data() as Map<String, dynamic>,
      ),
    );
  }

  print('ITEMS LIST LENGTH = ${itemsList.length}');

  return itemsList;
}

}
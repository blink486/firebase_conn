import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
        await firebaseFirestore.collection(collection).get();

    return snapshot.docs;
  }

  Future queryData(String queryString) {
    return FirebaseFirestore.instance
        .collection('new_biz_add')
        .where('f06service_radius', isGreaterThanOrEqualTo: queryString)
        .get();
  }
}

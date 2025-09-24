import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get uid => _auth.currentUser!.uid;

  Future<void> addItem(String section, Map<String, dynamic> data) async {
    await _db.collection('users').doc(uid).collection(section).add(data);
  }

  Stream<QuerySnapshot> getItems(String section) {
    return _db.collection('users').doc(uid).collection(section).snapshots();
  }

  Future<void> deleteItem(String section, String docId) async {
    await _db
        .collection('users')
        .doc(uid)
        .collection(section)
        .doc(docId)
        .delete();
  }
}

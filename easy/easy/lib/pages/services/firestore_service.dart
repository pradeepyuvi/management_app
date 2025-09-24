import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference blocklist = FirebaseFirestore.instance.collection(
    'blocklist',
  );
  final CollectionReference customerDetails = FirebaseFirestore.instance
      .collection('customerDetails');

  // Add blocklist entry
  Future<void> addBlocklistEntry({
    required String name,
    required String aadhaar,
    required String reason,
    String? imageUrl,
  }) async {
    await blocklist.add({
      'name': name,
      'aadhaar': aadhaar,
      'reason': reason,
      'imageUrl': imageUrl ?? '',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Stream blocklist entries
  Stream<QuerySnapshot> getBlocklistStream() {
    return blocklist.orderBy('timestamp', descending: true).snapshots();
  }

  // Stream customer details
  Stream<QuerySnapshot> getCustomerDetailsStream() {
    return customerDetails.orderBy('checkIn', descending: true).snapshots();
  }

  // Add customer details
  Future<void> addCustomerDetails({
    required String name,
    required String mobile,
    required String aadhaar,
    required String address,
    required String gender,
    required String roomNo,
    required String sharing,
    required String checkIn,
    String? imageUrl,
  }) async {
    await customerDetails.add({
      'name': name,
      'mobile': mobile,
      'aadhaar': aadhaar,
      'address': address,
      'gender': gender,
      'roomNo': roomNo,
      'sharing': sharing,
      'checkIn': checkIn,
      'imageUrl': imageUrl ?? '',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> incrementBlocklistCount() async {
    final docRef = FirebaseFirestore.instance.collection('stats').doc('counts');

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(docRef);

      final data = snapshot.data();
      final currentCount = data != null && data.containsKey('blocklistCount')
          ? data['blocklistCount'] as int
          : 0;

      transaction.set(docRef, {
        'blocklistCount': currentCount + 1,
      }, SetOptions(merge: true));
    });
  }

  // Update total beds count from availableRooms collection
  Future<void> updateTotalBedsCount() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('availableRooms')
        .get();
    int totalBeds = 0;
    for (var doc in snapshot.docs) {
      final data = doc.data();
      final beds = int.tryParse(data['bedcount'].toString()) ?? 0;
      totalBeds += beds;
    }
    final statsRef = FirebaseFirestore.instance
        .collection('stats')
        .doc('counts');
    await statsRef.set({'bedsCount': totalBeds}, SetOptions(merge: true));
  }

  Future<void> updateCustomerCount() async {
    final snapshot = await customerDetails
        .where('checkOut', isEqualTo: null)
        .get();
    final activeCount = snapshot.size;

    final statsRef = FirebaseFirestore.instance
        .collection('stats')
        .doc('counts');
    await statsRef.set({'customerCount': activeCount}, SetOptions(merge: true));
  }

  Future<void> updateUnpaidCustomerCount() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('paymentsPage')
        .where('paymentStatus', isEqualTo: 'not paid')
        .get();

    final unpaidCount = snapshot.size;

    final statsRef = FirebaseFirestore.instance
        .collection('stats')
        .doc('counts');
    await statsRef.set({
      'unpaidCustomerCount': unpaidCount,
    }, SetOptions(merge: true));
  }
}

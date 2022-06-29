// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:golaundry/pages/models/customer.dart';
import 'package:golaundry/pages/models/laundries.dart';

import '../pages/models/message.dart';
import '../pages/widgets/utils.dart';

class FirebaseApi {
  static Stream<List<Customers>> getCustomers() => FirebaseFirestore.instance
      .collection('customers')
      .snapshots()
      .transform(Utils.transformer(Customers.fromJson));

  static Stream<List<Customers>> getCustomersChatList() =>
      FirebaseFirestore.instance
          .collection('customers')
          .orderBy(UserField.lastMessageTime, descending: true)
          .snapshots()
          .transform(Utils.transformer(Customers.fromJson));

  static Stream<List<Laundries>> getLaundries() => FirebaseFirestore.instance
      .collection('admins')
      .snapshots()
      .transform(Utils.transformer(Laundries.fromJson));

  static Stream<List<Laundries>> getLaundriesChatList() =>
      FirebaseFirestore.instance
          .collection('admins')
          .orderBy(UserField.lastMessageTime, descending: true)
          .snapshots()
          .transform(Utils.transformer(Laundries.fromJson));

  static Future uploadCustMessage(
      //message created by cust
      String userId,
      String message,
      String id_laundry) async {
    final refMessages = FirebaseFirestore.instance
        .collection('Chat/$id_laundry$userId/Messages');
    final refCustomers = FirebaseFirestore.instance.collection('customers');
    var custSnapshot = await refCustomers.doc(userId).get();
    Map<String, dynamic>? custData = custSnapshot.data();

    final newMessage = Message(
      userId: userId,
      email: custData!['cust_email'],
      message: message,
      userType: 'customer',
      messageTo: id_laundry,
      createdAt: DateTime.now(),
    );
    await refMessages.add(newMessage.toJson());

    await refCustomers
        .doc(userId)
        .update({UserField.lastMessageTime: DateTime.now()});
  }

  static Future uploadLaundryMessage(
      //message created by tech
      String userId,
      String message,
      String id_cust) async {
    final refMessages =
        FirebaseFirestore.instance.collection('Chat/$userId$id_cust/Messages');
    final refLaundry = FirebaseFirestore.instance.collection('admins');
    var laundrySnapshot = await refLaundry.doc(userId).get();
    Map<String, dynamic>? laundryData = laundrySnapshot.data();

    final newMessage = Message(
      userId: userId,
      email: laundryData!['laundry_email'],
      message: message,
      userType: 'laundry',
      messageTo: id_cust,
      createdAt: DateTime.now(),
    );
    await refMessages.add(newMessage.toJson());

    await refLaundry
        .doc(userId)
        .update({UserField.lastMessageTime: DateTime.now()});
  }

  static Stream<List<Message>> getCustMessages(String id_cust, String userId) =>
      FirebaseFirestore.instance
          .collection('Chat')
          .doc(userId + id_cust)
          .collection('Messages')
          // .where('messageTo', whereIn: [custId, userId])
          .orderBy('createdAt', descending: true)
          .snapshots()
          .transform(Utils.transformer(Message.fromJson));

  static Stream<List<Message>> getLaundryMessages(
          String id_laundry, String userId) =>
      FirebaseFirestore.instance
          .collection('Chat')
          .doc(id_laundry + userId)
          .collection('Messages')
          // .where('messageTo', isEqualTo: techId)
          .orderBy('createdAt', descending: true)
          .snapshots()
          .transform(Utils.transformer(Message.fromJson));
}

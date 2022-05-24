import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _usersCollection = _firestore.collection('Users');

class FireStoreService {
  static String? userUid;

  static Future<void> createUser({
    required String? phoneNumber,
    required String? mail,
    required String? uid,
    required String? userName,
  }) async {
    DocumentReference documentReferencer = _usersCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "phoneNumber": phoneNumber,
      "mail": mail,
      "uid": uid,
      "userName": userName
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => {
              print("user created to the database"),
            })
        .catchError((e) => {print(e)});
  }
}

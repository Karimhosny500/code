import 'package:cloud_firestore/cloud_firestore.dart';
import 'Clients.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  addClients(Clients clientsData) async {
    await _db.collection("Clients").add(clientsData.toJson());
  }

  updateEmployee(Clients clientdata) async {
    await _db
        .collection("Clients")
        .doc(clientdata.id)
        .update(clientdata.toJson());
  }

  Future<void> deleteEmployee(String documentId) async {
    await _db.collection("Clients").doc(documentId).delete();
  }

  // Future<List<Client>> retrieveClients() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot =
  //       await _db.collection("Clients").get();
  //   return snapshot.docs
  //       .map((docSnapshot) => Clients.fromDocumentSnapshot(docSnapshot))
  //       .toList();
  // }
}

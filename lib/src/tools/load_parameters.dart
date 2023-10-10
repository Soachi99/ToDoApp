import 'dart:developer';

import 'package:todoapp/common/firebase_cloud_service.dart';

class LoadParameters {
  Future<bool> screenSecurity() async {
    bool security = true;

    try {
      await firebaseService
          .getCollection(collection: "Parameters")
          .then((query) async {
        for (var doc in query.docs) {
          if (doc.id == "Security") {
            Map<String, dynamic> data = doc.data();
            log("load ${data["security"]} security");
            security = data["security"];
            return security;
          }
        }
      });
    } catch (e) {
      return true;
    }
    return security;
  }

  Future<bool> isValidationActive() async {
    bool validations = true;

    try {
      await firebaseService
          .getCollection(collection: "Parameters")
          .then((query) async {
        for (var doc in query.docs) {
          if (doc.id == "Validations") {
            Map<String, dynamic> data = doc.data();
            log("validations active? ${data["DevValidation"]} ");
            validations = data["DevValidation"];
            return validations;
          }
        }
      });
    } catch (e) {
      return true;
    }
    return validations;
  }

  // Future<void> getCollection() async {
  //   await firebaseService
  //       .getCollection(collection: "/Logs/09302023/Logs")
  //       .then((query) async {
  //     List<String> docs = [];
  //     for (var doc in query.docs) {
  //       docs.add(doc.id);
  //     }
  //     log(docs.toString());
  //   });
  // }
}

final LoadParameters loadParameters = LoadParameters();

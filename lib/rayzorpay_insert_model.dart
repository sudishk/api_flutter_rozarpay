// To parse this JSON data, do
//
//     final razorPayInsertModel = razorPayInsertModelFromJson(jsonString);

import 'dart:convert';

RazorPayInsertModel razorPayInsertModelFromJson(String str) => RazorPayInsertModel.fromJson(json.decode(str));

String razorPayInsertModelToJson(RazorPayInsertModel data) => json.encode(data.toJson());

class RazorPayInsertModel {
  String? name;
  String? email;
  String? contact;
  String? failExisting;
  String? gstin;
  Notes? notes;

  RazorPayInsertModel({
    this.name,
    this.email,
    this.contact,
    this.failExisting,
    this.gstin,
    this.notes,
  });

  // json to dart model for getting data
  factory RazorPayInsertModel.fromJson(Map<String, dynamic> json) => RazorPayInsertModel(
    name: json["name"],
    email: json["email"],
    contact: json["contact"],
    failExisting: json["fail_existing"],
    gstin: json["gstin"],
    notes: json["notes"] == null ? null : Notes.fromJson(json["notes"]),
  );
// dart model to json for sending
  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "contact": contact,
    "fail_existing": "1",
    "gstin": "12ABCDE2356F7GH",
    "notes": notes?.toJson(),
  };
}

class Notes {
  String? notesKey1;
  String? notesKey2;

  Notes({
    this.notesKey1,
    this.notesKey2,
  });

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
    notesKey1: json["notes_key_1"],
    notesKey2: json["notes_key_2"],
  );

  Map<String, dynamic> toJson() => {
    "notes_key_1": "Tea, Earl Grey, Hot",
    "notes_key_2": "Tea, Earl Grey… decaf.",
  };
}

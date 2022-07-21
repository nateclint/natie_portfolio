import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:natie_portfolio/data/model/project.dart';

class Db {
  static FirebaseFirestore get db => FirebaseFirestore.instance;

  static CollectionReference<Map<String, dynamic>> projects =
      db.collection('projects');

  static onError(error, stackTrace) async {
    if (kDebugMode) {
      print(stackTrace);
    }
    throw Exception(error);
  }

  static Future<void> setProject(Project p) async => await projects
      .doc(p.id)
      .set(p.toJson())
      .onError((e, st) => onError(e, st));

  static Future<List<Project>> getProjects() async {
    final data = await projects
        .orderBy('completionDate')
        .get()
        .onError((e, st) => onError(e, st));
    return data.docs.map((d) => Project.fromJson(d.data())).toList();
  }

  static Future<List<Project>> getFeaturedProjects() async {
    final data = await projects
        .orderBy('completionDate')
        .where('featured', isEqualTo: true)
        .get()
        .onError((e, st) => onError(e, st));
    return data.docs.map((d) => Project.fromJson(d.data())).toList();
  }

  static Future<Project?> getProject(id) async {
    final data = await projects
        .doc(id)
        .get()
        .onError((e, st) => onError(e, st));
    final d = data.data();
    return (d != null) ? Project.fromJson(d) : null;
  }
}
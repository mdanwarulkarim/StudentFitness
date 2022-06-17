import 'package:flutter/material.dart';

class ProgramModel {
  String? header;
  String? mainTitle;
  List<ProgramData>? programData;

  ProgramModel({this.header, this.mainTitle, this.programData});

  ProgramModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    mainTitle = json['main_title'];
    if (json['program_data'] != null) {
      programData = <ProgramData>[];
      json['program_data'].forEach((v) {
        programData!.add(ProgramData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['header'] = header;
    data['main_title'] = mainTitle;
    if (programData != null) {
      data['program_data'] = programData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProgramData {
  GlobalKey? key;
  String? title;
  String? description;
  List<Rounds>? rounds;

  ProgramData({this.key, this.title, this.description, this.rounds});

  ProgramData.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    description = json['description'];
    if (json['rounds'] != null) {
      rounds = <Rounds>[];
      json['rounds'].forEach((v) {
        rounds!.add(Rounds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['title'] = title;
    data['description'] = description;
    if (rounds != null) {
      data['rounds'] = rounds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rounds {
  String? title;
  String? description;

  Rounds({this.title, this.description});

  Rounds.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
class UserModel {
  String? uid;
  String? name;
  String? image;
  double? weight;
  double? height;
  DateTime? dob;
  String? gender;
  String? program;
  List<ProgressModel>? progress;

  UserModel(
      {this.uid,
        this.name,
        this.image,
        this.weight,
        this.height,
        this.dob,
        this.gender,
        this.program,
        this.progress});

  UserModel.fromJson(Map<String, dynamic> json, bool firebase) {
    uid = json['uid'];
    name = json['name'];
    image = json['image'];
    weight = json['weight'];
    height = json['height'];
    dob = json['dob'] != null ? firebase ? DateTime.parse(json['dob'].toDate().toString())
        : DateTime.parse(json['dob']) : null;
    gender = json['gender'];
    program = json['program'];
    if (json['progress'] != null) {
      progress = <ProgressModel>[];
      json['progress'].forEach((v) {
        progress!.add(ProgressModel.fromJson(v, firebase));
      });
    }else {
      progress = [];
    }
  }

  Map<String, dynamic> toJson(bool firebase) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['image'] = image;
    data['weight'] = weight;
    data['height'] = height;
    data['dob'] = dob != null ? firebase ? dob : dob!.toIso8601String() : null;
    data['gender'] = gender;
    data['program'] = program;
    if (progress != null) {
      data['progress'] = progress!.map((v) => v.toJson(firebase)).toList();
    }else {
      data['progress'] = [];
    }
    return data;
  }

  Map<String, dynamic> toJsonForShared(UserModel? user) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(uid != null) {
      data['uid'] = uid;
    }else if(user != null) {
      data['uid'] = user.uid;
    }
    if(name != null) {
      data['name'] = name;
    }else if(user != null) {
      data['name'] = user.name;
    }
    if(image != null) {
      data['image'] = image;
    }else if(user != null) {
      data['image'] = user.image;
    }
    if(weight != null) {
      data['weight'] = weight;
    }else if(user != null) {
      data['weight'] = user.weight;
    }
    if(height != null) {
      data['height'] = height;
    }else if(user != null) {
      data['height'] = user.height;
    }
    if(dob != null) {
      data['dob'] = dob!.toIso8601String();
    }else if(user != null && user.dob != null) {
      data['dob'] = user.dob!.toIso8601String();
    }
    if(gender != null) {
      data['gender'] = gender;
    }else if(user != null) {
      data['gender'] = user.gender;
    }
    if(program != null) {
      data['program'] = program;
    }else if(user != null) {
      data['program'] = user.program;
    }
    if (progress != null) {
      data['progress'] = progress!.map((v) => v.toJson(false)).toList();
    }else {
      data['progress'] = [];
    }
    return data;
  }

  Map<String, dynamic> toJsonForUpdate() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(uid != null) {
      data['uid'] = uid;
    }
    if(name != null) {
      data['name'] = name;
    }
    if(image != null) {
      data['image'] = image;
    }
    if(weight != null) {
      data['weight'] = weight;
    }
    if(height != null) {
      data['height'] = height;
    }
    if(dob != null) {
      data['dob'] = dob;
    }
    if(gender != null) {
      data['gender'] = gender;
    }
    if(program != null) {
      data['program'] = program;
    }
    return data;
  }
}

class ProgressModel {
  DateTime? date;
  double? weight;

  ProgressModel({this.date, this.weight});

  ProgressModel.fromJson(Map<String, dynamic> json, bool firebase) {
    date = json['date'] != null ? firebase ? DateTime.parse(json['date'].toDate().toString())
        : DateTime.parse(json['date']) : null;
    weight = json['weight'];
  }

  Map<String, dynamic> toJson(bool firebase) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date != null ? firebase ? date : date!.toIso8601String() : null;
    data['weight'] = weight;
    return data;
  }
}

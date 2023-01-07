class FileModel {
  List<String>? files;
  String? folder;

  FileModel({
    this.files,
    this.folder,
  });

  FileModel.fromJson(Map<String, dynamic> json) {
    files = json['files'].cast<String>();
    folder = json['folderName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['files'] = files;
    data['folderName'] = folder;
    return data;
  }
}

class PhotosModal {
  List<String>? files;
  String? folder;
  bool? isChane;

  PhotosModal({this.files, this.folder, this.isChane = false});

  PhotosModal.fromJson(Map<String, dynamic> json) {
    files = json['files'].cast<String>();
    folder = json['folderName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['files'] = files;
    data['folderName'] = folder;
    return data;
  }
}

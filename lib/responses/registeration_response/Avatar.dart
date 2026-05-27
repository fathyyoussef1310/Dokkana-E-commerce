class Avatar {
  Avatar({
      this.url, 
      this.localPath, 
      this.id,});

  Avatar.fromJson(dynamic json) {
    url = json['url'];
    localPath = json['localPath'];
    id = json['_id'];
  }
  String? url;
  String? localPath;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['localPath'] = localPath;
    map['_id'] = id;
    return map;
  }

}
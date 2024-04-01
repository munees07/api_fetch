
class FetchModel {
  String? title;
  FetchModel({this.title});

  factory FetchModel.fromJSon(Map<String,dynamic>json){
    return FetchModel(title: json['title']);
  }
    
}

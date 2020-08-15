class ImageGallery {
  int id;
  double width;
  double height;
  String altDescription;
  int likes;
  Map<String, String> urls = {
    "full" : "",
    "thumb": "",
    "html": ""
  };
  Map<String, String> author = {
    "id": "",
    "name": ""
  };


  @override
  String toString() => "image:$id";

  ImageGallery.initial() {
    id = 0;
    author = <String, String>{};
    width = 0;
    height = 0;
    urls = <String, String>{};
    likes = 0;
  }

  ImageGallery.fromJson(Map<String, dynamic> json) {
    id = int.parse(json["id"].toString());
    author = <String, String>{
      "id": json["user"]["id"],
      "name": json["user"]["name"]
    };
    width = double.parse(json["width"].toString());
    height = double.parse(json["height"].toString());
    urls = <String, String>{
      "full": json["urls"]["full"],
      "thumb": json["urls"]["thumb"],
      "html": json["urls"]["html"]
    };
    // downloadUrl = json["download_url"].toString();
  }

  Map<String, dynamic> toJson(ImageGallery image) => {
    "id": id,
    "author": author,
    "width": width,
    "height": height,
    "url": urls,
    // "download_url": downloadUrl
  };
}
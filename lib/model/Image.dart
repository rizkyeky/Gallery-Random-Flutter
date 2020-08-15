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
    altDescription = "";
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
      "full": json["urls"]["full"].toString(),
      "thumb": json["urls"]["thumb"].toString(),
      "html": json["urls"]["html"].toString()
    };
    altDescription = json["alt_description"].toString();
    likes = int.parse(json["likes"]);
  }

  Map<String, dynamic> toJson(ImageGallery image) => {
    "id": image.id,
    "user": image.author,
    "width": image.width,
    "height": image.height,
    "urls": image.urls,
    "likes": image.likes,
    "alt_description": image.altDescription
  };
}
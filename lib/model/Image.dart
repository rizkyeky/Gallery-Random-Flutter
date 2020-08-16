class ImageGallery {
  String id;
  int width;
  int height;
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
    id = "";
    author = <String, String>{};
    width = 0;
    height = 0;
    urls = <String, String>{};
    altDescription = "";
    likes = 0;
  }

  ImageGallery.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    width = json["width"];
    height = json["height"];
    altDescription = json["alt_description"];
    likes = json["likes"];
    
    urls = <String, String>{
      "full": json["urls"]["full"],
      "thumb": json["urls"]["thumb"],
      "html": json["links"]["html"],
    };
    author = <String, String>{
      "id": json["user"]["id"],
      "name": json["user"]["name"]
    };
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
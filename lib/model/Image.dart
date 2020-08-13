class ImageGallery {
  int id;
  String author;
  double width;
  double height;
  String url;
  String downloadUrl;

  @override
  String toString() => "image:$id";

  ImageGallery.initial() {
    id = 0;
    author = "";
    width = 0;
    height = 0;
    url = "";
    downloadUrl = "";
  }

  ImageGallery.fromJson(Map<String, dynamic> json) {
    id = int.parse(json["id"].toString());
    author = json["author"].toString();
    width = double.parse(json["width"].toString());
    height = double.parse(json["height"].toString());
    url = json["url"].toString();
    downloadUrl = json["download_url"].toString();
  }

  Map<String, dynamic> toJson(ImageGallery image) => {
    "id": id,
    "author": author,
    "width": width,
    "height": height,
    "url": url,
    "download_url": downloadUrl
  };
}
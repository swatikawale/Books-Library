class VolumeInfo {
  final dynamic title;
  final dynamic subtitle;
  final dynamic authors;
  final dynamic publisher;
  final dynamic publishedDate;
  final dynamic description;
  final dynamic imageLinks;
  final dynamic pageCount;
  final dynamic categories;
  final dynamic language;
  final dynamic previewLink;

  VolumeInfo(
      {this.title,
      this.subtitle,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.imageLinks,
      this.pageCount,
      this.categories,
      this.language,
      this.previewLink});

  factory VolumeInfo.fromJson(Map<String, dynamic> parsedJson) {
    return VolumeInfo(
      title: parsedJson['title'] as dynamic,
      subtitle: parsedJson['subtitle'] as dynamic,
      authors: parsedJson['authors'] as dynamic,
      publisher: parsedJson['publisher'] as dynamic,
      publishedDate: parsedJson['publishedDate'] as dynamic,
      description: parsedJson['description'] as dynamic,
      imageLinks: ImageLinks.fromJson(parsedJson['imageLinks'] as dynamic),
      pageCount: parsedJson['pageCount'] as dynamic,
      categories: parsedJson['categories'] as dynamic,
      language: parsedJson['language'] as dynamic,
      previewLink: parsedJson['previewLink'] as dynamic,
    );
  }

  static List<VolumeInfo> taskList = <VolumeInfo>[
    VolumeInfo(
      title: 'title' as dynamic,
      subtitle: 'subtitle' as dynamic,
      authors: 'authors' as dynamic,
      publisher: 'publisher' as dynamic,
      publishedDate: 'publishedDate' as dynamic,
      description: 'description' as dynamic,
      imageLinks: 'imageLinks' as dynamic,
      pageCount: 'pageCount' as dynamic,
      categories: 'categories' as dynamic,
      language: 'language' as dynamic,
      previewLink: 'previewLink' as dynamic,
    ),
  ];
}

class ImageLinks {
  final dynamic smallThumbnail;
  final dynamic thumbnail;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
      smallThumbnail: json['smallThumbnail'] as dynamic,
      thumbnail: json['thumbnail'] as dynamic,
    );
  }

  static List<ImageLinks> imagelist = <ImageLinks>[
    ImageLinks(
      smallThumbnail: 'smallThumbnail' as dynamic,
      thumbnail: 'thumbnail' as dynamic,
    ),
  ];
}

class Library {
  final dynamic volumeInfo;
  final dynamic imageLinks;

  Library({this.volumeInfo, this.imageLinks});

  factory Library.fromJson(Map<String, dynamic> parsedJson) {
    return Library(
        volumeInfo: VolumeInfo.fromJson(parsedJson['volumeInfo'] as dynamic));
  }

  static List<Library> taskList = <Library>[
    Library(
      volumeInfo: 'volumeInfo' as dynamic,
    ),
  ];
}

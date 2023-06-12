class PagingResult {
  late List<dynamic> content;
  late int totalPages;
  late int totalElements;
  late int size;
  late int page;
  late bool empty;

  PagingResult({
    required this.content,
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.page,
    required this.empty,
  });

  factory PagingResult.fromJson(Map<String, dynamic> json) => PagingResult(
    content: json["content"],
    totalPages: json["totalPages"],
    totalElements: json["totalElements"],
    size: json["size"],
    page: json["page"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "totalPages": totalPages,
    "totalElements": totalElements,
    "size": size,
    "page": page,
    "empty": empty,
  };
}
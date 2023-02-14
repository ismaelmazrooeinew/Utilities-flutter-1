import 'package:utilities/data/dto/report.dart';
import 'package:utilities/data/dto/team.dart';
import 'package:utilities/utilities.dart';

extension ProductReadDtoExtension on ProductReadDto {
  ProductReadDto sample() => ProductReadDto(
        id: "id",
        userId: "userId",
        title: "title",
        subtitle: "subtitle",
        description: "description",
        details: "details",
        address: "address",
        author: "author",
        phoneNumber: "phoneNumber",
        link: "link",
        website: "website",
        email: "email",
        type: "type",
        unit: "unit",
        useCase: "useCase",
        isForSale: true,
        enabled: true,
        isBookmarked: true,
        latitude: 35,
        longitude: 55,
        visitsCount: 100,
        minOrder: 10,
        maxOrder: 1000,
        price: 10000,
        score: 10,
        startDate: DateTime.now().toString(),
        endDate: DateTime.now().toString(),
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
        deletedAt: null,
        user: UserReadDto(),
        status: 1,
        media: <MediaReadDto>[MediaReadDto(link: Sample.loremPicsum)],
      );
}

class ProductCreateUpdateDto {
  ProductCreateUpdateDto({
    this.id,
    this.userId,
    this.title,
    this.subtitle,
    this.description,
    this.details,
    this.address,
    this.author,
    this.phoneNumber,
    this.link,
    this.website,
    this.email,
    this.type,
    this.unit,
    this.useCase,
    this.isForSale,
    this.enabled,
    this.isBookmarked,
    this.latitude,
    this.longitude,
    this.visitsCount,
    this.minOrder,
    this.maxOrder,
    this.price,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.status,
    this.currency,
    this.locations,
    this.media,
    this.categories,
    this.voteFields,
    this.forms,
    this.comments,
    this.teams,
    this.state,
    this.stateTr1,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
    this.value5,
    this.value6,
    this.productInsight,
  });

  final String? id;
  final String? userId;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? details;
  final String? address;
  final String? author;
  final String? phoneNumber;
  final String? link;
  final String? website;
  final String? email;
  final String? type;
  final String? unit;
  final String? useCase;
  final String? state;
  final String? stateTr1;
  final bool? isForSale;
  final bool? enabled;
  final bool? isBookmarked;
  final double? latitude;
  final double? longitude;
  final int? visitsCount;
  final double? minOrder;
  final double? maxOrder;
  final double? price;
  final String? startDate;
  final String? endDate;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? value1;
  final String? value2;
  final String? value3;
  final String? value4;
  final String? value5;
  final String? value6;
  final int? status;
  final int? currency;
  final UserReadDto? user;
  final ProductInsight? productInsight;
  final List<int>? locations;
  final List<MediaReadDto>? media;
  final List<String>? categories;
  final List<VoteField>? voteFields;
  final List<FormReadDto>? forms;
  final List<CommentReadDto>? comments;
  final List<String>? teams;

  factory ProductCreateUpdateDto.fromJson(String str) => ProductCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductCreateUpdateDto.fromMap(Map<String, dynamic> json) => ProductCreateUpdateDto(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        details: json["details"],
        address: json["address"],
        author: json["author"],
        state: json["state"],
        stateTr1: json["stateTr1"],
        phoneNumber: json["phoneNumber"],
        link: json["link"],
        website: json["website"],
        email: json["email"],
        type: json["type"],
        unit: json["unit"],
        useCase: json["useCase"],
        isForSale: json["isForSale"],
        enabled: json["enabled"],
        isBookmarked: json["isBookmarked"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        visitsCount: json["visitsCount"],
        minOrder: json["minOrder"],
        maxOrder: json["maxOrder"],
        price: json["price"],
        value1: json["value1"],
        value2: json["value2"],
        value3: json["value3"],
        value4: json["value4"],
        value5: json["value5"],
        value6: json["value6"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        status: json["status"],
        currency: json["currency"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        productInsight: json["productInsight"] == null ? null : ProductInsight.fromMap(json["productInsight"]),
        locations: json["locations"] == null ? null : List<int>.from(json["locations"].map((x) => x)),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
        categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((x) => x)),
        voteFields: json["voteFields"] == null ? null : List<VoteField>.from(json["voteFields"].map((x) => VoteField.fromMap(x))),
        forms: json["forms"] == null ? null : List<FormReadDto>.from(json["forms"].map((x) => FormReadDto.fromMap(x))),
        comments: json["comments"] == null ? null : List<CommentReadDto>.from(json["comments"].map((x) => CommentReadDto.fromMap(x))),
        teams: json["teams"] == null ? null : List<String>.from(json["teams"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "details": details,
        "address": address,
        "author": author,
        "state": state,
        "stateTr1": stateTr1,
        "phoneNumber": phoneNumber,
        "link": link,
        "website": website,
        "email": email,
        "type": type,
        "unit": unit,
        "useCase": useCase,
        "isForSale": isForSale,
        "enabled": enabled,
        "isBookmarked": isBookmarked,
        "latitude": latitude,
        "longitude": longitude,
        "visitsCount": visitsCount,
        "minOrder": minOrder,
        "maxOrder": maxOrder,
        "price": price,
        "value1": value1,
        "value2": value2,
        "value3": value3,
        "value4": value4,
        "value5": value5,
        "value6": value6,
        "startDate": startDate,
        "endDate": endDate,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "status": status,
        "currency": currency,
        "user": user == null ? null : user!.toMap(),
        "productInsight": productInsight?.toMap(),
        "locations": locations == null ? null : List<dynamic>.from(locations!.map((x) => x)),
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x)),
        "voteFields": voteFields == null ? null : List<dynamic>.from(voteFields!.map((x) => x.toMap())),
        "forms": forms == null ? null : List<dynamic>.from(forms!.map((x) => x.toMap())),
        "comments": comments == null ? null : List<dynamic>.from(comments!.map((x) => x.toMap())),
        "teams": teams == null ? null : List<dynamic>.from(teams!.map((x) => x)),
      };
}

class ProductInsight {
  ProductInsight({
    this.reaction,
    this.userId,
  });

  final int? reaction;
  final String? userId;

  factory ProductInsight.fromJson(String str) => ProductInsight.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductInsight.fromMap(Map<String, dynamic> json) => ProductInsight(
        reaction: json["reaction"],
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "reaction": reaction,
        "userId": userId,
      };
}

class ProductReadDto {
  ProductReadDto({
    this.id,
    this.userId,
    this.title,
    this.subtitle,
    this.description,
    this.details,
    this.address,
    this.author,
    this.phoneNumber,
    this.link,
    this.website,
    this.email,
    this.state,
    this.stateTr1,
    this.stateTr2,
    this.type,
    this.unit,
    this.useCase,
    this.isForSale,
    this.enabled,
    this.isBookmarked,
    this.latitude,
    this.longitude,
    this.visitsCount,
    this.minOrder,
    this.maxOrder,
    this.price,
    this.score,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.status,
    this.currency,
    this.media,
    this.categories,
    this.voteFields,
    this.forms,
    this.comments,
    this.teams,
    this.myVotes,
    this.reports,
    this.votes,
    this.voteCount,
    this.productInsights,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
    this.value5,
    this.value6,
  });

  final String? id;
  final String? userId;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? details;
  final String? address;
  final String? author;
  final String? phoneNumber;
  final String? link;
  final String? website;
  final String? email;
  final String? state;
  final String? stateTr1;
  final String? stateTr2;
  final String? type;
  final String? unit;
  final String? useCase;
  final bool? isForSale;
  final bool? enabled;
  bool? isBookmarked;
  final double? latitude;
  final double? longitude;
  final int? visitsCount;
  final double? minOrder;
  final double? maxOrder;
  final double? price;
  final double? score;
  final double? voteCount;
  final String? startDate;
  final String? endDate;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? status;
  final int? currency;
  final String? value1;
  final String? value2;
  final String? value3;
  final String? value4;
  final String? value5;
  final String? value6;
  final UserReadDto? user;
  final List<MediaReadDto>? media;
  final List<CategoryReadDto>? categories;
  final List<VoteField>? voteFields;
  final List<VoteField>? myVotes;
  final List<VoteReadDto>? votes;
  final List<FormReadDto>? forms;
  final List<ProductInsightDto>? productInsights;
  final List<CommentReadDto>? comments;
  final List<TeamReadDto>? teams;
  final List<Report>? reports;

  void setIsBookmark(bool _isBookmark) {
    this.isBookmarked = _isBookmark; //
  }

  factory ProductReadDto.fromJson(String str) => ProductReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductReadDto.fromMap(Map<String, dynamic> json) => ProductReadDto(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        details: json["details"],
        address: json["address"],
        author: json["author"],
        phoneNumber: json["phoneNumber"],
        link: json["link"],
        website: json["website"],
        value1: json["value1"],
        value2: json["value2"],
        value3: json["value3"],
        value4: json["value4"],
        value5: json["value5"],
        value6: json["value6"],
        email: json["email"],
        state: json["state"],
        stateTr1: json["stateTr1"],
        stateTr2: json["stateTr2"],
        type: json["type"],
        unit: json["unit"],
        useCase: json["useCase"],
        isForSale: json["isForSale"],
        enabled: json["enabled"],
        isBookmarked: json["isBookmarked"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        visitsCount: json["visitsCount"],
        minOrder: json["minOrder"],
        maxOrder: json["maxOrder"],
        price: json["price"],
        score: json["score"],
        voteCount: json["voteCount"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        status: json["status"],
        currency: json["currency"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
        categories: json["categories"] == null ? null : List<CategoryReadDto>.from(json["categories"].map((x) => CategoryReadDto.fromMap(x))),
        votes: json["votes"] == null ? null : List<VoteReadDto>.from(json["votes"].map((x) => VoteReadDto.fromMap(x))),
        voteFields: json["voteFields"] == null ? null : List<VoteField>.from(json["voteFields"].map((x) => VoteField.fromMap(x))),
        myVotes: json["myVotes"] == null ? null : List<VoteField>.from(json["myVotes"].map((x) => VoteField.fromMap(x))),
        forms: json["forms"] == null ? null : List<FormReadDto>.from(json["forms"].map((x) => FormReadDto.fromMap(x))),
        comments: json["comments"] == null ? null : List<CommentReadDto>.from(json["comments"].map((x) => CommentReadDto.fromMap(x))),
        teams: json["teams"] == null ? null : List<TeamReadDto>.from(json["teams"].map((x) => TeamReadDto.fromMap(x))),
        reports: json["reports"] == null ? null : List<Report>.from(json["reports"].map((x) => Report.fromMap(x))),
        productInsights: json["productInsights"] == null ? [] : List<ProductInsightDto>.from(json["productInsights"]!.map((x) => ProductInsightDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "details": details,
        "address": address,
        "author": author,
        "phoneNumber": phoneNumber,
        "link": link,
        "website": website,
        "email": email,
        "state": state,
        "stateTr1": stateTr1,
        "stateTr2": stateTr2,
        "type": type,
        "unit": unit,
        "useCase": useCase,
        "isForSale": isForSale,
        "enabled": enabled,
        "isBookmarked": isBookmarked,
        "latitude": latitude,
        "longitude": longitude,
        "visitsCount": visitsCount,
        "minOrder": minOrder,
        "maxOrder": maxOrder,
        "price": price,
        "score": score,
        "startDate": startDate,
        "endDate": endDate,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "value1": value1,
        "value2": value2,
        "value3": value3,
        "value4": value4,
        "value5": value5,
        "value6": value6,
        "status": status,
        "currency": currency,
        "voteCount": voteCount,
        "user": user == null ? null : user!.toMap(),
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "votes": votes == null ? null : List<dynamic>.from(votes!.map((x) => x.toMap())),
        "voteFields": voteFields == null ? null : List<dynamic>.from(voteFields!.map((x) => x.toMap())),
        "myVotes": myVotes == null ? null : List<dynamic>.from(myVotes!.map((x) => x.toMap())),
        "forms": forms == null ? null : List<dynamic>.from(forms!.map((x) => x.toMap())),
        "comments": comments == null ? null : List<dynamic>.from(comments!.map((x) => x.toMap())),
        "teams": teams == null ? null : List<dynamic>.from(teams!.map((x) => x.toMap())),
        "reports": reports == null ? null : List<dynamic>.from(reports!.map((x) => x.toMap())),
      };
}

class ProductInsightDto {
  ProductInsightDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.reaction,
    this.user,
    this.userId,
    this.productEntity,
    this.productId,
  });

  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final int? reaction;
  final UserReadDto? user;
  final String? userId;
  final String? productEntity;
  final String? productId;

  factory ProductInsightDto.fromJson(String str) => ProductInsightDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductInsightDto.fromMap(Map<String, dynamic> json) => ProductInsightDto(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
        reaction: json["reaction"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        userId: json["userId"],
        productEntity: json["productEntity"],
        productId: json["productId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt?.toIso8601String(),
        "reaction": reaction,
        "user": user?.toMap(),
        "userId": userId,
        "productEntity": productEntity,
        "productId": productId,
      };
}

class ProductFilterDto {
  ProductFilterDto({
    this.title,
    this.subTitle,
    this.description,
    this.details,
    this.link,
    this.website,
    this.address,
    this.author,
    this.phoneNumber,
    this.email,
    this.type,
    this.startPriceRange,
    this.endPriceRange,
    this.enabled,
    this.isForSale,
    this.isBookmarked,
    this.visitsCount,
    this.length,
    this.width,
    this.height,
    this.weight,
    this.minOrder,
    this.maxOrder,
    this.unit,
    this.status,
    this.currency,
    this.startDate,
    this.endDate,
    this.locations,
    this.categories,
    this.filterOrder,
    this.pageSize,
    this.pageNumber,
    this.useCase,
    this.teams,
    this.minimal,
    this.isFollowing,
    this.showCreator,
    this.showCategories,
    this.showMedia,
    this.showTeams,
    this.userId,
    this.state,
    this.orderByVotes,
    this.orderByVotesDecending,
    this.orderByAtoZ,
    this.orderByZtoA,
    this.orderByPriceAccending,
    this.orderByPriceDecending,
    this.orderByCreatedDate,
    this.orderByCreaedDateDecending,
    this.showVotes,
  });

  final String? title;
  final String? subTitle;
  final String? description;
  final String? details;
  final String? link;
  final String? website;
  final String? address;
  final String? author;
  final String? phoneNumber;
  final String? email;
  final String? type;
  final String? userId;
  final double? startPriceRange;
  final double? endPriceRange;
  final bool? enabled;
  final bool? isForSale;
  final bool? isBookmarked;
  final bool? minimal;
  final bool? isFollowing;
  final bool? showCreator;
  final bool? showTeams;
  final bool? showCategories;
  final bool? showMedia;
  final bool? showVotes;
  final int? visitsCount;
  final double? length;
  final double? width;
  final double? height;
  final double? weight;
  final double? minOrder;
  final double? maxOrder;
  final String? unit;
  final int? status;
  final int? currency;
  final String? startDate;
  final String? endDate;
  final int? filterOrder;
  final int? pageSize;
  final int? pageNumber;
  final String? useCase;
  final String? state;
  final bool? orderByVotesDecending;
  final bool? orderByVotes;
  final bool? orderByAtoZ;
  final bool? orderByZtoA;
  final bool? orderByPriceAccending;
  final bool? orderByPriceDecending;
  final bool? orderByCreatedDate;
  final bool? orderByCreaedDateDecending;
  final List<int>? locations;
  final List<String>? categories;
  final List<UserReadDto>? teams;

  factory ProductFilterDto.fromJson(String str) => ProductFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductFilterDto.fromMap(Map<String, dynamic> json) => ProductFilterDto(
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
        details: json["details"],
        link: json["link"],
        state: json["state"],
        website: json["website"],
        address: json["address"],
        author: json["author"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        type: json["type"],
        userId: json["userId"],
        startPriceRange: json["startPriceRange"],
        endPriceRange: json["endPriceRange"],
        enabled: json["enabled"],
        isForSale: json["isForSale"],
        isBookmarked: json["isBookmarked"],
        minimal: json["minimal"],
        isFollowing: json["isFollowing"],
        visitsCount: json["visitsCount"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        weight: json["weight"],
        minOrder: json["minOrder"],
        maxOrder: json["maxOrder"],
        unit: json["unit"],
        status: json["status"],
        currency: json["currency"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        filterOrder: json["filterOrder"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        useCase: json["useCase"],
        showCreator: json["showCreator"],
        showTeams: json["showTeams"],
        showVotes: json["showVotes"],
        showCategories: json["showCategories"],
        showMedia: json["showMedia"],
        orderByVotes: json["orderByVotes"],
        orderByVotesDecending: json["orderByVotesDecending"],
        orderByAtoZ: json["orderByAtoZ"],
        orderByZtoA: json["orderByZtoA"],
        orderByPriceAccending: json["orderByPriceAccending"],
        orderByPriceDecending: json["orderByPriceDecending"],
        orderByCreatedDate: json["orderByCreatedDate"],
        orderByCreaedDateDecending: json["orderByCreaedDateDecending"],
        locations: json["locations"] == null ? null : json["locations"],
        categories: json["categories"] == null ? null : json["categories"],
        teams: json["teams"] == null ? null : List<UserReadDto>.from(json["teams"].map((x) => UserReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "details": details,
        "link": link,
        "website": website,
        "address": address,
        "author": author,
        "phoneNumber": phoneNumber,
        "email": email,
        "state": state,
        "type": type,
        "userId": userId,
        "startPriceRange": startPriceRange,
        "endPriceRange": endPriceRange,
        "enabled": enabled,
        "isForSale": isForSale,
        "isBookmarked": isBookmarked,
        "minimal": minimal,
        "isFollowing": isFollowing,
        "visitsCount": visitsCount,
        "length": length,
        "width": width,
        "height": height,
        "weight": weight,
        "minOrder": minOrder,
        "maxOrder": maxOrder,
        "unit": unit,
        "status": status,
        "currency": currency,
        "startDate": startDate,
        "endDate": endDate,
        "filterOrder": filterOrder,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "useCase": useCase,
        "showCreator": showCreator,
        "showTeams": showTeams,
        "showVotes": showVotes,
        "showCategories": showCategories,
        "showMedia": showMedia,
        "orderByVotes": orderByVotes,
        "orderByVotesDecending": orderByVotesDecending,
        "orderByAtoZ": orderByAtoZ,
        "orderByZtoA": orderByZtoA,
        "orderByPriceAccending": orderByPriceAccending,
        "orderByPriceDecending": orderByPriceDecending,
        "orderByCreatedDate": orderByCreatedDate,
        "orderByCreaedDateDecending": orderByCreaedDateDecending,
        "categories": categories == null ? null : categories,
        "locations": locations == null ? null : locations,
        "teams": teams == null ? null : List<dynamic>.from(teams!.map((x) => x.toMap())),
      };
}

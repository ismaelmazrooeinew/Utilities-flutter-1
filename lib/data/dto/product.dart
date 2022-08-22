import 'package:utilities/data/dto/report.dart';
import 'package:utilities/data/dto/server_location.dart';
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
    this.locations,
    this.media,
    this.categories,
    this.voteFields,
    this.forms,
    this.comments,
    this.teams,
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
  final UserReadDto? user;
  final int? status;
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
        id: json["id"] == null ? null : json["id"],
        userId: json["userId"] == null ? null : json["userId"],
        title: json["title"] == null ? null : json["title"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        description: json["description"] == null ? null : json["description"],
        details: json["details"] == null ? null : json["details"],
        address: json["address"] == null ? null : json["address"],
        author: json["author"] == null ? null : json["author"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        link: json["link"] == null ? null : json["link"],
        website: json["website"] == null ? null : json["website"],
        email: json["email"] == null ? null : json["email"],
        type: json["type"] == null ? null : json["type"],
        unit: json["unit"] == null ? null : json["unit"],
        useCase: json["useCase"] == null ? null : json["useCase"],
        isForSale: json["isForSale"] == null ? null : json["isForSale"],
        enabled: json["enabled"] == null ? null : json["enabled"],
        isBookmarked: json["isBookmarked"] == null ? null : json["isBookmarked"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        visitsCount: json["visitsCount"] == null ? null : json["visitsCount"],
        minOrder: json["minOrder"] == null ? null : json["minOrder"],
        maxOrder: json["maxOrder"] == null ? null : json["maxOrder"],
        price: json["price"] == null ? null : json["price"],
        startDate: json["startDate"] == null ? null : json["startDate"],
        endDate: json["endDate"] == null ? null : json["endDate"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        deletedAt: json["deletedAt"] == null ? null : json["deletedAt"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        status: json["status"] == null ? null : json["status"],
        locations: json["locations"] == null ? null : List<int>.from(json["locations"].map((x) => x)),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
        categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((x) => x)),
        voteFields: json["voteFields"] == null ? null : List<VoteField>.from(json["voteFields"].map((x) => VoteField.fromMap(x))),
        forms: json["forms"] == null ? null : List<FormReadDto>.from(json["forms"].map((x) => FormReadDto.fromMap(x))),
        comments: json["comments"] == null ? null : List<CommentReadDto>.from(json["comments"].map((x) => CommentReadDto.fromMap(x))),
        teams: json["teams"] == null ? null : List<String>.from(json["teams"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "userId": userId == null ? null : userId,
        "title": title == null ? null : title,
        "subtitle": subtitle == null ? null : subtitle,
        "description": description == null ? null : description,
        "details": details == null ? null : details,
        "address": address == null ? null : address,
        "author": author == null ? null : author,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "link": link == null ? null : link,
        "website": website == null ? null : website,
        "email": email == null ? null : email,
        "type": type == null ? null : type,
        "unit": unit == null ? null : unit,
        "useCase": useCase == null ? null : useCase,
        "isForSale": isForSale == null ? null : isForSale,
        "enabled": enabled == null ? null : enabled,
        "isBookmarked": isBookmarked == null ? null : isBookmarked,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "visitsCount": visitsCount == null ? null : visitsCount,
        "minOrder": minOrder == null ? null : minOrder,
        "maxOrder": maxOrder == null ? null : maxOrder,
        "price": price == null ? null : price,
        "startDate": startDate == null ? null : startDate,
        "endDate": endDate == null ? null : endDate,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "deletedAt": deletedAt == null ? null : deletedAt,
        "user": user == null ? null : user!.toMap(),
        "status": status == null ? null : status,
        "locations": locations == null ? null : List<dynamic>.from(locations!.map((x) => x)),
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x)),
        "voteFields": voteFields == null ? null : List<dynamic>.from(voteFields!.map((x) => x.toMap())),
        "forms": forms == null ? null : List<dynamic>.from(forms!.map((x) => x.toMap())),
        "comments": comments == null ? null : List<dynamic>.from(comments!.map((x) => x.toMap())),
        "teams": teams == null ? null : List<dynamic>.from(teams!.map((x) => x)),
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
    this.locations,
    this.media,
    this.categories,
    this.voteFields,
    this.forms,
    this.comments,
    this.teams,
    this.myVotes,
    this.reports,
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
  final String? type;
  final String? unit;
  final String? useCase;
  final bool? isForSale;
  final bool? enabled;
  final bool? isBookmarked;
  final double? latitude;
  final double? longitude;
  final int? visitsCount;
  final double? minOrder;
  final double? maxOrder;
  final double? price;
  final double? score;
  final String? startDate;
  final String? endDate;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final UserReadDto? user;
  final int? status;
  final List<ServerLocationReadDto>? locations;
  final List<MediaReadDto>? media;
  final List<CategoryReadDto>? categories;
  final List<VoteField>? voteFields;
  final List<VoteField>? myVotes;
  final List<FormReadDto>? forms;
  final List<CommentReadDto>? comments;
  final List<TeamReadDto>? teams;
  final List<Report>? reports;

  factory ProductReadDto.fromJson(String str) => ProductReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductReadDto.fromMap(Map<String, dynamic> json) => ProductReadDto(
        id: json["id"] == null ? null : json["id"],
        userId: json["userId"] == null ? null : json["userId"],
        title: json["title"] == null ? null : json["title"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        description: json["description"] == null ? null : json["description"],
        details: json["details"] == null ? null : json["details"],
        address: json["address"] == null ? null : json["address"],
        author: json["author"] == null ? null : json["author"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        link: json["link"] == null ? null : json["link"],
        website: json["website"] == null ? null : json["website"],
        email: json["email"] == null ? null : json["email"],
        state: json["state"] == null ? null : json["state"],
        type: json["type"] == null ? null : json["type"],
        unit: json["unit"] == null ? null : json["unit"],
        useCase: json["useCase"] == null ? null : json["useCase"],
        isForSale: json["isForSale"] == null ? null : json["isForSale"],
        enabled: json["enabled"] == null ? null : json["enabled"],
        isBookmarked: json["isBookmarked"] == null ? null : json["isBookmarked"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        visitsCount: json["visitsCount"] == null ? null : json["visitsCount"],
        minOrder: json["minOrder"] == null ? null : json["minOrder"],
        maxOrder: json["maxOrder"] == null ? null : json["maxOrder"],
        price: json["price"] == null ? null : json["price"],
        score: json["score"] == null ? null : json["score"],
        startDate: json["startDate"] == null ? null : json["startDate"],
        endDate: json["endDate"] == null ? null : json["endDate"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        deletedAt: json["deletedAt"] == null ? null : json["deletedAt"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        status: json["status"] == null ? null : json["status"],
        locations: json["location"] == null ? null : List<ServerLocationReadDto>.from(json["location"].map((x) => ServerLocationReadDto.fromMap(x))),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
        categories: json["categories"] == null ? null : List<CategoryReadDto>.from(json["categories"].map((x) => CategoryReadDto.fromMap(x))),
        voteFields: json["voteFields"] == null ? null : List<VoteField>.from(json["voteFields"].map((x) => VoteField.fromMap(x))),
        myVotes: json["myVotes"] == null ? null : List<VoteField>.from(json["myVotes"].map((x) => VoteField.fromMap(x))),
        forms: json["forms"] == null ? null : List<FormReadDto>.from(json["forms"].map((x) => FormReadDto.fromMap(x))),
        comments: json["comments"] == null ? null : List<CommentReadDto>.from(json["comments"].map((x) => CommentReadDto.fromMap(x))),
        teams: json["teams"] == null ? null : List<TeamReadDto>.from(json["teams"].map((x) => TeamReadDto.fromMap(x))),
        reports: json["reports"] == null ? null : List<Report>.from(json["reports"].map((x) => Report.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "userId": userId == null ? null : userId,
        "title": title == null ? null : title,
        "subtitle": subtitle == null ? null : subtitle,
        "description": description == null ? null : description,
        "details": details == null ? null : details,
        "address": address == null ? null : address,
        "author": author == null ? null : author,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "link": link == null ? null : link,
        "website": website == null ? null : website,
        "email": email == null ? null : email,
        "state": state == null ? null : state,
        "type": type == null ? null : type,
        "unit": unit == null ? null : unit,
        "useCase": useCase == null ? null : useCase,
        "isForSale": isForSale == null ? null : isForSale,
        "enabled": enabled == null ? null : enabled,
        "isBookmarked": isBookmarked == null ? null : isBookmarked,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "visitsCount": visitsCount == null ? null : visitsCount,
        "minOrder": minOrder == null ? null : minOrder,
        "maxOrder": maxOrder == null ? null : maxOrder,
        "price": price == null ? null : price,
        "score": score == null ? null : score,
        "startDate": startDate == null ? null : startDate,
        "endDate": endDate == null ? null : endDate,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "deletedAt": deletedAt == null ? null : deletedAt,
        "user": user == null ? null : user!.toMap(),
        "status": status == null ? null : status,
        "locations": locations == null ? null : List<dynamic>.from(locations!.map((x) => x.toMap())),
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "voteFields": voteFields == null ? null : List<dynamic>.from(voteFields!.map((x) => x.toMap())),
        "myVotes": myVotes == null ? null : List<dynamic>.from(myVotes!.map((x) => x.toMap())),
        "forms": forms == null ? null : List<dynamic>.from(forms!.map((x) => x.toMap())),
        "comments": comments == null ? null : List<dynamic>.from(comments!.map((x) => x.toMap())),
        "teams": teams == null ? null : List<dynamic>.from(teams!.map((x) => x.toMap())),
        "reports": reports == null ? null : List<dynamic>.from(reports!.map((x) => x.toMap())),
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
    this.showTeams,
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
  final int? visitsCount;
  final double? length;
  final double? width;
  final double? height;
  final double? weight;
  final double? minOrder;
  final double? maxOrder;
  final String? unit;
  final int? status;
  final String? startDate;
  final String? endDate;
  final List<int>? locations;
  final List<String>? categories;
  final int? filterOrder;
  final int? pageSize;
  final int? pageNumber;
  final String? useCase;
  final List<UserReadDto>? teams;

  factory ProductFilterDto.fromJson(String str) => ProductFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductFilterDto.fromMap(Map<String, dynamic> json) => ProductFilterDto(
        title: json["title"] == null ? null : json["title"],
        subTitle: json["subTitle"] == null ? null : json["subTitle"],
        description: json["description"] == null ? null : json["description"],
        details: json["details"] == null ? null : json["details"],
        link: json["link"] == null ? null : json["link"],
        website: json["website"] == null ? null : json["website"],
        address: json["address"] == null ? null : json["address"],
        author: json["author"] == null ? null : json["author"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        email: json["email"] == null ? null : json["email"],
        type: json["type"] == null ? null : json["type"],
        startPriceRange: json["startPriceRange"] == null ? null : json["startPriceRange"],
        endPriceRange: json["endPriceRange"] == null ? null : json["endPriceRange"],
        enabled: json["enabled"] == null ? null : json["enabled"],
        isForSale: json["isForSale"] == null ? null : json["isForSale"],
        isBookmarked: json["isBookmarked"] == null ? null : json["isBookmarked"],
        minimal: json["minimal"] == null ? null : json["minimal"],
        isFollowing: json["isFollowing"] == null ? null : json["isFollowing"],
        visitsCount: json["visitsCount"] == null ? null : json["visitsCount"],
        length: json["length"] == null ? null : json["length"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        weight: json["weight"] == null ? null : json["weight"],
        minOrder: json["minOrder"] == null ? null : json["minOrder"],
        maxOrder: json["maxOrder"] == null ? null : json["maxOrder"],
        unit: json["unit"] == null ? null : json["unit"],
        status: json["status"] == null ? null : json["status"],
        startDate: json["startDate"] == null ? null : json["startDate"],
        endDate: json["endDate"] == null ? null : json["endDate"],
        locations: json["locations"] == null ? null : json["locations"],
        teams: json["teams"] == null ? null : List<UserReadDto>.from(json["teams"].map((x) => UserReadDto.fromMap(x))),
        filterOrder: json["filterOrder"] == null ? null : json["filterOrder"],
        pageSize: json["pageSize"] == null ? null : json["pageSize"],
        categories: json["categories"] == null ? null : json["categories"],
        pageNumber: json["pageNumber"] == null ? null : json["pageNumber"],
        useCase: json["useCase"] == null ? null : json["useCase"],
        showCreator: json["showCreator"] == null ? null : json["showCreator"],
        showTeams: json["showTeams"] == null ? null : json["showTeams"],
        showCategories: json["showCategories"] == null ? null : json["showCategories"],
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "subTitle": subTitle == null ? null : subTitle,
        "description": description == null ? null : description,
        "details": details == null ? null : details,
        "link": link == null ? null : link,
        "website": website == null ? null : website,
        "address": address == null ? null : address,
        "author": author == null ? null : author,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "email": email == null ? null : email,
        "type": type == null ? null : type,
        "startPriceRange": startPriceRange == null ? null : startPriceRange,
        "endPriceRange": endPriceRange == null ? null : endPriceRange,
        "enabled": enabled == null ? null : enabled,
        "isForSale": isForSale == null ? null : isForSale,
        "isBookmarked": isBookmarked == null ? null : isBookmarked,
        "minimal": minimal == null ? null : minimal,
        "isFollowing": isFollowing == null ? null : isFollowing,
        "visitsCount": visitsCount == null ? null : visitsCount,
        "length": length == null ? null : length,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "weight": weight == null ? null : weight,
        "minOrder": minOrder == null ? null : minOrder,
        "maxOrder": maxOrder == null ? null : maxOrder,
        "unit": unit == null ? null : unit,
        "status": status == null ? null : status,
        "startDate": startDate == null ? null : startDate,
        "endDate": endDate == null ? null : endDate,
        "categories": categories == null ? null : categories,
        "locations": locations == null ? null : locations,
        "teams": teams == null ? null : List<dynamic>.from(teams!.map((x) => x.toMap())),
        "filterOrder": filterOrder == null ? null : filterOrder,
        "pageSize": pageSize == null ? null : pageSize,
        "pageNumber": pageNumber == null ? null : pageNumber,
        "useCase": useCase == null ? null : useCase,
        "showCreator": showCreator == null ? null : showCreator,
        "showTeams": showTeams == null ? null : showTeams,
        "showCategories": showCategories == null ? null : showCategories,
      };
}

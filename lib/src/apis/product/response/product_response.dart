import 'package:deskover_develop/src/apis/category/response/category_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_response.g.dart';

@JsonSerializable()
class DataProductResponse {
  List<Product>? content;

  DataProductResponse({this.content});

  factory DataProductResponse.fromJson(Map<String, dynamic> json) => _$DataProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataProductResponseToJson(this);
  
}

@JsonSerializable()
class Product {
  int? id;
  String? name;
  String? slug;
  String? description;
  double? price;
  String? img;
  String? imgUrl;
  bool? actived;
  String? modifiedAt;
  String? modifiedBy;
  String? spec;
  String? utility;
  String? design;
  String? other;
  String? video;
  int? quantity;
  Discount? discount;
  SubCategory? subCategory;
  Brand? brand;
  // List<Null>? ratings;
  List<ProductThumbnails>? productThumbnails;
  int? averageRating;

  Product(
      {this.id,
        this.name,
        this.slug,
        this.description,
        this.price,
        this.img,
        this.imgUrl,
        this.actived,
        this.modifiedAt,
        this.modifiedBy,
        this.spec,
        this.utility,
        this.design,
        this.other,
        this.video,
        this.quantity,
        this.discount,
        this.subCategory,
        this.brand,
        // this.ratings,
        this.productThumbnails,
        this.averageRating
      });
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
  
}

@JsonSerializable()
class Discount {
  int? id;
  String? name;
  String? description;
  int? percent;
  String? startDate;
  String? endDate;
  bool? actived;
  String? modifiedAt;
  String? modifiedBy;

  Discount(
      {this.id,
        this.name,
        this.description,
        this.percent,
        this.startDate,
        this.endDate,
        this.actived,
        this.modifiedAt,
        this.modifiedBy
      });

  factory Discount.fromJson(Map<String, dynamic> json) => _$DiscountFromJson(json);
  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}

@JsonSerializable()
class SubCategory {
  int? id;
  CategoryReponse? category;
  String? img;
  String? imgUrl;
  String? name;
  String? description;
  String? slug;
  String? modifiedAt;
  bool? actived;
  String? modifiedBy;

  SubCategory(
      {this.id,
        this.category,
        this.img,
        this.imgUrl,
        this.name,
        this.description,
        this.slug,
        this.modifiedAt,
        this.actived,
        this.modifiedBy
      });
  factory SubCategory.fromJson(Map<String, dynamic> json) => _$SubCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}


@JsonSerializable()
class Brand {
  int? id;
  String? name;
  String? description;
  String? slug;
  bool? actived;
  String? modifiedAt;
  String? modifiedBy;

  Brand(
      {this.id,
        this.name,
        this.description,
        this.slug,
        this.actived,
        this.modifiedAt,
        this.modifiedBy});
  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class ProductThumbnails {
  int? id;
  String? thumbnail;
  String? thumbnailUrl;
  String? modifiedAt;
  String? modifiedBy;

  ProductThumbnails(
      {this.id,
        this.thumbnail,
        this.thumbnailUrl,
        this.modifiedAt,
        this.modifiedBy});
  factory ProductThumbnails.fromJson(Map<String, dynamic> json) => _$ProductThumbnailsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductThumbnailsToJson(this);
  
}

@JsonSerializable()
class Rating {
  int? id;
  String? thumbnail;
  String? thumbnailUrl;
  String? modifiedAt;
  String? modifiedBy;

  Rating(
      {this.id,
        this.thumbnail,
        this.thumbnailUrl,
        this.modifiedAt,
        this.modifiedBy});
  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  Map<String, dynamic> toJson() => _$RatingToJson(this);

}

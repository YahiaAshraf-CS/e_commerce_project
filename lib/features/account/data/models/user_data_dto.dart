import 'package:e_commerce/core/constants/app_assets.dart';
import 'package:e_commerce/features/account/domain/entities/user_data_entity.dart';

class UserDataDto {
  MessageDto? message;

  UserDataDto({this.message});

  UserDataDto.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null
        ? MessageDto.fromJson(json['message'])
        : null;
  }
  //to entity
  UserDataEntity toEntity() {
    return UserDataEntity(
      message: message!.toEntity(),
    );
  }
}

class MessageDto {
  String? sId;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? image;

  MessageDto({
    this.sId,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.image,
  });

  MessageDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
  }

  //to entity
  MessageEntity toEntity() {
    return MessageEntity(
      sId: sId ?? "id",
      name: name ?? "name",
      phone: phone ?? "01013387543",
      email: email ?? "email",
      address: address ?? "address",
      image: image ?? "",
    );
  }
}

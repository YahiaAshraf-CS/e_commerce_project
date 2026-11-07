import 'package:e_commerce/core/constants/app_assets.dart';

class UserDataEntity {
  MessageEntity message;

  UserDataEntity({this.message= const MessageEntity()});

 

 
}

class MessageEntity {
 final String sId;
 final String name;
 final String phone;
 final String email;
 final String address;
 final String image;

  const MessageEntity({
    this.sId="id",
    this.name="name",
    this.phone="01013387543",
    this.email="email",
    this.address="address",
    this.image=AppAssets.picture,
  });

  

  
}

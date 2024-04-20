import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/data/models/common_response.dart';
import 'package:flutter_app/core/data/models/token_info.dart';
import 'package:flutter_app/core/enums/request_type.dart';
import 'package:flutter_app/core/utils/network_util.dart';

class AuthRepository {
  Future<Either<String, TokenInfo>> login({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'auth/doctor/login',
        body: {
          'email': email,
          'password': password,
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, TokenInfo>> user_login({
    required String phone,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'auth/user/login',
        body: {
          'phone': phone,
          'password': password,
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, bool>> signUp({
    required String email,
    required String name,
    required String phone,
    required String governorate,
    required String university,
    required String collegeyear,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route:
            'auth/doctor/sign-up', // تغيير الطريقة إلى الطريقة الصحيحة لعملية Sign up
        // headers: NetworkConfig.getHeaders(
        //   type: RequestType.POST,
        //   needAuth: false,
        // ),
        body: {
          "email": email,
          "name": name,
          "phone": phone,
          "governorate": governorate,
          "university": university,
          "collegeyear": collegeyear,
          "password": password,
        },
      ).then(
        (response) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);

          if (commonResponse.getStatus) {
            return Right(true);
          } else {
            return Left(commonResponse.message);
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}

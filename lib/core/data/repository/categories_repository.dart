import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/data/models/common_response.dart';
import 'package:flutter_app/core/data/models/token_info.dart';
import 'package:flutter_app/core/data/models/doctor_info.dart';
import 'package:flutter_app/core/enums/request_type.dart';
import 'package:flutter_app/core/utils/network_util.dart';

class CategoriesRepository {
  Future<Either<String, List<String>>> getallcategories() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'products/categories',
        body: {},
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        List<String> lst = [];
        commonResponse.data!.forEach((element) {
          lst.add(element.toString());
        });
        if (commonResponse.getStatus) {
          return right(lst);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}

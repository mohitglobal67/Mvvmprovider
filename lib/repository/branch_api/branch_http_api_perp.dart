import 'dart:developer';

import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/model/branch_Model.dart';
import 'package:mvvm/model/movie_list/movie_list_model.dart';
import 'package:mvvm/configs/app_url.dart';
import 'package:mvvm/repository/branch_api/branch_repository.dart';

class BranchHttpApiRepository implements BranchRepository {
  final _apiServices = NetworkApiService();

  List<BranchDetailsModel> userListbranch = [];

  List userList = [];

  List<BranchDetailsModel> convertToBranchDetailsList(List<dynamic> jsonList) {
    return jsonList.map((json) => BranchDetailsModel.fromJson(json)).toList();
  }

  List<BranchDetailsModel> branches = [];
  @override
  Future<BranchDetailsModel> fetchBatchList() async {
    dynamic response =
        await _apiServices.getGetApiResponse(AppUrl.batchEndPoint);

    // branches =
    //     response.map((branch) => BranchDetailsModel.fromJson(branch)).toList();

    return BranchDetailsModel.fromJson(response);
  }
}

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/branch_Model.dart';

import 'package:mvvm/repository/branch_api/branch_repository.dart';

class BranchViewViewModel with ChangeNotifier {
  BranchRepository branchRepository;
  BranchViewViewModel({required this.branchRepository});

  ApiResponse<BranchDetailsModel> branchList = ApiResponse.loading();

  setBranchList(ApiResponse<BranchDetailsModel> response) {
    branchList = response;
    notifyListeners();
  }

  Future<void> fetchBranchListApi() async {
    setBranchList(ApiResponse.loading());

    branchRepository.fetchBatchList().then((value) {
      debugger();
      print(value);
      setBranchList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setBranchList(ApiResponse.error(error.toString()));
    });
  }
}

import 'package:mvvm/model/branch_Model.dart';

abstract class BranchRepository {
  Future<BranchDetailsModel> fetchBatchList();
}

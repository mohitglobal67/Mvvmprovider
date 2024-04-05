
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/model/branch_Model.dart';

class ApiResponse<T> {

  Status? status ;
  T? data ;
  String? message ;

  ApiResponse(this.status , this.data, this.message);

  ApiResponse.notStarted() : status = Status.notStarted ;

  ApiResponse.loading() : status = Status.loading ;

  ApiResponse.completed(this.data) : status = Status.completed ;

  ApiResponse.error(this.message) : status = Status.error ;


  @override
  String toString(){
    return "Status : $status \n Message : $message \n Data: $data" ;
  }

  map(BranchDetailsModel Function(dynamic json) param0) {}


}
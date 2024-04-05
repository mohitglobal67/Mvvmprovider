import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm/configs/components/loading_widget.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/view/home/widgets/error_widgets.dart';
import 'package:mvvm/view_model/branch/branch_view_model.dart';
import 'package:provider/provider.dart';

class BranchList extends StatefulWidget {
  const BranchList({super.key});

  @override
  State<BranchList> createState() => _BranchListState();
}

class _BranchListState extends State<BranchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<BranchViewViewModel>(
        create: (BuildContext context) =>
            BranchViewViewModel(branchRepository: getIt())
              ..fetchBranchListApi(),
        child: Consumer<BranchViewViewModel>(builder: (context, value, _) {
          switch (value.branchList.status) {
            case Status.loading:
              return const Center(child: LoadingWidget());
            case Status.error:
              return const HomeErrorWidget();
            case Status.completed:
              if (value.branchList.data!.branchName.isEmpty) {
                return const Center(child: Text('No data found'));
              }
              return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final batchlist = value.branchList.data;
                    return Card(
                      child: ListTile(
                        // leading: NetworkImageWidget(
                        //   borderRadius: 5,
                        //   imageUrl: moviesList.imageThumbnailPath.toString(),
                        // ),
                        title: Text(batchlist!.branchName.toString()),
                        // subtitle: Text(moviesList.network.toString()),
                        // trailing: Text(moviesList.status.toString()),
                      ),
                    );
                  });
            default:
              return Container();
          }
        }),
      ),
    );
  }
}

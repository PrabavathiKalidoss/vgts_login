import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vgts_login_example/view_page_viewmodel.dart';


class ViewPage extends ViewModelBuilderWidget<ViewPageViewModel>{

  @override
  void onViewModelReady(ViewPageViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(BuildContext context, ViewPageViewModel viewModel, Widget? child) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('VGTS',textScaleFactor: 1,),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              MaterialButton(
                child: Text("Sign In"),
                onPressed: () {
                  viewModel.login!.signIn(context);
                },
              ),

              Padding(padding:  EdgeInsets.only(top: 20.0)),

              MaterialButton(
                child: Text("Sign Up"),
                onPressed: () {
                  viewModel.login!.signUp(context);
                },
              ),
            ],
          ),)
    );
  }

  @override
  ViewPageViewModel viewModelBuilder(BuildContext context)=>ViewPageViewModel();

}



import 'package:domain/constants/error_types.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/model/base/error_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simplify_synergy_2/base/base_widget.dart';
import 'package:simplify_synergy_2/utils/color_utils.dart';
import 'package:simplify_synergy_2/utils/extension/base_page_extensions.dart';
import 'base_page_view_model.dart';

/// Every Page/View should be inherited from this
abstract class BasePage<VM extends BasePageViewModel> extends StatefulWidget {
  BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<VM extends BasePageViewModel,
T extends BasePage<VM>> extends State<T> {}

abstract class BaseStatefulPage<VM extends BasePageViewModel,
B extends BasePage<VM>> extends BasePageState<VM, B> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool subscribeVisibilityEvents = false;

  BaseStatefulPage({
    this.subscribeVisibilityEvents: false,
  });

  VM? _viewModel;

  bool get attached => _viewModel != null;

  @override
  Widget build(BuildContext context) {
    return _getLayout();
  }

  /// Returns viewModel of the screen
  VM getViewModel() {
    return attached
        ? _viewModel!
        : throw AppError(
      cause: Exception("View model is not attached"),
      error: ErrorInfo(message: "View Model is not attached"),
      type: ErrorType.UI,
    );
  }

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  /// Actual Screen which load scaffold and load UI
  Widget _getLayout() {
    return BaseWidget<VM>(
        providerBase: provideBase(),
        onModelReady: _onBaseModelReady,
        builder: (BuildContext context, VM? model, Widget? child) {
          return WillPopScope(
            onWillPop: onBackPressed,
            child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: scaffoldBackgroundColor(),
              appBar: buildAppbar(),
              extendBodyBehindAppBar: extendBodyBehindAppBar(),
              body: _buildScaffoldBody(context, model!),
              drawer: buildDrawer(),
              drawerEnableOpenDragGesture: drawerEnableOpenDragGesture(),
              bottomNavigationBar: buildBottomNavigationBar(),
              bottomSheet: buildBottomSheet(),
              resizeToAvoidBottomInset: true,
              // floatingActionButton: floatingButton(),
            ),
          );
        });
  }

  /// Building a appbar of screen
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  /// Building a appbar of screen
  Color scaffoldBackgroundColor() {
    return AppColor.very_light_grey;
  }

  /// Building a drawer of screen
  Widget? buildDrawer() {
    return null;
  }

  /// Building a bottom-sheet
  Widget? buildBottomSheet() {
    return null;
  }

  /// Building a bottomNaviagtion Bar
  Widget? buildBottomNavigationBar() {
    return null;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  bool drawerEnableOpenDragGesture() {
    return false;
  }

  Widget _buildScaffoldBody(BuildContext context, VM model) {
    return buildView(context, model);
  }

  @mustCallSuper
  Widget buildView(BuildContext context, VM model);

  void _onBaseModelReady(VM model) {
    _viewModel = model;
    model.error.listen((event) {
      // showShortToast(
      //   ErrorParser.getLocalisedStringError(
      //     error: event,
      //     localisedHelper: S.of(context),
      //   ),
      // );
    });
    model.toast.listen((message) {
      showShortToast(message);
    });
    onModelReady(model);
  }

  Future<bool> onBackPressed({dynamic param}) {
    return _onWillPop(param);
  }

  Future<bool> _onWillPop(dynamic param) {
    if (Navigator.canPop(context)) {
      if (param != null) {
        Navigator.pop(context, param);
        return Future.value(false);
      } else {
        Navigator.pop(
          context,
        );
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  /*Mandatory*/

  /// You can setup load something when model is ready, Ex: Load or fetch some data from remote layer
  void onModelReady(VM model) {}

  /// Declare and initialization of viewModel for the page
  ProviderBase provideBase();

}

abstract class BasePageViewWidget<T extends BasePageViewModel> extends Widget {
  final ProviderBase providerBase;

  BasePageViewWidget(this.providerBase);

  @protected
  Widget build(BuildContext context, T model);

  @override
  DataProviderElement<T> createElement() =>
      DataProviderElement<T>(this, this.providerBase);
}

class DataProviderElement<T extends BasePageViewModel>
    extends ComponentElement {
  final ProviderBase providerBase;

  DataProviderElement(BasePageViewWidget widget, this.providerBase)
      : super(widget);

  @override
  BasePageViewWidget get widget => super.widget as BasePageViewWidget;

  @override
  Widget build() {
    return BaseWidget<T>(
      providerBase: providerBase,
      builder: (context, model, child) {
        return widget.build(this, model!);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebPageController extends ChangeNotifier {
  InAppWebViewController? _controller;

  bool _canBack = false;
  bool _canForward = false;

  bool _canPop = false;

  double progressValue = 0;

  initController({required InAppWebViewController controller}) {
    _controller = controller;
    notifyListeners();
  }

  checkStatus() async {
    _canBack = await _controller?.canGoBack() ?? false;
    _canForward = await _controller?.canGoForward() ?? false;
    notifyListeners();
  }

  get getCanBack {
    checkStatus();
    return _canBack;
  }

  get getCanForward {
    checkStatus();
    return _canForward;
  }

  back() {
    _controller!.goBack();
    notifyListeners();
  }

  forward() {
    _controller!.goForward();
    notifyListeners();
  }

  get getCanPop {
    return _canPop;
  }

  checkCanPop() {
    if (_canBack) {
      _canPop = false;
      back();
    } else {
      _canPop = true;
    }
    notifyListeners();
  }

  loading({required int pro}) {
    progressValue = (pro / 100);
    notifyListeners();
  }
}

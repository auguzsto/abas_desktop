import 'package:abas_desktop/application/programa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:webview_windows/webview_windows.dart';

class NavegadorView extends StatefulWidget implements Programa {
  const NavegadorView({super.key});

  @override
  State<NavegadorView> createState() => _NavegadorViewState();

  @override
  get icone => Icons.language;

  @override
  get titulo => "Navegador";

}

class _NavegadorViewState extends State<NavegadorView>
    with AutomaticKeepAliveClientMixin {
  final navigatorKey = GlobalKey<NavigatorState>();
  final _controller = WebviewController();
  final _textController = TextEditingController();
  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    try {
      await _controller.initialize();
      _subscriptions.add(
        _controller.url.listen((url) {
          _textController.text = url;
        }),
      );

      _subscriptions.add(
        _controller.containsFullScreenElementChanged.listen((flag) {
          debugPrint('Contains fullscreen element: $flag');
        }),
      );

      await _controller.setBackgroundColor(Colors.transparent);
      await _controller.setPopupWindowPolicy(WebviewPopupWindowPolicy.deny);
      await _controller.loadUrl('https://google.com');

      if (!mounted) return;
      setState(() {});
    } on PlatformException catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Error'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Code: ${e.code}'),
                Text('Message: ${e.message}'),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Continue'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      });
    }
  }

  Widget compositeView() {
    if (!_controller.value.isInitialized) {
      return const Text(
        'Inicializando...',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'URL',
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  controller: _textController,
                  onSubmitted: (val) {
                    _controller.loadUrl(val);
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Webview(
                  _controller,
                  permissionRequested: _onPermissionRequested,
                ),
                StreamBuilder<LoadingState>(
                  stream: _controller.loadingState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.data == LoadingState.loading) {
                      return LinearProgressIndicator();
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(body: Center(child: compositeView()));
  }

  Future<WebviewPermissionDecision> _onPermissionRequested(
    String url,
    WebviewPermissionKind kind,
    bool isUserInitiated,
  ) async {
    final decision = await showDialog<WebviewPermissionDecision>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('WebView permission requested'),
        content: Text('WebView has requested permission \'$kind\''),
        actions: <Widget>[
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.deny),
            child: const Text('Deny'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.allow),
            child: const Text('Allow'),
          ),
        ],
      ),
    );

    return decision ?? WebviewPermissionDecision.none;
  }

  @override
  void dispose() {
    for (var s in _subscriptions) {
      s.cancel();
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

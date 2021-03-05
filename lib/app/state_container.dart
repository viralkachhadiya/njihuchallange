import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'app_config.dart';

class GlobalState {
  Env env;
  String appName;

  // add any other global state here
  GlobalState({this.env, this.appName});
}

class StateContainer extends StatefulWidget {
  final Widget child;
  final GlobalState globalState;

  StateContainer({
    @required this.child,
    this.globalState,
  });

  static StateContainerState of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>())
        .data;
  }

  @override
  StateContainerState createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  GlobalState globalState;

  void updateGlobalState({
    @required Env env,
    @required String appName,
  }) {
    if (globalState == null) {
      globalState = GlobalState(env: env, appName: appName);
      setState(() {
        globalState = globalState;
      });
    } else {
      // prevent any updates here
      if (env != globalState.env) {
        setState(() {
          globalState.env = env;
        });
      }
      if (appName != globalState.appName) {
        setState(() {
          globalState.appName = appName;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}

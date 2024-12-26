import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'nav_bar_shorts_model.dart';
export 'nav_bar_shorts_model.dart';

class NavBarShortsWidget extends StatefulWidget {
  const NavBarShortsWidget({
    super.key,
    required this.page,
  });

  final int? page;

  @override
  State<NavBarShortsWidget> createState() => _NavBarShortsWidgetState();
}

class _NavBarShortsWidgetState extends State<NavBarShortsWidget> {
  late NavBarShortsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarShortsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).accent4,
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.home,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  HapticFeedback.lightImpact();

                  context.pushNamed('HomePage');
                },
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.movie_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 25.0,
                ),
                onPressed: () async {
                  HapticFeedback.lightImpact();

                  context.pushNamed('Shorts');
                },
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  'CreatePost',
                  queryParameters: {
                    'tabIndex': serializeParam(
                      1,
                      ParamType.int,
                    ),
                  }.withoutNulls,
                );
              },
              child: SizedBox(
                width: 47.0,
                height: 47.0,
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 70.0,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF2120BC), Color(0xFF7D16C1)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, -1.0),
                            end: AlignmentDirectional(-1.0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 33.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 70.0,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0x59000000),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 33.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.gesture_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  HapticFeedback.lightImpact();

                  context.pushNamed('Threads');
                },
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                HapticFeedback.lightImpact();

                context.pushNamed(
                  'Profile',
                  queryParameters: {
                    'userReference': serializeParam(
                      currentUserReference,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: widget.page == 4
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 32.0,
                              height: 32.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                currentUserPhoto,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

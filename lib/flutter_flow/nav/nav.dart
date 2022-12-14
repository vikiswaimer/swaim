import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  SwaimFirebaseUser? initialUser;
  SwaimFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(SwaimFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NotesPageWidget() : WelcomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? NotesPageWidget()
              : WelcomePageWidget(),
          routes: [
            FFRoute(
              name: 'WelcomePage',
              path: 'welcomePage',
              builder: (context, params) => WelcomePageWidget(),
            ),
            FFRoute(
              name: 'MapPage',
              path: 'mapPage',
              requireAuth: true,
              builder: (context, params) => MapPageWidget(
                note: params.getParam(
                    'note', ParamType.DocumentReference, false, 'notes'),
                noteLocation: params.getParam('noteLocation', ParamType.LatLng),
                swaimLocation:
                    params.getParam('swaimLocation', ParamType.LatLng),
              ),
            ),
            FFRoute(
              name: 'NotesPage',
              path: 'notesPage',
              requireAuth: true,
              asyncParams: {
                'notes': getDoc('notes', NotesRecord.serializer),
              },
              builder: (context, params) => NotesPageWidget(
                notes: params.getParam('notes', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'addSwaim',
              path: 'addSwaim',
              requireAuth: true,
              asyncParams: {
                'initialLabel': getDoc('labels', LabelsRecord.serializer),
              },
              builder: (context, params) => AddSwaimWidget(
                payloadFromAggregation: params.getParam(
                    'payloadFromAggregation',
                    ParamType.DocumentReference,
                    false,
                    'aggregations'),
                initialLabel:
                    params.getParam('initialLabel', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'editSwaim',
              path: 'editSwaim',
              requireAuth: true,
              asyncParams: {
                'label': getDoc('labels', LabelsRecord.serializer),
              },
              builder: (context, params) => EditSwaimWidget(
                note: params.getParam(
                    'note', ParamType.DocumentReference, false, 'notes'),
                label: params.getParam('label', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'AggregationInfo',
              path: 'aggregationInfo',
              requireAuth: true,
              builder: (context, params) => AggregationInfoWidget(
                aggregation: params.getParam('aggregation',
                    ParamType.DocumentReference, false, 'aggregations'),
              ),
            ),
            FFRoute(
              name: 'FavoriteAggregationsListPage',
              path: 'favoriteAggregationsListPage',
              requireAuth: true,
              builder: (context, params) =>
                  FavoriteAggregationsListPageWidget(),
            ),
            FFRoute(
              name: 'FavoriteSwaimPage',
              path: 'favoriteSwaimPage',
              requireAuth: true,
              asyncParams: {
                'favAggregation': getDoc('favorite_aggregations',
                    FavoriteAggregationsRecord.serializer),
              },
              builder: (context, params) => FavoriteSwaimPageWidget(
                favAggregation:
                    params.getParam('favAggregation', ParamType.Document),
                swaimRef: params.getParam(
                    'swaimRef',
                    ParamType.DocumentReference,
                    false,
                    'favorite_aggregations'),
                label: params.getParam(
                    'label', ParamType.DocumentReference, false, 'labels'),
              ),
            ),
            FFRoute(
              name: 'LoginAndSignup',
              path: 'loginAndSignup',
              builder: (context, params) => LoginAndSignupWidget(),
            ),
            FFRoute(
              name: 'TypeEmailCodePage',
              path: 'typeEmailCodePage',
              builder: (context, params) => TypeEmailCodePageWidget(),
            ),
            FFRoute(
              name: 'PrivacyPolicy',
              path: 'privacyPolicy',
              builder: (context, params) => PrivacyPolicyWidget(),
            ),
            FFRoute(
              name: 'TermConditions',
              path: 'TermsConditions',
              builder: (context, params) => TermConditionsWidget(),
            ),
            FFRoute(
              name: 'FAQ',
              path: 'FAQ',
              builder: (context, params) => FaqWidget(),
            ),
            FFRoute(
              name: 'ContactUs',
              path: 'ContactUs',
              builder: (context, params) => ContactUsWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    String? collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/welcomePage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: Image.asset(
                    'assets/images/Word-S.svg',
                    fit: BoxFit.fill,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

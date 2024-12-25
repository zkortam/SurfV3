import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  final _snippetsManager = StreamRequestManager<List<SnippetsRecord>>();
  Stream<List<SnippetsRecord>> snippets({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<SnippetsRecord>> Function() requestFn,
  }) =>
      _snippetsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSnippetsCache() => _snippetsManager.clear();
  void clearSnippetsCacheKey(String? uniqueKey) =>
      _snippetsManager.clearRequest(uniqueKey);

  final _snippetsHomeManager = FutureRequestManager<List<UsersRecord>>();
  Future<List<UsersRecord>> snippetsHome({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRecord>> Function() requestFn,
  }) =>
      _snippetsHomeManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSnippetsHomeCache() => _snippetsHomeManager.clear();
  void clearSnippetsHomeCacheKey(String? uniqueKey) =>
      _snippetsHomeManager.clearRequest(uniqueKey);

  final _swipeAbleHomeManager = FutureRequestManager<List<PostsRecord>>();
  Future<List<PostsRecord>> swipeAbleHome({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PostsRecord>> Function() requestFn,
  }) =>
      _swipeAbleHomeManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSwipeAbleHomeCache() => _swipeAbleHomeManager.clear();
  void clearSwipeAbleHomeCacheKey(String? uniqueKey) =>
      _swipeAbleHomeManager.clearRequest(uniqueKey);

  final _shortsManager = StreamRequestManager<List<PostsRecord>>();
  Stream<List<PostsRecord>> shorts({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PostsRecord>> Function() requestFn,
  }) =>
      _shortsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearShortsCache() => _shortsManager.clear();
  void clearShortsCacheKey(String? uniqueKey) =>
      _shortsManager.clearRequest(uniqueKey);

  final _homePostNoAlgoManager = StreamRequestManager<List<PostsRecord>>();
  Stream<List<PostsRecord>> homePostNoAlgo({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PostsRecord>> Function() requestFn,
  }) =>
      _homePostNoAlgoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHomePostNoAlgoCache() => _homePostNoAlgoManager.clear();
  void clearHomePostNoAlgoCacheKey(String? uniqueKey) =>
      _homePostNoAlgoManager.clearRequest(uniqueKey);

  final _notificationsManager = StreamRequestManager<NotificationsRecord>();
  Stream<NotificationsRecord> notifications({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<NotificationsRecord> Function() requestFn,
  }) =>
      _notificationsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNotificationsCache() => _notificationsManager.clear();
  void clearNotificationsCacheKey(String? uniqueKey) =>
      _notificationsManager.clearRequest(uniqueKey);

  final _commentsManager = StreamRequestManager<List<CommentsRecord>>();
  Stream<List<CommentsRecord>> comments({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CommentsRecord>> Function() requestFn,
  }) =>
      _commentsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCommentsCache() => _commentsManager.clear();
  void clearCommentsCacheKey(String? uniqueKey) =>
      _commentsManager.clearRequest(uniqueKey);

  final _chatsMainManager = StreamRequestManager<List<ChatsRecord>>();
  Stream<List<ChatsRecord>> chatsMain({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ChatsRecord>> Function() requestFn,
  }) =>
      _chatsMainManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChatsMainCache() => _chatsMainManager.clear();
  void clearChatsMainCacheKey(String? uniqueKey) =>
      _chatsMainManager.clearRequest(uniqueKey);

  final _shortsProfileManager = StreamRequestManager<List<PostsRecord>>();
  Stream<List<PostsRecord>> shortsProfile({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PostsRecord>> Function() requestFn,
  }) =>
      _shortsProfileManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearShortsProfileCache() => _shortsProfileManager.clear();
  void clearShortsProfileCacheKey(String? uniqueKey) =>
      _shortsProfileManager.clearRequest(uniqueKey);
}

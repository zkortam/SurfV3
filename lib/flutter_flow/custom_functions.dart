import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

bool modder(
  int integer,
  int numberBeingModded,
  int result,
) {
  if (integer % numberBeingModded == result) {
    return true;
  } else {
    return false;
  }
}

bool dateThirteenYearsAgo(
  DateTime now,
  DateTime userInputDate,
) {
  DateTime thirteenYearsAgo = DateTime(now.year - 13, now.month, now.day);

  return userInputDate.isBefore(thirteenYearsAgo) ||
      userInputDate.isAtSameMomentAs(thirteenYearsAgo);
}

int voterInList(
  List<VotersStruct> voters,
  DocumentReference userReference,
) {
  /// Check if the voters list or userReference is null
  if (voters == null || userReference == null) {
    return 0; // No reaction if voters list or user reference is null
  }

  /// Iterate through the list of voters
  for (final voter in voters) {
    // Check if the current voter's UserReference matches the given userReference
    if (voter.userReference == userReference) {
      return voter.voteValue;
    }
  }

  // If no matching UserReference is found, return 0
  return 0;
}

int calculateNetVotes(List<VotersStruct> voters) {
  // Check if voters list is null
  if (voters == null) {
    return 0; // Return 0 if the list is null
  }

  int netVotes = 0;

  // Iterate through the list of voters to sum up the vote values
  for (final voter in voters) {
    netVotes += voter.voteValue;
  }

  // Return the net sum of all vote values
  return netVotes;
}

int identifySocialMediaPlatform(String link) {
  if (link.contains('twitter.com') ||
      link.contains('t.co') ||
      link.contains('x.com')) {
    return 10; // Twitter
  } else if (link.contains('instagram.com') || link.contains('instagr.am')) {
    return 1; // Instagram
  } else if (link.contains('facebook.com') ||
      link.contains('fb.com') ||
      link.contains('fb.me') ||
      link.contains('fbsbx.com')) {
    return 2; // Facebook
  } else if (link.contains('youtube.com') ||
      link.contains('youtu.be') ||
      link.contains('youtubekids.com')) {
    return 3; // YouTube
  } else if (link.contains('tiktok.com') || link.contains('vm.tiktok.com')) {
    return 4; // TikTok
  } else if (link.contains('gettr.com')) {
    return 5; // Gettr
  } else if (link.contains('linkedin.com') || link.contains('lnkd.in')) {
    return 7; // LinkedIn
  } else if (link.contains('rumble.com')) {
    return 8; // Rumble
  } else if (link.contains('github.com') || link.contains('git.io')) {
    return 9; // GitHub
  } else if (link.contains('snapchat.com') || link.contains('sc.com')) {
    return 11; // Snapchat
  } else if (link.contains('reddit.com') || link.contains('redd.it')) {
    return 12; // Reddit
  } else if (link.contains('discord.com') || link.contains('discord.gg')) {
    return 13; // Discord
  } else if (link.contains('spotify.com') || link.contains('spoti.fi')) {
    return 14; // Spotify
  } else {
    return -1; // Unrecognized or other platform
  }
}

int isImageOrVid(String? path) {
  if (path == null) {
    return 2;
  }

  final imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'tiff'];
  final videoExtensions = [
    'mp4',
    'avi',
    'mov',
    'mkv',
    'flv',
    'wmv',
    'webm',
    'mpeg'
  ];

  String extension = path.split('.').last.toLowerCase();

  if (imageExtensions.contains(extension)) {
    return 0; // It's an image
  } else if (videoExtensions.contains(extension)) {
    return 1; // It's a video
  } else {
    throw ArgumentError("Unsupported file type");
  }
}

int stringLength(String string) {
  return string.length;
}

String refineThreadText(String text) {
  // Regular expression to match hashtags and URLs
  final pattern = RegExp(
      r'(#\w+|((https?:\/\/)?(www\.)?[a-zA-Z0-9\-]+\.[a-zA-Z]{2,}(:\d+)?(\/[^\s]*)?))');

  // Remove all hashtags and URLs
  return text.replaceAll(pattern, '').trim();
}

List<String> collecthashtags(String text) {
  return RegExp(r'#\w+')
      .allMatches(text)
      .map((match) => match.group(0)!)
      .toList();
}

int adder(int number) {
  return number++;
}

int subber(int x) {
  return x--;
}

String extractLink(String text) {
  final urlRegex = RegExp(
    r'((https?:\/\/)?(www\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(\/[^\s]*)?)\b',
    caseSensitive: false,
  );

  // Find the first match in the text
  final match = urlRegex.firstMatch(text);

  // Ensure the match is a valid URL format without spaces and contains at least one period
  if (match != null) {
    String url = match.group(0) ?? '';

    // Check if the match contains any spaces and at least one period
    if (!url.contains(' ') && url.contains('.')) {
      return url;
    }
  }

  // If no valid link is found, return an empty string
  return '';
}

bool userInList(
  List<DocumentReference> users,
  DocumentReference user,
) {
  return users.contains(user);
}

int isSecure(String link) {
  // Check if link explicitly starts with 'https://'
  if (link.startsWith('https://')) {
    return 1;
  }

  if (identifySocialMediaPlatform(link) != -1) {
    return 1;
  }

  // If it starts with 'http://', it's not secure
  if (link.startsWith('http://')) {
    return 0;
  }

  // If no protocol is provided, impartial
  return -1;
}

double votePercent(
  List<VotersStruct> voters,
  int targetVoteValue,
) {
  // Handle null or empty voters list
  if (voters == null || voters.isEmpty) {
    return 0.0; // Return 0.0 for safety
  }

  // Count instances of targetVoteValue in the voters list
  int count = 0;
  for (final voter in voters) {
    if (voter.voteValue == targetVoteValue) {
      count++;
    }
  }

  // Calculate the percentage and return
  return count / voters.length;
}

int roundAndMultiply(double value) {
  int roundedValue = value.round();
  return roundedValue * 100;
}

DocumentReference idToReference(String postID) {
  return FirebaseFirestore.instance.collection('posts').doc(postID);
}

DateTime nextDay(DateTime currentTime) {
  return currentTime.add(Duration(days: 1));
}

List<FollowerGroupStruct> updateGroupPeople(
  String groupName,
  List<FollowerGroupStruct> groups,
  List<DocumentReference> users,
) {
  for (var group in groups) {
    if (group.name == groupName) {
      group.people = users; // Update the people field
      break; // Exit the loop as we found the matching group
    }
  }
  return groups; // Return the updated list
}

List<FollowerGroupStruct> removeUserFromGroup(
  String groupName,
  List<FollowerGroupStruct> groups,
  DocumentReference user,
) {
  for (var group in groups) {
    if (group.name == groupName) {
      group.people?.removeWhere(
          (reference) => reference == user); // Remove the matching user
      break; // Stop after finding the matching group
    }
  }
  return groups; // Return the updated list of groups
}

List<String> fourOptionsToList(
  String option1,
  String option2,
  String option3,
  String option4,
) {
  return [
    option1.trim().isNotEmpty ? option1 : " ",
    option2.trim().isNotEmpty ? option2 : " ",
    option3.trim().isNotEmpty ? option3 : " ",
    option4.trim().isNotEmpty ? option4 : " ",
  ];
}

DocumentReference returnOtherUser(
  List<DocumentReference> users,
  DocumentReference singleUser,
) {
  if (users.length >= 2) {
    return users[0] == singleUser ? users[1] : users[0];
  } else {
    return users[0];
  }
}

bool isDMExistent(
  List<ChatsRecord> chats,
  DocumentReference ref,
) {
  for (var chat in chats) {
    // Check if the users field exists and contains exactly 2 users
    if (chat.users != null && chat.users.length == 2) {
      // Check if the provided ref exists in the users list
      if (chat.users.contains(ref)) {
        return true;
      }
    }
  }

  // If no matching chat is found, return false
  return false;
}

bool isMessageValid(String str) {
  String trimmedStr = str.trim();

  // Check if the trimmed string is empty
  return trimmedStr.isNotEmpty;
}

List<DocumentReference> stringRefoPostDocRef(List<String> reflist) {
  List<DocumentReference> documentReferences = [];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  for (String i in reflist) {
    DocumentReference documentReference = firestore.doc(i);
    documentReferences.add(documentReference);
  }
  return documentReferences;
}

List<UserMessageDataStruct> userToMessageData(
  List<DocumentReference> users,
  DateTime currentTime,
) {
  return users.map((userRef) {
    return UserMessageDataStruct(
      userReference: userRef,
      lastTimeOnline: currentTime,
    );
  }).toList();
}

List<UserMessageDataStruct> updateUserLatestTime(
  DocumentReference userRef,
  List<UserMessageDataStruct> oldUserMessageData,
  DateTime currentTime,
) {
  // Initialize the index of the user to -1
  int userIndex = -1;

  // Find the index of the user if they exist in the list
  for (int i = 0; i < oldUserMessageData.length; i++) {
    if (oldUserMessageData[i].userReference == userRef) {
      userIndex = i;
      break;
    }
  }

  // If the user is found, remove their existing data
  if (userIndex != -1) {
    oldUserMessageData.removeAt(userIndex);
  }

  // Add a new entry for the user with the current time
  oldUserMessageData.add(UserMessageDataStruct(
    userReference: userRef,
    lastTimeOnline: currentTime,
  ));

  return oldUserMessageData;
}

bool checkIfRead(
  DateTime messageTime,
  List<UserMessageDataStruct> latestUser,
  DocumentReference currentUser,
) {
  if (latestUser.isEmpty) {
    return false; // Assuming no users have read the message if the list is empty
  }

  return latestUser.any((userMessage) {
    final lastTime = userMessage.lastTimeOnline;
    // Check if the last time is after the message time and it's not the current user
    return lastTime != null &&
        lastTime.isAfter(messageTime) &&
        userMessage.userReference != currentUser;
  });
}

List<PostsforalgoStruct> makePosts(
  List<String> captions,
  List<String> timestamps,
  List<String> authors,
  List<String>? isShorts,
  List<String> isStealth,
  List<String> medias,
  List<String> shortVideos,
  List<String> voterrefs,
  List<String> votervalues,
  List<String> hashtags,
  int postcount,
) {
  List<PostsforalgoStruct> postlist = [];
  for (var i = 0; i < postcount; i++) {
    PostsforalgoStruct post = PostsforalgoStruct();
    post.caption = captions[i];
    post.timestamp = DateFormat("dd-MM-yyyy HH:mm:ss").parse(timestamps[i]);
    //authors here
    post.author = FirebaseFirestore.instance.doc(authors[i]);
    post.isShort = (isShorts?[i]?.toLowerCase() == 'true') ? true : false;
    post.isStealth = (isStealth[i].toLowerCase() == 'true') ? true : false;
    post.media = medias[i];
    post.shortVideo = shortVideos[i];
    //Voters
    for (var j = 0; j < voterrefs.length; j++) {
      VotersStruct voter = VotersStruct();
      voter.userReference = FirebaseFirestore.instance.doc(voterrefs[j]);
      voter.voteValue = int.parse(votervalues[j]);
    }

    post.hashtags.add(hashtags[i]);
    postlist.add(post);
  }
  return postlist;
}

List<DocumentReference> postrefslist(List<String> apiresult) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<DocumentReference> docRefs = [];
  for (String id in apiresult) {
    docRefs.add(firestore.doc(id));
  }
  return docRefs;
}

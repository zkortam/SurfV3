// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<void> savePostsFromJson(List<dynamic> jsonList) async {
  // Loop through each item in the JSON list
  for (var item in jsonList) {
    // Extract post data
    final postId = item[0]; // Assumes item[0] is the document ID
    final postData = item[1]; // Assumes item[1] is a map of post data

    // Prepare data for Firestore
    final Map<String, dynamic> dataToSave = {
      "Caption": postData["Caption"] ?? '',
      "TimePosted": postData["TimePosted"] ?? DateTime.now(),
      "Author": postData[
          "Author"], // Ensure this matches a DocumentReference in your schema
      "media":
          postData["media"] != null ? List<String>.from(postData["media"]) : [],
      "isShort": postData["isShort"] ?? false,
      "isSpoiler": postData["isSpoiler"] ?? false,
      "isStealth": postData["isStealth"] ?? false,
      "hashtags": postData["hashtags"] != null
          ? List<String>.from(postData["hashtags"])
          : [],
      "Voters": postData["Voters"] ?? [],
      "SpoilerClickers": postData["SpoilerClickers"] ?? [],
    };

    // Add a new document to the "posts" collection
    // In FlutterFlow, use the Firestore `Create Document` action here instead of FirebaseFirestore instance

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .set(dataToSave, SetOptions(merge: true));
  }
}

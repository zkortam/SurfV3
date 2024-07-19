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
      // Check the VoteValue and return accordingly
      if (voter.voteValue == -1) {
        return -1; // User disliked the post
      } else if (voter.voteValue == 1) {
        return 1; // User liked the post
      }
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

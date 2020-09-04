import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  final brews = Firestore.instance.collection('brews');
}
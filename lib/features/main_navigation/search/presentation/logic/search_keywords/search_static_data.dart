import 'package:flutter/material.dart';

class SearchStaticData {
  final List<String> colorsOptions = [
    "black_and_white",
    "black",
    "white",
    "yellow",
    "orange",
    "red",
    "purple",
    "magenta",
    "green",
    "teal",
    "blue",
  ];
  final List<SearchImageColorModel> colors = [
    SearchImageColorModel(colorValue: "black_and_white", color: Colors.black),
    SearchImageColorModel(colorValue: "black", color: Colors.black),
    SearchImageColorModel(colorValue: "white", color: Colors.white),
    SearchImageColorModel(colorValue: "yellow", color: Colors.yellow),
    SearchImageColorModel(colorValue: "orange", color: Colors.orange),
    SearchImageColorModel(colorValue: "red", color: Colors.red),
    SearchImageColorModel(colorValue: "purple", color: Colors.purple),
    SearchImageColorModel(colorValue: "magenta", color: Colors.pink),
    SearchImageColorModel(colorValue: "green", color: Colors.green),
    SearchImageColorModel(colorValue: "teal", color: Colors.teal),
    SearchImageColorModel(colorValue: "blue", color: Colors.blue),
  ];
  final List<String> orientationOptions = [
    "landscape",
    "portrait",
    "squarish",
  ];
  final List<String> orderByOptions = [
    "relevant",
    "latest",
  ];
}

class SearchImageColorModel {
  final String colorValue;
  final Color color;

  SearchImageColorModel({required this.colorValue, required this.color});
}

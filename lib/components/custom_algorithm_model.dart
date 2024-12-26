import '/flutter_flow/flutter_flow_util.dart';
import 'custom_algorithm_widget.dart' show CustomAlgorithmWidget;
import 'package:flutter/material.dart';

class CustomAlgorithmModel extends FlutterFlowModel<CustomAlgorithmWidget> {
  ///  Local state fields for this component.

  double politicalView = 0.0;

  List<int> generationNumbers = [];
  void addToGenerationNumbers(int item) => generationNumbers.add(item);
  void removeFromGenerationNumbers(int item) => generationNumbers.remove(item);
  void removeAtIndexFromGenerationNumbers(int index) =>
      generationNumbers.removeAt(index);
  void insertAtIndexInGenerationNumbers(int index, int item) =>
      generationNumbers.insert(index, item);
  void updateGenerationNumbersAtIndex(int index, Function(int) updateFn) =>
      generationNumbers[index] = updateFn(generationNumbers[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - SmartGeneration] action in Container widget.
  String? output;
  // State field(s) for Slider widget.
  double? sliderValue1;
  // State field(s) for Slider widget.
  double? sliderValue2;
  // State field(s) for Slider widget.
  double? sliderValue3;
  // State field(s) for Slider widget.
  double? sliderValue4;
  // State field(s) for Slider widget.
  double? sliderValue5;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

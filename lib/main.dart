import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExampleStepper(),
    );
  }
}

class ExampleStepper extends StatefulWidget {
  @override
  _ExampleStepperState createState() => _ExampleStepperState();
}

class _ExampleStepperState extends State<ExampleStepper> {

  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  List<Step> steps = [
    Step(
      title: const Text("Step 1"),
      isActive: true,
      state: StepState.editing,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Informacao 1"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Informação 2"),
          )
        ],
      ),
    ),
    Step(
      title: const Text("Step 2"),
      isActive: false,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Informacao 1"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Informação 2"),
          ),
        ],
      ),
    ),
    Step(
      title: const Text("Step 3"),
      isActive: false,
      state: StepState.disabled,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Informacao 1"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Informação 2"),
          ),
        ],
      ),
    ),
    Step(
      title: const Text("Step 4"),
      isActive: false,
      state: StepState.error,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Informacao 1"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Informação 2"),
          ),
        ],
      ),
    ),
    Step(
      title: const Text("Step 4"),
      isActive: false,
      state: StepState.indexed,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Informacao 1"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Informação 2"),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo Stepper"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
            steps: steps,
            currentStep: currentStep,
            onStepContinue: next,
            onStepTapped: (step) => goTo(step),
            onStepCancel: cancel,
          ),
          )
        ],
      ),
    );
  }
}

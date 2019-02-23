import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter stepper example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _Stepper(),
    );
  }
}

class _Stepper extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<_Stepper> {
	int _currentStep = 0;
	bool flag = true;
	List<Step> _steps = new List<Step>();
	
	
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Stepper', style: new TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
      ),
      body: _myStepper(),
	    floatingActionButton: FloatingActionButton(
		    onPressed: () {
		    	setState(() {
				    _steps.add(new Step(title: Text('Step ${_steps.length + 1}'), content: TextField(), isActive: _currentStep >= _steps.length));
			    });
		    },
		    tooltip: 'Add new Step',
		    child: Icon(Icons.note_add),
	    ),
    );
  }
  
  Stepper _myStepper() {
  	_myStepsInit();
  	return Stepper(
	    steps: _steps,
	    currentStep: this._currentStep,
	    onStepTapped: (step) {
		    setState(() {
			    this._currentStep = step;
		    });
	    },
	    onStepContinue: () {
		    setState(() {
			    if(this._currentStep < _steps.length - 1) {
				    this._currentStep++;
			    }
			    else {
				    print('Completed, check fields.');
			    }
		    });
	    },
	    onStepCancel: () {
		    setState(() {
			    if(this._currentStep > 0) {
				    this._currentStep--;
			    }
		    });
	    },
    );
  }
	
	void _myStepsInit() {
		_steps = [
			Step(
				title: Text('Step 1'),
				content: TextField(),
				isActive: _currentStep >= 0,
			),
			Step(
				title: Text('Step 2'),
				content: TextField(),
				isActive: _currentStep >= 1,
			),
			Step(
				title: Text('Step 3'),
				content: TextField(),
				isActive: _currentStep >= 2,
			)
		];
	}
}

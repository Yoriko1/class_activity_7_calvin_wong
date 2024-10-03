import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToggleVisibilityPage(),
    );
  }
}

class ToggleVisibilityPage extends StatefulWidget {
  @override
  _ToggleVisibilityPageState createState() => _ToggleVisibilityPageState();
}

class _ToggleVisibilityPageState extends State<ToggleVisibilityPage> {
  // Variable to track visibility of the text
  bool _isTextVisible = true;

  // Variable to track visibility of the frame
  bool _isFrameVisible = true;

  // Function to toggle text visibility
  void _toggleTextVisibility() {
    setState(() {
      _isTextVisible = !_isTextVisible;
    });
  }

  // Function to toggle frame visibility
  void _toggleFrameVisibility() {
    setState(() {
      _isFrameVisible = !_isFrameVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fading Text Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GestureDetector to toggle text visibility on tap
            GestureDetector(
              onTap: _toggleTextVisibility, // Toggle text on tap
              child: AnimatedOpacity(
                opacity: _isTextVisible ? 1.0 : 0.0,
                duration: Duration(seconds: 2), // Animation duration
                child: _isFrameVisible
                    ? Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Hello, Flutter!',
                          style: TextStyle(fontSize: 24, color: Colors.blue),
                        ),
                      )
                    : Container(), // Empty container when frame is not visible
              ),
            ),
            SizedBox(height: 20), // Space between text and buttons
            // Button to toggle visibility of the frame
            ElevatedButton(
              onPressed: _toggleFrameVisibility,
              child: Text(_isFrameVisible ? 'Hide Frame' : 'Show Frame'),
            ),
            SizedBox(height: 10), // Space between buttons
            // Button to toggle visibility of the text
            ElevatedButton(
              onPressed: _toggleTextVisibility,
              child: Text(_isTextVisible ? 'Hide Text' : 'Show Text'),
            ),
          ],
        ),
      ),
    );
  }
}

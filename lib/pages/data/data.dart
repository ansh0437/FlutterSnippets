import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/components/buttons.dart';
import 'package:flutter_snippets/models/tutorial.dart';

class DataPage extends BaseWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends BaseState<DataPage> {
  Tutorial tutorial;

  void _passData() {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(arguments: "Passed Data..."),
            builder: (context) {
              return PassDataPage();
            }));
  }

  void _returnData() async {
    final data =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ReturnDataPage();
    }));
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    tutorial = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: scaffoldKey,
      appBar: appBar(tutorial.title),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              buildRaisedButton(
                  title: "Pass Data", width: getWidth(), onPress: _passData),
              SizedBox(height: 10),
              buildRaisedButton(
                  title: "Return Data",
                  width: getWidth(),
                  onPress: _returnData),
            ],
          ),
        ),
      ),
    );
  }
}

class PassDataPage extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text('Pass Data'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Center(
          child: Text(data),
        ),
      ),
    );
  }
}

class ReturnDataPage extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text('Return Data'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            buildRaisedButton(
                title: "Return Data",
                width: 200.0,
                onPress: () {
                  Navigator.pop(context, "Returned data...");
                })
          ],
        ),
      ),
    );
  }
}

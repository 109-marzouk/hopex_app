import 'package:flutter/material.dart';

class CustomStep {
  final String title;
  final Widget page;
  CustomStep({@required this.title, @required this.page});
}


class MyWidget extends StatefulWidget {
  const MyWidget({ Key key }) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ScrollController _scrollController = new ScrollController();
  static const double STEP_WIDTH = 90;
  PageController pageController = PageController();
  List<CustomStep> stepsList;
  int currentPage=0;
  @override
  void initState() {
    super.initState();
    stepsList = [
      CustomStep(
        title: 'ddddd',
        page: Placeholder(
          color: Colors.pink,
        ),
      ),
      CustomStep(
        title: 'zzzzzzzz',
        page: Placeholder(
          color: Colors.deepPurple,
        ),
      ),
    ];
  }

  SizedBox buildStepDivider(int index) {
    return SizedBox(
      height: 90,
      child: Container(
        alignment: Alignment.topCenter,
        child: Transform.translate(
          offset: Offset(0, 16),
          child: Container(
            color: index < currentPage
                ? Theme.of(context).primaryColor
                : Colors.grey,
            width: 30,
            height: 3,
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }


  buildStep(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 90,
        width: STEP_WIDTH,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index <= currentPage
                    ? Theme.of(context).primaryColor
                    : Colors.grey[300],
              ),
              padding: EdgeInsets.all(10),
              child: Text((index + 1).toString()),
            ),
            Expanded(
                child: Text(
                  stepsList[index].title,
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }

  _buildStepper(int currentStep) {
    Future.delayed(
        Duration(milliseconds: 100),
            () => _scrollController.animateTo((STEP_WIDTH * currentStep).toDouble(),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut));
    return Center(
      child: SizedBox(
        height: 110,
        child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: stepsList.length,
            itemBuilder: (ctx, index) => index < stepsList.length - 1
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildStep(index),
                buildStepDivider(index)
              ],
            )
                :Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  buildStep(index)]) ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('hello'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildStepper(currentPage),
          Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemCount: stepsList.length,
                itemBuilder: (ctx, index) =>
                stepsList[index].page,
              )),
        ],
      ),
    );
  }

}
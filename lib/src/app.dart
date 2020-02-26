import 'package:flutter/material.dart';
import 'package:flutter_wallet_transaction/src/colors/app_colors.dart';
import 'package:flutter_wallet_transaction/src/widget/custom_app_bar.dart';
import 'package:flutter_wallet_transaction/src/widget/dashed_divider.dart';

class App extends StatefulWidget {
  App({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _animationController2;
  Animation<double> _doubleAnimation;
  Animation<double> _doubleAnimationPosition;
  Animation<double> _doubleAnimationPositionContent;
  bool showContainer = false;
  double safePadding;
  double valueDistance;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            this.showContainer = true;
            _animationController.reverse();
            _animationController2.forward();
          });
        }
      });

    _animationController2 = new AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {}
      });

    _doubleAnimationPositionContent =
        new Tween(begin: 1000.0, end: 100.0).animate(_animationController2);
    _doubleAnimation =
        new Tween(begin: 50.0, end: 300.0).animate(_animationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    safePadding = MediaQuery.of(context).viewPadding.top;

    if (safePadding > 40) {
      valueDistance = MediaQuery.of(context).size.height * 0.409;
      _doubleAnimationPosition =
          new Tween(begin: 290.0, end: 10.0).animate(_animationController);
    } else {
      valueDistance = MediaQuery.of(context).size.height * 0.550;
      _doubleAnimationPosition =
          new Tween(begin: 260.0, end: 10.0).animate(_animationController);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBlue: showContainer,
        function: showContainer ? _onClickBack : null,
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 7,
                    child: SingleChildScrollView(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                _buildTitle(),
                                SizedBox(height: 20),
                                _buildTextMoney(),
                                SizedBox(height: 20),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 30),
                                  height: 200,
                                  child: _buildCard(),
                                ),
                                _buildTitleActivity('activity'),
                                Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(right: 50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      _buildItemGraphic(100),
                                      _buildItemGraphic(80),
                                      _buildItemGraphic(90),
                                      _buildItemGraphic(100),
                                      _buildItemGraphic(70),
                                      _buildItemGraphic(85),
                                      _buildItemGraphic(70),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 50),
                                  child: DashedDivider(
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      _buildItemGraphic(60, isBelowItem: true),
                                      _buildItemGraphic(80, isBelowItem: true),
                                      _buildItemGraphic(60, isBelowItem: true),
                                      _buildItemGraphic(20, isBelowItem: true),
                                      _buildItemGraphic(48, isBelowItem: true),
                                      _buildItemGraphic(48, isBelowItem: true),
                                      _buildItemGraphic(48, isBelowItem: true),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'last transaction',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                _buildItemTransaction(),
                                SizedBox(height: 20),
                                _buildItemTransaction(),
                                SizedBox(height: 20),
                                _buildItemTransaction(),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                          Positioned(
                            top: valueDistance,
                            left: _doubleAnimationPosition.value,
                            child: GestureDetector(
                              onTap: () {
                                _animationController.forward();
                              },
                              child: Container(
                                height: _doubleAnimation.value,
                                width: _doubleAnimation.value,
                                decoration: BoxDecoration(
                                  color: AppColors.color5,
                                  borderRadius: BorderRadius.circular(
                                      _doubleAnimation.value),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.color1,
                                      blurRadius: 60,
                                      spreadRadius:
                                          1.0, // has the effect of extending the shadow
                                      offset: Offset(
                                        10.0, // horizontal, move right 10
                                        10.0, // vertical, move down 10
                                      ),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.color8,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            this.showContainer
                ? Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.color2,
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 50,
                            top: 2,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'TRANSACTIONS',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'All transactions',
                                style: TextStyle(
                                  color: AppColors.color4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _doubleAnimationPositionContent.value),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Container(
                              margin: const EdgeInsets.only(
                                top: 50,
                                left: 50,
                                right: 50,
                              ),
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: _buildTitleActivity('yesterday'),
                                  ),
                                  SizedBox(height: 20),
                                  _buildItemTransaction(),
                                  SizedBox(height: 20),
                                  _buildItemTransaction(),
                                  SizedBox(height: 20),
                                  _buildItemTransaction(),
                                  SizedBox(height: 20),
                                  _buildItemTransaction(),
                                  SizedBox(height: 20),
                                  _buildItemTransaction(),
                                  SizedBox(height: 20),
                                  _buildItemTransaction(),
                                  SizedBox(height: 20),
                                  Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.color4,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text('See more'),
                                    ),
                                  ),
                                  SizedBox(height: 50),
                                ],
                              )),
                        ),
                      ),
                      Positioned(
                        top: 75,
                        left: 320,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.color5,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.color1,
                                blurRadius: 60,
                                spreadRadius:
                                    1.0, // has the effect of extending the shadow
                                offset: Offset(
                                  10.0, // horizontal, move right 10
                                  10.0, // vertical, move down 10
                                ),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.color8,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Current balance',
          style: TextStyle(
            color: AppColors.color3,
            fontSize: 16,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: Icon(
            Icons.more_horiz,
            color: AppColors.color4,
          ),
        ),
      ],
    );
  }

  _buildTextMoney() {
    return Container(
      margin: const EdgeInsets.only(right: 50),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            '\$',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          Text(
            '120.60',
            style: TextStyle(
              fontSize: 70,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'USD',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.color2,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
      height: 200,
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 40, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.star_border,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  '\$ 1220.0',
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.color8,
                  ),
                ),
                Text(
                  'your incoming',
                  style: TextStyle(
                    color: AppColors.color8,
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.reply,
                  color: AppColors.color8,
                ),
                Text(
                  '\$ 220.0',
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.color8,
                  ),
                ),
                Text(
                  'your spending',
                  style: TextStyle(
                    color: AppColors.color8,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildTitleActivity(String title) {
    return Row(
      children: <Widget>[
        Text(
          '$title',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(width: 20),
        _chipIcon()
      ],
    );
  }

  _chipIcon() {
    return Container(
      width: 80,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '1 WEEK',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 16,
          ),
        ],
      ),
    );
  }

  _buildItemGraphic(double value, {isBelowItem = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          '${value.toInt()}',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: value,
          width: 10,
          decoration: BoxDecoration(
            color: isBelowItem ? AppColors.color9 : AppColors.color1,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }

  _buildItemTransaction() {
    return Row(
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.color1,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 15),
        _buildItemRight(),
      ],
    );
  }

  _buildItemRight() {
    return Expanded(
        child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'CAR',
                  style: TextStyle(
                    color: AppColors.color4,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Fuel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 40),
              child: Text(
                '\$ 120.0',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          height: 0.8,
          width: double.maxFinite,
          color: Colors.grey,
        ),
      ],
    ));
  }

  _onClickBack() {
    setState(() {
      this.showContainer = false;
    });
    _animationController2.reverse();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}

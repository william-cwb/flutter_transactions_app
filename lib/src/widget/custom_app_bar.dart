import 'package:flutter/material.dart';
import 'package:flutter_wallet_transaction/src/colors/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBlue;
  final Function function;
  const CustomAppBar({@required this.isBlue, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isBlue ? AppColors.color2 : Colors.white,
      child: Container(
        padding: const EdgeInsets.only(top: 40, left: 15, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: function,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: isBlue ? AppColors.color1 : AppColors.color8,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: isBlue ? AppColors.color8 : AppColors.color3,
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                isBlue
                    ? Container()
                    : Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://avatars0.githubusercontent.com/u/47876409?v=4'),
                          ),
                        ),
                      ),
                Positioned(
                  top: 25,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColors.color1,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.color1,
                          blurRadius: 10,
                          spreadRadius:
                              0.2, // has the effect of extending the shadow
                          offset: Offset(
                            2.0, // horizontal, move right 10
                            3.0, // vertical, move down 10
                          ),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '19',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}

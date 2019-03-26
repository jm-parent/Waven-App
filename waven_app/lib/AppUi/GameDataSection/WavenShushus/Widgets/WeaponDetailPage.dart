import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/Widgets/WeaponDetailActifCard.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/Widgets/WeaponDetailEnterAnim.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiDetailledClass.dart';

class WeaponDetailPage extends StatefulWidget {
  WeaponDetailPage(
      {@required this.weaponData, @required AnimationController controller})
      : animation = new WeaponDetailEnterAnim(controller);
  final Weapon weaponData;
  final WeaponDetailEnterAnim animation;

  @override
  _WeaponDetailPageState createState() => _WeaponDetailPageState();
}

class _WeaponDetailPageState extends State<WeaponDetailPage> {

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      animation: widget.animation.controller,
      builder: _buildAnimation,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return new Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 220,
              pinned: true,
              centerTitle: true,
              title: Opacity(
                opacity: widget.animation.nameWeaponOpacity.value ?? 0,
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    widget.weaponData.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                   _buildSliverBackground(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                           _buildAvatar(),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                centerTitle: true,
              ),
            ),
            _buildSliverList(),
          ],
        ),
      ),
    );
  }


  Widget _buildAvatar() {
    return new Transform(
      transform: new Matrix4.diagonal3Values(
        widget.animation.avatarSize.value,
        widget.animation.avatarSize.value,
        1.0,
      ),
      alignment: Alignment.center,
      child:   Container(
        height: 130,
        width: 130,

        child: DecoratedBox(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:Image.asset('images/ShushusImages/ShushusStatuette/sprite_iop_4.png').image,
                    fit: BoxFit.fitHeight))),
      )
    );
  }

  _buildSliverBackground() {
    return  Positioned.fill(
      child: Hero(
        tag: "tag"+widget.weaponData.id,
        child: Image.asset(
                      "images/ShushusImages/GodWavenBg_143.jpg",fit: BoxFit.cover,),
      ),
    );
  }

  _buildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          WeaponDetailActifCard(weaponData: widget.weaponData,animation : widget.animation),
          //WeaponDetailPassifCard(),
          //WeaponDetailStatsCard(),
          //WeaponDetailDeckCard()
        ],
      ),
    );
  }
}

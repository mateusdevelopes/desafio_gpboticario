import 'package:desafio_gpboticario/shared/design/design_colors.dart';
import 'package:flutter/material.dart';

class SectionButtonWidget extends StatelessWidget {
  const SectionButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 2,
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              dense: true,
              leading: Container(
                decoration: BoxDecoration(
                  color: Color(0xffF4F5F7),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.settings,
                  color: DesignColors.COR_TEMA,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Definições do Perfil",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Atualize as definições do perfil",
                    style: TextStyle(color: Color(0xffF6F6F8F)),
                  ),
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: DesignColors.COR_TEMA,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

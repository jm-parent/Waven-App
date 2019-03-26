import 'package:flutter/material.dart';
import 'package:quiver/collection.dart';
import 'package:waven_app/AppUi/Utils/GradientHelper.dart';

class MapClassGradient {
  BiMap<String, Decoration> classToGradient = new HashBiMap();

  MapClassGradient() {
    classToGradient.addAll(new Map.from(
        {
          'iop': GradientIop(),
          'xelor': GradientXelor(),
          'sram': GradientSram(),
          'osamodas': GradientOsa(),
          'eniripsa': GradientEni(),
          'Crâ': GradientCra(),
        }));
  }
}
class MapClassLogo {
  BiMap<String, String> classToLogoAsset = new HashBiMap();

  MapClassLogo() {
    classToLogoAsset.addAll(new Map.from(
        {
          'iop': 'images/GodIcon/IconIop.png',
          'xelor': 'images/GodIcon/IconXelor.png',
          'sram': 'images/GodIcon/IconSram.png',
          'osamodas': 'images/GodIcon/IconOsamodas.png',
          'eniripsa': 'images/GodIcon/IconEniripsa.png',
          'Crâ': 'images/GodIcon/IconCra.png',
        }));
  }
}
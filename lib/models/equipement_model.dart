import 'package:IT/pages/form.dart';
import 'package:flutter/material.dart';

class Equip {
  String reference;
  String iconPath;
  bool status;
  String StatusPath;
  String category;
  String type;
  String manufac;
  String model;

  Equip(
      {required this.reference,
      required this.iconPath,
      required this.StatusPath,
      required this.status, 
      required this.category,
      required this.type,
      required this.manufac,
      required this.model});

  static List<Equip> getEquipList(bool value) {
    List<Equip> EquipList = [];

    EquipList.add(Equip(
      reference: 'Reference: MEQ2108   ',
      iconPath: 'assets/icons/mri.svg',
      StatusPath: 'assets/icons/iconmonstr-circle-1.svg',
      status: value,
      category: 'Category: Diagnostic Equipment ',
      type: 'Type: MRI Machine ',
      manufac: 'Manufacturer: MedTech Solutions',
      model: 'Model: MRX-7500',
    ));

    EquipList.add(Equip(
      reference: 'Reference: MEQ4567',
      iconPath: 'assets/icons/CO2-surgical-lasers.svg',
      StatusPath: 'assets/icons/iconmonstr-circle-1.svg',
      status: false,
      category: 'Category: Therapeutic Equipment ',
      type: 'Type: Surgical Laser Manufacturer:',
      manufac: 'Precision Medical Devices ',
      model: 'Model: LASECURE 5000',
    ));

    EquipList.add(Equip(
      reference: 'Reference: MEQ7023',
      iconPath: 'assets/icons/mon.svg',
      StatusPath: 'assets/icons/iconmonstr-circle-1.svg',
      status: true,
      category: 'Category: Monitoring Equipment  ',
      type: 'Type: Patient Monitor ',
      manufac: 'Manufacturer: HealthWatch Systems',
      model: 'Model: VitalGuard 3000',
    ));

    return EquipList;
  }
}


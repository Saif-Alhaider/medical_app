class MedicineInfo {
  String title;
  String description;
  MedicineType medicineType;
  List? medicine_pharmacies;
  int? medicine_id;
  MedicineInfo({
    required this.title,
    required this.description,
    required this.medicineType,
    this.medicine_pharmacies,
    this.medicine_id,
  });

  get medicine_image {
    if (medicineType == MedicineType.cream) {
      return 'Assets/svg/cream.svg';
    } else if (medicineType == MedicineType.pills) {
      return 'Assets/svg/pills.svg';
    } else if (medicineType == MedicineType.syring) {
      return 'Assets/svg/syringe.svg';
    } else if (medicineType == MedicineType.syrup) {
      return 'Assets/svg/syrup.svg';
    }
  }
}

enum MedicineType { pills, syrup, cream, syring }


class Pharmacies {
  final String name;
  Pharmacies({
    required this.name,
  });
}

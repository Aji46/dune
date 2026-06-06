abstract final class ContactInfo {
  static const email = 'womendune@gmail.com';
  static const instagramUrl =
      'https://www.instagram.com/dune_for_women?igsh=bWt4a29qcGpnc3V5&utm_source=qr';
  static const instagramHandle = '@dune_for_women';

  static const phones = [
  ContactPhone(
    display: '+91 81295 96138',
    dial: '+918129596138',
    whatsapp: '918129596138',
  ),
  ContactPhone(
    display: '+91 94748 6591',
    dial: '+91947486591',
    whatsapp: '91947486591',
  ),
  ];
}

class ContactPhone {
  const ContactPhone({
    required this.display,
    required this.dial,
    required this.whatsapp,
  });

  final String display;
  final String dial;
  final String whatsapp;

  String get telUri => 'tel:$dial';
  String get whatsappUri => 'https://wa.me/$whatsapp';
}

String sensorEmail(String email) {
  if (email.isEmpty || !email.contains('@')) {
    return email;
  }

  List<String> parts = email.split('@');
  String localPart = parts[0];
  String domain = parts[1];

  if (localPart.length <= 4) {
    return email;
  }

  String sensoredPart = '${localPart[0]}***${localPart[localPart.length - 1]}';
  return '$sensoredPart@$domain';
}

String? validateEmail(String email) {
  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (email.isEmpty) {
    return 'El correo es obligatorio';
  } else if (!emailRegex.hasMatch(email)) {
    return 'Ingresa un correo válido';
  }
  return null;
}

String? validatePhoneNumber(String phoneNumber) {
  final phoneRegex = RegExp(r'^\d{10}$');
  if (phoneNumber.isEmpty) {
    return 'El número de teléfono es obligatorio';
  } else if (!phoneRegex.hasMatch(phoneNumber)) {
    return 'El número de teléfono debe tener 10 dígitos';
  }
  return null; // Retorna null si no hay error
}

String? validatePassword(String password) {
  if (password.isEmpty) {
    return 'La contraseña es obligatoria';
  } else if (password.length <= 5) {
    return 'La contraseña debe tener más de 5 caracteres';
  }
  return null; // Retorna null si no hay error
}
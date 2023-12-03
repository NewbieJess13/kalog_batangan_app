class SignUpWithEmailAndPasswordFailure implements Exception {
  const SignUpWithEmailAndPasswordFailure(
      [this.message = 'Unknown error occured, Contact support.']);

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure("Email is not valid.");
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            "An account already exist with this email.");
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            "Please enter a strong password.");
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

class SignInWithEmailAndPasswordFailure implements Exception {
  const SignInWithEmailAndPasswordFailure(
      [this.message = "Unknown error occured, Contact support."]);

  factory SignInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignInWithEmailAndPasswordFailure("Email is not valid.");
      case 'user-disabled':
        return const SignInWithEmailAndPasswordFailure(
            "This user is disabled. Please contact support.");
      case 'user-not-found':
        return const SignInWithEmailAndPasswordFailure(
            "This user does not exist on the database");
      case 'wrong-password':
        return const SignInWithEmailAndPasswordFailure("Incorrect password.");
      default:
        return const SignInWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

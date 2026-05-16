class UserModel {
  final String name;
  final String email;
  final String tier;
  final double walletBalance;
  final int bookingsCount;

  const UserModel({
    required this.name,
    required this.email,
    required this.tier,
    required this.walletBalance,
    required this.bookingsCount,
  });
}

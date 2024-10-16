class ApiEndPoint{
  static final String baseUrl = 'https://groceries-production.up.railway.app/api/';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}
class _AuthEndPoints{
  final String registerEmail = 'v1/auth/register';
  final String loginEmail = 'v1/auth/login';
  final String category = 'v1/category/get-all';
  String productByCategory(String categoryId) => 'v1/product/product-by-category/$categoryId';
  String productDetail(String productId) => 'v1/product/edit/$productId';
  String updateFavoriteProduct(String productId) => 'v1/user/favourite/$productId';
  final String favoriteProduct = 'v1/product/list-favorite';
  final String account = 'v1/user/profile';
  final String logout = 'v1/auth/logout';
  final String checkout = 'v1/payment/create-payment';
  String findProductByCategory(String categoryId, String nameProduct) =>
      'v1/product/product-by-category/$categoryId?per_page=10&page=1&keyword=$nameProduct';
}
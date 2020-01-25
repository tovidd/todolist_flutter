class ChangePasswordModel{

  List<dynamic> getWeeks() {
    return [
      "Sunny Day",
      "Rainny Day",
      "Snowy Day",
    ].toList();
  }

  List<String> getMonth= ['Produk Terlaris', 'Produk Termahal'];
}

class ProductResponseModel {
  String status;
  String message;
  List<ProductModel> data;

  ProductResponseModel({this.status, this.message, this.data});

  ProductResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<ProductModel>();
      json['data'].forEach((v) {
        data.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductModel {
  String nama;
  String kode;
  String gambar;
  int harga;
  int stok;

  ProductModel({this.nama, this.kode, this.gambar, this.harga, this.stok});

  ProductModel.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    kode = json['kode'];
    gambar = json['gambar'];
    harga = json['harga'];
    stok = json['stok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['kode'] = this.kode;
    data['gambar'] = this.gambar;
    data['harga'] = this.harga;
    data['stok'] = this.stok;
    return data;
  }
}


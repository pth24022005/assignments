// =====================================================================
// 1. INTERFACE: Định nghĩa "hợp đồng" hành vi cho những thứ có thể thuê
// Sử dụng `abstract interface class` (Chuẩn Dart 3.0+)
// =====================================================================
abstract interface class IRentable {
  void rentOut();
  void checkOut();
}

// =====================================================================
// 2. ABSTRACT & EXTENDS: Lớp trừu tượng gốc chứa các thuộc tính chung
// Có thể tái sử dụng cho Căn hộ (Apartment), Mặt bằng (Store), v.v.
// (Đã thêm từ khóa `final` để bảo vệ dữ liệu gốc theo chuẩn mới)
// =====================================================================
abstract class RealEstate {
  final int id;
  String name;
  double? price; // Thêm dấu ? để cho phép rỗng (chưa có giá)
  double? area;  // Thêm dấu ? để cho phép rỗng (chưa đo diện tích)

  // Constructor của lớp trừu tượng
  RealEstate({
    required this.id,
    required this.name,
    this.price, // Bỏ required
    this.area,  // Bỏ required
  });

  // Phương thức trừu tượng bắt buộc các lớp con phải tự định nghĩa
  void displayInfo();
}

// ============================================================
// YÊU CẦU 3: KHAI BÁO LỚP ROOM (PHÒNG TRỌ)
// Room kế thừa RealEstate và thực thi IRentable
// ============================================================
class Room extends RealEstate implements IRentable {
  // 1. Các biến (thuộc tính) miêu tả đối tượng Room
  // int id; // Đã có ở RealEstate
  // String name; // Đã có ở RealEstate
  // double price; // Đã có ở RealEstate
  // double area; // Đã có ở RealEstate
  bool isAvailable; // Trạng thái: true (còn trống), false (đã thuê)

  // STATIC: Biến tĩnh dùng chung để đếm tổng số phòng đã được tạo ra
  static int totalRoomsCreated = 0;

  // Constructor khởi tạo đối tượng Room
  // Gọi super() để truyền dữ liệu lên lớp cha (RealEstate)
  // (ĐÃ TỐI ƯU BẰNG CÚ PHÁP super. CỦA DART 2.17+)
  Room({
    required super.id,     // Tự động truyền lên id của lớp cha
    required super.name,   // Tự động truyền lên name của lớp cha
    super.price,           // ĐÃ SỬA LỖI: Bỏ chữ `required` đi vì biến này cho phép null
    super.area,            // ĐÃ SỬA LỖI: Bỏ chữ `required` đi vì biến này cho phép null
    this.isAvailable = true, // Mặc định khi tạo mới là phòng trống
  }) {
    // Mỗi lần 1 đối tượng Room ra đời, biến static này tăng thêm 1
    totalRoomsCreated++;
  }

  // STATIC METHOD: Hàm tĩnh tiện ích không phụ thuộc vào đối tượng
  static void printSystemStats() {
    print('📊 [HỆ THỐNG]: Tổng số phòng đã khởi tạo trong bộ nhớ: $totalRoomsCreated');
  }

  // 2. Các phương thức (hành động) của lớp Room

  // Phương thức hiển thị thông tin phòng (Ghi đè từ RealEstate)
  @override
  void displayInfo() {
    String status = isAvailable ? '✅ Còn trống' : '❌ Đã thuê';
    
    // ĐÃ SỬA LỖI: Thêm xử lý để khi in ra không bị dính chữ 'null'
    String displayPrice = price != null ? '$price đ' : 'Chưa cập nhật';
    String displayArea = area != null ? '$area m2' : 'Chưa cập nhật';
    
    print('Phòng ID: $id | Tên: $name | Giá: $displayPrice | Diện tích: $displayArea | Trạng thái: $status');
  }

  // Phương thức cho thuê phòng (Ghi đè từ interface IRentable)
  @override
  void rentOut() {
    // ĐÃ SỬA LỖI: Không cho phép thuê nếu phòng chưa có giá
    if (price == null) {
      print('>> ⚠️ Lỗi: Không thể cho thuê $name vì phòng này chưa được cài đặt giá!');
      return;
    }

    if (isAvailable) {
      isAvailable = false;
      print('>> Đã cho thuê $name thành công!');
    } else {
      print('>> Thất bại: $name đã có người thuê từ trước.');
    }
  }

  // Phương thức trả phòng (Ghi đè từ interface IRentable)
  @override
  void checkOut() {
    if (!isAvailable) {
      isAvailable = true;
      print('>> Khách đã trả $name. Đã cập nhật thành phòng trống.');
    } else {
      print('>> $name hiện đang trống, không thể trả phòng.');
    }
  }
}
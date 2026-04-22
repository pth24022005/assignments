// Import file room.dart đã tạo ở Câu 3
// (Lưu ý: Đảm bảo 2 file nằm cùng thư mục, hoặc chỉnh sửa đường dẫn import cho đúng)
import '../models/room.dart';

// =====================================================================
// THÊM MỚI: Lớp quản lý danh sách tổng quát (Generics)
// Chữ <T> đại diện cho một kiểu dữ liệu bất kỳ (Room, Apartment, v.v.)
// =====================================================================
abstract class Repository<T> {
  // Biến danh sách chứa các đối tượng tổng quát
  final List<T> items = [];

  void add(T item) {
    items.add(item);
  }

  List<T> getAll() {
    return items;
  }

  // Hàm bổ sung: Hỗ trợ chức năng Xóa tổng quát
  void remove(T item) {
    items.remove(item);
  }
}

// ============================================================
// YÊU CẦU 4: VIẾT DANH SÁCH VÀ CRUD CHO TENCLASS (ROOM)
// ListRoom kế thừa Repository<Room> để tái sử dụng mã nguồn
// ============================================================
class ListRoom extends Repository<Room> {
  // 1. Biến danh sách chứa các đối tượng Room (Tenclass)
  // (Thay vì khai báo List mới, ta dùng getter 'rooms' trỏ tới 'items'
  // của lớp cha để tận dụng code cũ mà bạn đã viết)
  List<Room> get rooms => items;

  // ==========================================
  // CREATE (Tạo mới bản ghi và lưu vào danh sách)
  // ==========================================
  void createRoom(Room newRoom) {
    // Kiểm tra xem ID đã tồn tại chưa để tránh trùng lặp
    bool isDuplicate = rooms.any((room) => room.id == newRoom.id);
    if (isDuplicate) {
      print('⚠️ Lỗi: Không thể thêm. Phòng có ID ${newRoom.id} đã tồn tại!');
      return; // Tối ưu: Dùng early return để code thoát luôn, không cần else
    }

    add(newRoom); // Sử dụng hàm add() kế thừa từ Repository
    print('✅ Đã tạo mới thành công: ${newRoom.name}');
  }

  // ==========================================
  // READ (Đọc/Hiển thị tất cả các bản ghi)
  // ==========================================
  void readAllRooms() {
    print('\n--- 📋 DANH SÁCH PHÒNG TRỌ HIỆN CÓ ---');
    if (rooms.isEmpty) {
      print('Chưa có phòng trọ nào trong hệ thống.');
      return;
    }
    for (var room in rooms) {
      room.displayInfo(); // Hàm này bên room.dart đã được tối ưu để in "Chưa cập nhật"
    }
    print('--------------------------------------\n');
  }

  // ==========================================
  // UPDATE / EDIT (Sửa thông tin một bản ghi dựa vào ID)
  // ==========================================
  // Sử dụng tham số tùy chọn có tên (optional named parameters) bằng dấu { }
  // Nghĩa là bạn muốn sửa thuộc tính nào thì truyền thuộc tính đó vào.
  void editRoom(
    int id, {
    String? newName,
    double? newPrice,
    double? newArea,
    bool? newStatus,
  }) {
    // Tìm kiếm vị trí (index) của phòng có id tương ứng
    int index = rooms.indexWhere((room) => room.id == id);

    // Tối ưu: Nếu không tìm thấy thì báo lỗi và dừng hàm luôn (Early Return)
    if (index == -1) {
      print('⚠️ Lỗi: Không tìm thấy phòng có ID: $id để sửa.');
      return;
    }

    // Nếu tìm thấy, tiến hành cập nhật các trường có dữ liệu được truyền vào
    // Lưu ý: id là final nên không có trong danh sách sửa đổi này
    if (newName != null) rooms[index].name = newName;
    if (newPrice != null) rooms[index].price = newPrice;
    if (newArea != null) rooms[index].area = newArea;
    if (newStatus != null) rooms[index].isAvailable = newStatus;

    print('✏️ Đã cập nhật thành công thông tin cho Phòng ID: $id');
  }

  // ==========================================
  // DELETE (Xóa một bản ghi - Bổ sung cho đủ bộ CRUD)
  // ==========================================
  void deleteRoom(int id) {
    int index = rooms.indexWhere((room) => room.id == id);

    if (index != -1) {
      String removedName = rooms[index].name;
      rooms.removeAt(index);
      print('🗑️ Đã xóa thành công: $removedName (ID: $id)');
    } else {
      print('⚠️ Lỗi: Không tìm thấy phòng có ID: $id để xóa.');
    }
  }
}

// ==========================================
// HÀM MAIN: Chạy thử nghiệm các chức năng CRUD
// ==========================================
void main() {
  // Khởi tạo đối tượng quản lý danh sách
  ListRoom manager = ListRoom();

  print('=== BẮT ĐẦU TEST CHỨC NĂNG CRUD ===\n');

  // 1. TEST CREATE (Tạo bản ghi)
  // Phòng 101: Tạo với đầy đủ thông tin ngay từ đầu
  manager.createRoom(
    Room(id: 1, name: 'Phòng 101', price: 2500000, area: 25.5),
  );

  // Phòng 102 (THỰC TẾ): Mới xây xong, mới cắm biển tên, CHƯA có giá và diện tích
  manager.createRoom(Room(id: 2, name: 'Phòng 102'));

  // Phòng 201: Tạo đầy đủ
  manager.createRoom(
    Room(id: 3, name: 'Phòng 201', price: 3000000, area: 35.0),
  );

  // 2. TEST READ (Đọc danh sách)
  // Bạn sẽ thấy Phòng 102 in ra chữ "Chưa cập nhật" rất chuyên nghiệp
  manager.readAllRooms();

  // --- KIỂM TRA LOGIC THỰC TẾ ---
  // Giả sử có khách muốn thuê Phòng 102 luôn, hệ thống sẽ chặn lại vì chưa có giá!
  print('\n=> Thử cho thuê phòng chưa có giá (Phòng 102):');
  // Truy cập trực tiếp qua index 1 (Phòng 102) để gọi hàm của interface IRentable
  manager.rooms[1].rentOut();

  // 3. TEST UPDATE / EDIT (Sửa bản ghi)
  print('\n=> Tiến hành cập nhật thông tin phòng (Edit):');

  // Giả sử cần tăng giá Phòng 101 lên 2.700.000 và cập nhật diện tích
  manager.editRoom(1, newPrice: 2700000, newArea: 26.0);

  // Chủ nhà nay đã chốt được giá và diện tích cho Phòng 102
  manager.editRoom(2, newPrice: 2800000, newArea: 30.0);

  // 4. TEST READ LẠI ĐỂ XEM THAY ĐỔI
  // Lúc này Phòng 102 đã có giá đàng hoàng
  print('\n=> Sau khi Edit (Sửa đổi):');
  manager.readAllRooms();

  // --- KIỂM TRA BIẾN TĨNH (STATIC) ---
  // In ra tổng số phòng đã được tạo ra trong toàn bộ chương trình
  Room.printSystemStats();

  // 5. TEST DELETE (Xóa bản ghi)
  print('\n=> Chức năng Delete (Xóa):');
  manager.deleteRoom(
    3,
  ); // Giả sử xóa phòng 201 vì chủ nhà lấy lại không cho thuê nữa
  manager.readAllRooms();
}

import 'package:flutter/material.dart';

// ============================================================
// YÊU CẦU 1: KHAI BÁO BIẾN
// Đối tượng liên quan đến hệ thống quản lý cho thuê phòng trọ:
// Room (Phòng), Tenant (Người thuê), Landlord (Chủ trọ)
// ============================================================

// -- Biến liên quan đến Phòng trọ (Room) --
String roomName = 'Phòng 101';
int roomNumber = 101;
double roomPrice = 2500000; // đơn vị: VNĐ/tháng
double roomArea = 25.5; // đơn vị: m²
bool roomAvailable = true;

// -- Biến liên quan đến Người thuê (Tenant) --
String tenantName = 'Nguyễn Văn An';
int tenantAge = 22;
String tenantPhone = '0912345678';
String tenantJob = 'Sinh viên';

// -- Biến liên quan đến Chủ trọ (Landlord) --
String landlordName = 'Trần Thị Bình';
String landlordPhone = '0987654321';
String landlordAddress = 'Hà Đông, Hà Nội';

// ============================================================
// YÊU CẦU 2: SỬ DỤNG COLLECTIONS (List, Map)
// ============================================================

// -- List các tiện ích phòng trọ (List<String>) --
List<String> amenities = ['Điều hòa', 'Nóng lạnh', 'Wifi', 'Tủ lạnh', 'Giường'];

// -- Map thông tin một phòng trọ --
Map<String, dynamic> roomInfo = {
  'id': 1,
  'name': 'Phòng 101',
  'price': 2500000,
  'area': 25.5,
  'available': true,
};

// -- YÊU CẦU 4: List danh sách phòng trọ --
// Tương tự listForest trong ví dụ bài tập
// Đối tượng Room gồm: id, name, price, available
var listRoom = [
  {'id': 1, 'name': 'Phong 101', 'price': 2500000, 'available': true},
  {'id': 2, 'name': 'Phong 102', 'price': 2800000, 'available': false},
  {'id': 3, 'name': 'Phong 201', 'price': 3000000, 'available': true},
  {'id': 4, 'name': 'Phong 202', 'price': 3200000, 'available': true},
  {'id': 5, 'name': 'Phong 301', 'price': 3500000, 'available': false},
];

// -- List danh sách người thuê (Tenant) --
// Đối tượng Tenant gồm: id, name, phone, roomId
var listTenant = [
  {'id': 1, 'name': 'Nguyen Van An', 'phone': '0912345678', 'roomId': 2},
  {'id': 2, 'name': 'Le Thi Bich', 'phone': '0923456789', 'roomId': 5},
];

// ============================================================
// HÀM MAIN - Điểm khởi chạy ứng dụng
// ============================================================
void main() {
  // In thông tin biến ra console để kiểm tra
  print('=== NESTFINDER - Quản lý cho thuê phòng trọ ===');
  print('Tên phòng   : $roomName');
  print('Giá thuê    : $roomPrice VNĐ/tháng');
  print('Diện tích   : $roomArea m²');
  print('Người thuê  : $tenantName - $tenantPhone');
  print('Chủ trọ     : $landlordName');
  print('Tiện ích    : $amenities');
  print('Danh sách phòng: $listRoom');
  print('Danh sách người thuê: $listTenant');

  runApp(const NestFinderApp());
}

// ============================================================
// WIDGET GỐC CỦA ỨNG DỤNG
// ============================================================
class NestFinderApp extends StatelessWidget {
  const NestFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NestFinder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// ============================================================
// TRANG CHÍNH - Hiển thị toàn bộ dữ liệu
// ============================================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -------------------------------------------------------
      // APP BAR
      // -------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          '🏠 NestFinder - Quản lý phòng trọ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------------------------------
            // YÊU CẦU 1 + 3: HIỂN THỊ BIẾN DẠNG TEXT
            // -------------------------------------------------
            const Text(
              '📋 Thông tin Chủ trọ (Landlord)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Họ tên : $landlordName'),
            Text('SĐT    : $landlordPhone'),
            Text('Địa chỉ: $landlordAddress'),
            const Divider(height: 28),

            // -------------------------------------------------
            // YÊU CẦU 1 + 3: HIỂN THỊ BIẾN DẠNG ROW (hàng ngang)
            // Thông tin một phòng mẫu hiển thị theo Row
            // -------------------------------------------------
            const Text(
              '🛏️ Thông tin phòng mẫu (hiển thị dạng Row)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '📌 $roomName',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('$roomArea m²'),
                  Text('${roomPrice.toStringAsFixed(0)} đ'),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: roomAvailable ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      roomAvailable ? 'Còn trống' : 'Đã thuê',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 28),

            // -------------------------------------------------
            // YÊU CẦU 2 + 3: HIỂN THỊ MAP roomInfo DẠNG ROW
            // -------------------------------------------------
            const Text(
              '🗺️ Map - roomInfo (key: value)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Duyệt qua từng entry của Map và hiển thị dạng Row
            ...roomInfo.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  children: [
                    SizedBox(
                      width: 90,
                      child: Text(
                        '${entry.key}:',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('${entry.value}'),
                  ],
                ),
              ),
            ),
            const Divider(height: 28),

            // -------------------------------------------------
            // YÊU CẦU 2 + 3: HIỂN THỊ List<String> amenities
            // -------------------------------------------------
            const Text(
              '✨ List - Tiện ích phòng (amenities)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Hiển thị dạng Wrap các Chip
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: amenities
                  .map(
                    (item) => Chip(
                      label: Text(item),
                      backgroundColor: Colors.orange.shade100,
                    ),
                  )
                  .toList(),
            ),
            const Divider(height: 28),

            // -------------------------------------------------
            // YÊU CẦU 4: HIỂN THỊ listRoom RA MÀN HÌNH
            // Mỗi phòng hiển thị theo dạng Row (hàng ngang)
            // -------------------------------------------------
            const Text(
              '🏘️ Danh sách phòng trọ (listRoom)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'var listRoom = [ {id, name, price, available}, ... ]',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),

            // Header dạng Row
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'ID',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Tên phòng',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Giá/tháng',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Trạng thái',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),

            // Dùng vòng lặp .map() để hiển thị từng phòng trong listRoom
            ...listRoom.map((room) {
              bool isAvailable = room['available'] as bool;
              return Container(
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                // Mỗi dòng là một Row hiển thị thông tin phòng
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${room['id']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '${room['name']}',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${room['price']} đ',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: isAvailable
                              ? Colors.green.shade100
                              : Colors.red.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          isAvailable ? '✅ Còn trống' : '❌ Đã thuê',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: isAvailable
                                ? Colors.green.shade800
                                : Colors.red.shade800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),

            const Divider(height: 28),

            // -------------------------------------------------
            // THÊM: HIỂN THỊ listTenant - danh sách người thuê
            // -------------------------------------------------
            const Text(
              '👤 Danh sách người thuê (listTenant)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...listTenant.map(
              (tenant) => Container(
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.blue.shade100),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.person, color: Colors.blue, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${tenant['name']}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      'SĐT: ${tenant['phone']}',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Phòng #${tenant['roomId']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

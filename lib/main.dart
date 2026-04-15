import 'package:flutter/material.dart';

// ==========================================
// 1. DỮ LIỆU
// ==========================================
String landlordName = 'Trần Thị Bình';
String landlordPhone = '0987654321';

Map<String, dynamic> roomInfo = {
  'Tên': 'Phòng 101',
  'Giá': 2500000,
};

List<String> amenities = ['Điều hòa', 'Nóng lạnh', 'Wifi', 'Tủ lạnh'];

var listRoom = [
  {'id': 1, 'name': 'Phong 101', 'price': 2500000, 'available': true},
  {'id': 2, 'name': 'Phong 102', 'price': 2800000, 'available': false},
  {'id': 3, 'name': 'Phong 201', 'price': 3000000, 'available': true},
];

var listTenant = [
  {'name': 'Nguyen Van An', 'phone': '0912345678', 'roomId': 2},
  {'name': 'Le Thi Bich',   'phone': '0923456789', 'roomId': 5},
];

// ==========================================
// 2. CHẠY APP
// ==========================================
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

// ==========================================
// 3. GIAO DIỆN CHÍNH 
// ==========================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý cho thuê phòng trọ')),
      body: SingleChildScrollView(
        // Column: Xếp mọi thứ từ trên xuống dưới
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // --- A. BIẾN ĐƠN LẺ ---
            const Text('1. CHỦ TRỌ:'),
            Text('$landlordName - SĐT: $landlordPhone'),
            const SizedBox(height: 20),

            // --- B. HIỂN THỊ MAP ---
            const Text('2. THÔNG TIN PHÒNG (Map):'),
            ...roomInfo.entries.map((entry) => Row( // Row: Xếp key và value nằm ngang
              children: [
                Text(entry.key),
                const Text(': '),
                Text('${entry.value}'),
              ],
            )),
            const SizedBox(height: 20),

            // --- C. HIỂN THỊ LIST CHỮ ---
            const Text('3. TIỆN ÍCH (List String):'),
            Wrap( // Wrap giống Row nhưng tự động xuống dòng nếu hết chỗ
              children: amenities.map((item) => Text('[$item] ')).toList(),
            ),
            const SizedBox(height: 20),

            // --- D. HIỂN THỊ LIST MAP (Danh sách phòng) ---
            const Text('4. DANH SÁCH PHÒNG:'),
            ...listRoom.map((room) => Row(
              children: [
                Text('Phòng ${room['id']} | '),
                Text('${room['name']} | '),
                Text('${room['price']}đ | '),
                // Dùng toán tử điều kiện để kiểm tra True/False
                Text(room['available'] == true ? 'Trống' : 'Đã thuê'),
              ],
            )),
            const SizedBox(height: 20),

            // --- E. HIỂN THỊ LIST MAP (Danh sách người thuê) ---
            const Text('5. NGƯỜI THUÊ:'),
            ...listTenant.map((tenant) => Row( 
              children: [
                Text('${tenant['name']} | '),
                Text('${tenant['phone']} | '),
                Text('Phòng: ${tenant['roomId']}'),
              ],
            )),
            
          ],
        ),
      ),
    );
  }
}
# 🏠 NestFinder - Hệ thống Quản lý Cho thuê Phòng trọ

**NestFinder** là một ứng dụng quản lý phòng trọ (Console Application) được viết bằng ngôn ngữ **Dart**. Dự án này được xây dựng nhằm mục đích minh họa việc áp dụng các nguyên lý **Lập trình Hướng đối tượng (OOP) nâng cao** và kiến trúc phần mềm chuẩn mực.

---

## 🚀 Tính năng nổi bật (Features)

Hệ thống cung cấp đầy đủ các tính năng quản lý cốt lõi (CRUD) và các logic nghiệp vụ thực tế:
- **Tạo mới (Create):** Thêm phòng trọ mới vào hệ thống. Hỗ trợ tạo phòng ngay cả khi chưa đo diện tích hoặc chưa chốt giá thuê.
- **Đọc dữ liệu (Read):** Hiển thị danh sách toàn bộ phòng trọ với định dạng trực quan. Tự động xử lý và báo cáo các dữ liệu chưa cập nhật.
- **Cập nhật (Update/Edit):** Chỉnh sửa thông tin phòng (giá cả, diện tích, tên phòng) dựa trên ID.
- **Xóa (Delete):** Gỡ bỏ phòng trọ khỏi hệ thống quản lý.
- **Nghiệp vụ cho thuê (Rent/Checkout):** Quản lý trạng thái "Còn trống" hoặc "Đã thuê". Tích hợp logic chặn cho thuê đối với các phòng chưa được định giá.
- **Thống kê hệ thống:** Theo dõi tổng số lượng phòng đã được khởi tạo trong bộ nhớ theo thời gian thực.

---

## 🛠 Công nghệ & Kiến trúc (Tech Stack & Architecture)

Dự án sử dụng ngôn ngữ **Dart (phiên bản 3.0+)** và áp dụng sâu sắc các khái niệm OOP:

* **Abstraction (Trừu tượng hóa):** Lớp `RealEstate` đóng vai trò là bản thiết kế gốc cho mọi loại hình bất động sản.
* **Interface (Giao diện):** Sử dụng `abstract interface class IRentable` để ép buộc các quy tắc giao dịch (cho thuê/trả phòng).
* **Generics (Kiểu tổng quát):** Lớp `Repository<T>` cho phép tái sử dụng logic lưu trữ danh sách cho bất kỳ thực thể nào (Room, Tenant, v.v.).
* **Encapsulation & Static (Đóng gói & Thành phần tĩnh):** Sử dụng biến tĩnh để đếm tổng số phòng và các phương thức tĩnh (`printSystemStats`) để quản lý trạng thái toàn cục (Global State).
* **Null Safety:** Xử lý triệt để các trường hợp dữ liệu rỗng (như chưa có giá, chưa có diện tích) đúng với thực tế nghiệp vụ.
* **Super Parameters:** Sử dụng cú pháp `super.property` hiện đại của Dart 2.17+ giúp mã nguồn ngắn gọn và tối ưu.

---

## 📂 Cấu trúc thư mục (Folder Structure)

Dự án áp dụng mô hình phân tách dữ liệu (Models) và logic xử lý (Repositories):

```text
NestFinder/
├── lib/
│   ├── models/
│   │   └── room.dart          # Định nghĩa cấu trúc, interface và abstract class
│   │
│   └── repositories/
│       └── list_room.dart     # Quản lý danh sách (Repository Pattern) và logic CRUD
│
├── README.md                  # Tài liệu dự án
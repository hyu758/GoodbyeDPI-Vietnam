# GoodbyeDPI — Vietnam Edition

[![OS - Windows](https://img.shields.io/badge/OS-Windows_7_|_8_|_10_|_11-blue.svg)](https://microsoft.com/windows)
[![License](https://img.shields.io/badge/License-Apache_2.0-green.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com)

Công cụ tiện ích mã nguồn mở giúp hỗ trợ truy cập các trang web và dịch vụ trực tuyến bị hạn chế kết nối tại **Việt Nam**.

Đặc biệt hỗ trợ truy cập mượt mà vào **Steam** **mà không làm tăng Ping, không giảm tốc độ mạng, không cần cài đặt VPN.**

---

## ⚡ Tính năng nổi bật

- 🎮 **Kết nối Steam mượt mà**: Vào dễ dàng Store, Community, tải game, chat bạn bè trên cả trình duyệt và ứng dụng Steam Client.
- 🚀 **Không giật lag / Không tăng Ping**: Hoạt động trực tiếp trên máy tính bằng cách chia nhỏ gói tin TCP, không truyền dữ liệu qua máy chủ trung gian nên giữ nguyên 100% tốc độ cáp quang.
- 🛡️ **Tích hợp Cloudflare DNS siêu tốc**: Tự động kết nối qua DNS `1.1.1.1` (độ trễ cực thấp ~20ms) giúp việc tìm kiếm địa chỉ trang web luôn nhanh chóng và chính xác.
- 🎯 **Chế độ chọn lọc thông minh**: Tùy chọn chỉ can thiệp vào các kết nối Steam hoặc các trang cần truy cập, giữ nguyên toàn bộ lưu lượng của các game và ứng dụng khác (Valorant, LMHT, PUBG, CS2...).
- 🔄 **Hỗ trợ Windows Service**: Cài đặt chạy ngầm tự khởi động cùng máy tính chỉ với 1 cú click, không cần giữ cửa sổ dòng lệnh.

---

## 🚀 Hướng dẫn sử dụng nhanh (Quick Start)

Tải thư mục về máy tính (hoặc tải file ZIP từ mục **Releases**), nhấp chuột phải vào file script tương ứng và chọn **Run as administrator**:

| File Script | Mục đích sử dụng | Mô tả chi tiết |
| :--- | :--- | :--- |
| **`1_all_websites.cmd`** | **Mở kết nối TẤT CẢ website (Khuyên dùng)** | Tự động hỗ trợ kết nối cho mọi website trên thế giới (Steam, Medium, BBC...) + Cloudflare DNS (`1.1.1.1`). |
| **`2_vietnam_all.cmd`** | **Mở kết nối theo danh sách Việt Nam** | Chỉ áp dụng cho các trang web có trong file `vietnam-blacklist.txt`. |
| **`3_steam_only.cmd`** | **Chỉ áp dụng riêng cho Steam** | Chỉ hỗ trợ duy nhất lưu lượng Steam/Valve (`vietnam-steam.txt`), giữ nguyên 100% traffic khác (tối ưu nhất cho game thủ). |

> [!IMPORTANT]
> - Các file `.cmd` trên **cần chạy bằng quyền Administrator** (`Run as administrator`) vì chương trình cần nạp driver mạng `WinDivert`.
> - Khi dùng các file này, hãy giữ cửa sổ dòng lệnh mở. Nếu muốn chạy ẩn hoàn toàn, xem mục Cài đặt chạy ngầm bên dưới.

---

## 🛠️ Cài đặt chạy ngầm cùng Windows (Windows Service)

Nếu bạn không muốn phải mở cửa sổ dòng lệnh mỗi lần bật máy tính:

1. Chọn chế độ cài đặt:
   - **`service_install_all_websites.cmd`**: Chạy ngầm cho tất cả website + Cloudflare DNS.
   - **`service_install_steam_only.cmd`**: Chạy ngầm chỉ riêng cho ứng dụng Steam.
2. Nhấp chuột phải vào file tương ứng ➔ chọn **Run as administrator**.
3. **Để gỡ bỏ**: Nhấp chuột phải vào **`service_remove.cmd`** ➔ chọn **Run as administrator**.

---

## 📂 Cấu trúc thư mục dự án

```text
GoodbyeDPI/
├── 1_all_websites.cmd                  # Hỗ trợ kết nối tất cả mọi website + Cloudflare DNS (1.1.1.1)
├── 2_vietnam_all.cmd                   # Hỗ trợ danh sách web tại VN (Steam, Medium, BBC...)
├── 3_steam_only.cmd                    # Chỉ hỗ trợ riêng cho ứng dụng Steam
│
├── service_install_all_websites.cmd    # Cài Windows Service chạy ngầm (Tất cả web)
├── service_install_steam_only.cmd      # Cài Windows Service chạy ngầm (Chỉ Steam)
├── service_remove.cmd                  # Gỡ bỏ Windows Service và driver
│
├── vietnam-blacklist.txt               # Danh sách domain Steam, Media, Dev cần hỗ trợ kết nối
├── vietnam-steam.txt                   # Danh sách domain riêng cho Steam & Valve
│
├── x86/                                # File thực thi cho Windows 32-bit (v0.2.3rc3)
├── x86_64/                             # File thực thi cho Windows 64-bit (v0.2.3rc3)
└── src/                                # Toàn bộ mã nguồn C & Makefile của dự án
```

---

## 🔍 Cách thêm tên miền mới

Nếu bạn muốn thêm website nào khác:
1. Mở file [vietnam-blacklist.txt](vietnam-blacklist.txt) bằng Notepad.
2. Thêm tên miền chính vào cuối file (ví dụ: `example.com`).
3. Lưu file và khởi động lại script GoodbyeDPI.
*(Hệ thống sẽ tự động áp dụng cho toàn bộ các subdomain con như `api.example.com`, `cdn.example.com`...)*

---

## 🏗️ Biên dịch từ mã nguồn (Build from source)

Yêu cầu môi trường **GNU Make** và **MinGW-w64** cùng thư viện **WinDivert**:

- **Bản 64-bit**:
  ```bash
  make CPREFIX=x86_64-w64-mingw32- BIT64=1 WINDIVERTHEADERS=/path/to/windivert/include WINDIVERTLIBS=/path/to/windivert/amd64
  ```

- **Bản 32-bit**:
  ```bash
  make CPREFIX=i686-w64-mingw32- WINDIVERTHEADERS=/path/to/windivert/include WINDIVERTLIBS=/path/to/windivert/x86
  ```

---

## 💖 Lời cảm ơn (Credits)

- Dự án được phát triển dựa trên [GoodbyeDPI](https://github.com/ValdikSS/GoodbyeDPI) của tác giả **@ValdikSS**.
- Sử dụng driver tầng mạng [WinDivert](https://github.com/basil00/Divert) của tác giả **@basil00**.
- Cảm ơn cộng đồng người dùng Internet tại Việt Nam đã thử nghiệm và đóng góp danh sách tên miền.

---

## 📄 Bản quyền (License)

Phát hành dưới giấy phép [Apache License 2.0](LICENSE).

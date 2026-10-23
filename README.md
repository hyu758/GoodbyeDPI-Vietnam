# GoodbyeDPI — Vietnam Edition

[![OS - Windows](https://img.shields.io/badge/OS-Windows_7_|_8_|_10_|_11-blue.svg)](https://microsoft.com/windows)
[![License](https://img.shields.io/badge/License-Apache_2.0-green.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com)

Phiên bản tùy biến và tối ưu hóa của tiện ích **GoodbyeDPI** dành riêng cho người dùng Internet tại **Việt Nam**. Giúp vượt qua hệ thống kiểm duyệt gói tin sâu (**Deep Packet Inspection - DPI**) và **Đầu độc DNS (DNS Poisoning)** của các nhà mạng (Viettel, VNPT, FPT, CMC, MobiFone...).

Đặc biệt giải quyết triệt để tình trạng **bị chặn truy cập Steam** (Store, Community, Friend/Chat) và các website công nghệ/tin tức quốc tế (**Medium, BBC, ArtStation...**) **mà không làm tăng Ping, không tốn băng thông, không cần cài đặt VPN.**

---

## ⚡ Tính năng nổi bật

- 🎮 **Mở khóa Steam 100%**: Vào mượt mà Store, Community, tải game, chat bạn bè trên cả trình duyệt và ứng dụng Steam Client.
- 🚀 **Không giật lag / Không tăng Ping**: Hoạt động cục bộ trên máy tính bằng cách phân mảnh gói tin TCP (TCP segmentation/reverse fragmentation) để DPI không nhận diện được SNI. Không đẩy traffic qua proxy trung gian.
- 🛡️ **Tích hợp Cloudflare DNS siêu tốc**: Tự động chuyển hướng UDP port 53 sang `1.1.1.1` (ping ~20ms tại Việt Nam) giúp chống giả mạo DNS của ISP.
- 🎯 **Chế độ Blacklist thông minh**: Tùy chọn chỉ can thiệp vào các kết nối của Steam/trang bị chặn, giữ nguyên 100% kết nối của các game khác (Valorant, LMHT, PUBG, CS2...) và các tác vụ thường ngày.
- 🔄 **Hỗ trợ Windows Service**: Cài đặt chạy ngầm tự khởi động cùng Windows chỉ với 1 cú click, không cần giữ cửa sổ CMD.

---

## 🚀 Hướng dẫn sử dụng nhanh (Quick Start)

Tải toàn bộ thư mục về máy tính (hoặc `git clone`), nhấp chuột phải vào file script tương ứng và chọn **Run as administrator**:

| File Script | Mục đích sử dụng | Khi nào nên dùng? |
| :--- | :--- | :--- |
| **`1_vietnam_all_dnsredir.cmd`** | **Mở chặn tất cả (Khuyên dùng)** | Không dùng blacklist, tự động vượt DPI cho mọi website và ứng dụng (Steam, Medium, BBC...). |
| **`2_vietnam_steam_only.cmd`** | **Chỉ mở chặn riêng Steam** | Chỉ áp dụng cho các domain của Steam/Valve (`blacklist/vietnam-steam.txt`). |
| **`3_vietnam_all_blacklist.cmd`** | **Bản gốc + Bổ sung Việt Nam** | Nạp đồng thời **154.000+ domain gốc** (`russia-blacklist.txt`), YouTube (`russia-youtube.txt`) VÀ danh sách bổ sung Việt Nam (`blacklist/vietnam-all.txt`). |

> [!IMPORTANT]
> - Các file `.cmd` trên **bắt buộc phải chạy bằng quyền Administrator** (`Run as administrator`) vì chương trình cần nạp driver mạng `WinDivert`.
> - Khi dùng các file này, bạn cần giữ cửa sổ dòng lệnh mở trong lúc sử dụng. Nếu muốn chạy ẩn hoàn toàn, xem mục Cài đặt chạy ngầm bên dưới.

---

## 🛠️ Cài đặt chạy ngầm cùng Windows (Windows Service)

Nếu bạn không muốn phải mở cửa sổ dòng lệnh mỗi lần bật máy:

1. Chọn chế độ bạn muốn cài đặt:
   - **`service_install_vietnam_all.cmd`**: Chạy ngầm mở chặn tất cả.
   - **`service_install_vietnam_blacklist.cmd`**: Chạy ngầm danh sách gốc + bổ sung Việt Nam.
   - **`service_install_vietnam_steam.cmd`**: Chạy ngầm chỉ riêng cho Steam.
2. Nhấp chuột phải vào file tương ứng và chọn **Run as administrator**.
3. Nhấn phím bất kỳ để xác nhận cài đặt.
4. **Xong!** GoodbyeDPI sẽ luôn chạy ngầm như một dịch vụ của Windows, không có cửa sổ hiển thị và tự khởi động cùng máy tính.
5. **Để gỡ bỏ**: Nhấp chuột phải vào **`service_remove.cmd`** và chọn **Run as administrator**.

---

## 📂 Cấu trúc thư mục dự án

```text
GoodbyeDPI/
├── 1_vietnam_all_dnsredir.cmd            # Mở chặn tất cả (không cần blacklist)
├── 2_vietnam_steam_only.cmd              # Chỉ mở chặn riêng Steam
├── 3_vietnam_all_blacklist.cmd           # Bản gốc (154.000+ domain) + Bổ sung Việt Nam (Steam, Media...)
├── service_install_vietnam_all.cmd       # Cài Windows Service (Tất cả)
├── service_install_vietnam_blacklist.cmd # Cài Windows Service (Bản gốc + VN)
├── service_install_vietnam_steam.cmd     # Cài Windows Service (Chỉ Steam)
├── service_remove.cmd                    # Gỡ bỏ Windows Service
│
├── blacklist/                            # Danh sách tên miền lọc chặn
│   ├── russia-blacklist.txt              # 154.000+ domain quốc tế từ bản gốc
│   ├── russia-youtube.txt                # Danh sách YouTube từ bản gốc
│   ├── vietnam-steam.txt                 # Bổ sung: Toàn bộ domain Steam, Valve & CDN
│   ├── vietnam-general.txt               # Bổ sung: Các trang tin tức, Medium, ArtStation...
│   └── vietnam-all.txt                   # Bổ sung: Tổng hợp toàn bộ cho Việt Nam
│
├── x86/                                  # File thực thi cho Windows 32-bit (v0.2.3rc3)
├── x86_64/                               # File thực thi cho Windows 64-bit (v0.2.3rc3)
└── src/                                  # Toàn bộ mã nguồn C & Makefile của dự án
```

---

## 🔍 Cách thêm tên miền mới bị chặn

Nếu bạn phát hiện một website hoặc dịch vụ game nào khác bị nhà mạng chặn:
1. Mở file [blacklist/vietnam-all.txt](blacklist/vietnam-all.txt) (hoặc file blacklist tương ứng).
2. Thêm tên miền chính (root domain) vào cuối file (ví dụ: `example.com`).
3. Lưu file và khởi động lại script GoodbyeDPI.
*(Cơ chế của GoodbyeDPI sẽ tự động khớp toàn bộ các subdomain con như `api.example.com`, `cdn.example.com`...)*

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
- Sử dụng driver bắt gói tin tầng mạng [WinDivert](https://github.com/basil00/Divert) của tác giả **@basil00**.
- Cảm ơn cộng đồng người dùng Internet tại Việt Nam đã thử nghiệm và đóng góp danh sách tên miền bị chặn.

---

## 📄 Bản quyền (License)

Phát hành dưới giấy phép [Apache License 2.0](LICENSE).

Tổng quan project:
  - Project sử dụng kiến trúc 3-layer
  - Sử dụng database first (ở đây tôi đã sử dụng cmd để generate ra modal nên bạn sẽ không cần chạy câu lệnh lại)
  - Hầu hết các config biến môi trường nằm ở appsettings.js và được đọc, mapping ở Program.cs

Tech stack:
- SDK: .NET 6 (Phiên bản khác .NET 6 sẽ không chạy được)
  * Nếu bạn không muốn cài quá nhiều phiên bản thì dùng trick như sau
  <img width="1334" height="502" alt="image" src="https://github.com/user-attachments/assets/d6146bbc-c9a7-4675-a6bc-0c6a87e1c9cd" />
  Click vào thẳng project "RealEstateAuction" và chỉnh lên phiên bản .NET bạn đang dùng và sửa net6.0 -> version bạn cài
- Tool: Visual Studio 2022 hoặc Visual Studio Insider (có thể chạy trên VS Code nhưng cần cài thêm extension)
- MS SQL: MS SQL 2019 hoặc phiên bản cao hơn, cách cài cũng đã có trên mạng. Bạn có thể tạo tài khoản admin hoặc KHÔNG CẦN nhưng recommend nên tạo (tài khoản này sẽ ảnh hưởng tới connection string)
(SQL server có thể sẽ hơi nặng máy một chút nên nếu máy bạn yếu thì có thể xem qua code và kiến trúc dự án cũng được)

Cách chạy project:
  1. Đầu tiên chạy script sql nằm trong folder DB (chạy version cao nhất)
  2. Chỉnh lại config connection string (nằm trong appsettings.js) về setting local ở máy "connection": "Server=DESKTOP-5BDUDS2\MINHNGUYENDB;Uid=sa;Pwd=123456;Database=RealEstate;TrustServerCertificate=true"
  3. Nếu bạn muốn tự tay generate lại Models thì:
     - Đầu tiên xóa foler Models nằm trong dự án
     - Tools > Command Line > Developer Powershell
     - Sau đó chạy dòng lệnh sau: (Chỉnh lại setting về local máy bạn)
       dotnet ef dbcontext scaffold “server=DESKTOP-5BDUDS2\MINHNGUYENDB; database=RealEstate; Uid=sa; Pwd=123456; TrustServerCertificate=true” Microsoft.EntityFrameworkCore.SqlServer -o Models
  6. Sau khi hoàn thành các bước trên thì khởi động project là xong (F10)

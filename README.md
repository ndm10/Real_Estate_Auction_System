SDK: .NET 6 hoặc cao hơn
Tool: Visual Studio 2022 hoặc Visual Studio Insider (có thể chạy trên VS Code nhưng cần cài thêm extension)
SQL server: MS SQL 2019 hoặc phiên bản cao hơn (SQL server sẽ hơi nặng máy lúc chạy nên nếu máy bạn yếu thì có thể xem qua code và kiến trúc dự án cũng được)

Tổng quan project:
  - Project sử dụng kiến trúc 3-layer
  - Sử dụng database first (ở đây tôi đã sử dụng cmd để generate ra modal nên bạn sẽ không cần chạy câu lệnh lại)
  - Hầu hết các config biến môi trường nằm ở appsettings.js và được đọc, mapping ở Program.cs

Cách chạy project:
  1. Đầu tiên chạy script sql nằm trong folder DB (chạy version cao nhất)
  2. Chỉnh lại config connection string (nằm trong appsettings.js) về setting local ở máy "connection": "Server=DESKTOP-5BDUDS2\MINHNGUYENDB;Uid=sa;Pwd=123456;Database=RealEstate;TrustServerCertificate=true"
  3. Nếu bạn muốn tự tay generate lại Models thì:
     - Đầu tiên xóa foler Models nằm trong dự án
     - Sau đó chạy dòng lệnh sau:
  6. Sau khi hoàn thành các bước trên thì khởi động project là xong (F10)

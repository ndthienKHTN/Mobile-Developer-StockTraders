# Project-Story-App - Nguyễn Đức Thiện
- Link github: https://github.com/ndthienKHTN/Mobile-Developer-StockTraders.git
IDE sử dụng : Android Studio và Visual Studio Code
Sau khi clone code từ github về
- Sử dụng Android Studio mở thư mục, bật terminal trong thư mục flutter put get để cài đặt các dependencies
- Sử dụng Visual Studio Code mở thư mục BackEnd_Websocket_Service, bật terminal trong thư mục gõ npm install để cài đặt các package
Để chạy ứng dụng
- Nếu sử dụng máy ảo để chạy Android Studio thì để nguyên có thể chạy, nếu sử dụng máy thật cần thay đổi ip ở thư mục Services/Websocket/WebsocketService.dart thành localhost
- Đầu tiên tại file websocket.js chọn run code để chạy file
- Vào Android studio chạy file main.dart là đã chạy thành công ứng dụng
Cách test ứng dụng
- Khi chạy ứng dụng sẽ hiển thị màn hình Splash trong vòng 1s, trong thời gian đó ứng dụng sẽ kiểm tra người dùng đã từng đăng nhập hay chưa, nếu đã đăng nhập thì ứng dụng thì sẽ chuyển vào thẳng màn hình Dashboard còn chưa sẽ nào màn hình đăng ký (Sử dụng local storage).
- Tiếp theo cần đăng kí để có thể sử dụng ứng dụng, tại màn hình đăng nhập chọn Register thực hiện đăng ký, đăng ký thành công sẽ chuyển tới màn hình đăng nhập, đăng ký không thành công do các lỗi như email không đúng định dạng, password quá ngắn,... Tại màn hình đăng nhập gõ thông tin đã đăng ký để chuyển tới màn hình Dashboard (Sử dụng firebase để xác thực và lưu trữ thông tin).
- Chức năng đăng xuất, tại góc trái màn hình chọn icon Menu sẽ hiển thị Drawer chọn logout để đăng xuất.
- Chức năng tìm kiếm tại thanh tìm kiếm gõ các kí tự có liên quan đến ticker cần tìm kiếm sẽ hiển thị danh sách kết quả.
- Chức năng sắp xếp, tại ô Ticker của bảng dữ liệu có dấu mũi tên đi lên, đi xuống để sắp xếp ticker tùy ý.
- Chức năng lọc dữ liệu có các kiểu lọc dữ liệu như All(tất cả), Open > 2, Volume > 10000 sau khi chọn thì giao diện sẽ cập nhật các thông tin tương ứng.
- Chức năng hiển thị dữ liệu dưới dạng bảng khi đăng nhập thành công sẽ hiển thị ở màn hình Home
- Chức năng hiển thị dữ liệu dưới dạng biểu đồ chọn Chart ở BottomNavigationBar để xem
- Dữ liệu sẽ load theo mình cài đặt 20,30,40,.. Object 1 lúc để tăng hiệu suất, khi vuốt đến hết màn hình thì ứng dụng sẽ lấy data kế tiếp hiển thị lên giao diện.
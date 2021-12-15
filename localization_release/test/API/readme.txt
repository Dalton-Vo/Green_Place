API dùng để tương tác với một ứng dụng hay một thành phần tương tác với một ứng dụng hay thành phần khác (JSON, XML)
REST chuyển đổi cấu trúc dữ liệu. REST gửi một yêu cầu HTTP như GET, POST, DELETE, vv đến một URL để xử lý dữ liệu.
RESTful API là một tiêu chuẩn dùng trong việc thiết kế các API cho các ứng dụng web để quản lý các resource

1XX - Thông tin: Yêu cầu được chấp nhận hoặc quá trình tiếp tục.
2XX - Thành công: Xác nhận rằng hành động đã hoàn tất thành công hoặc đã được hiểu.
3XX - Chuyển hướng: Client phải thực hiện hành động bổ sung để hoàn thành yêu cầu.
4XX - Lỗi từ client chỉ ra rằng yêu cầu không thể hoàn thành hoặc chứa cú pháp sai. Mã lỗi 4xx sẽ hiện ra khi có lỗi từ phía người dùng, chủ yếu là do không đưa ra một yêu cầu hợp lệ.
5XX - Lỗi từ phía máy chủ: Cho biết máy chủ không thể hoàn tất yêu cầu được cho là hợp lệ. Khi duyệt web và bắt gặp các lỗi 5xx, bạn chỉ có thể chờ đợi, vì lúc này lỗi xuất phát từ phía máy chủ của dịch vụ web, không có cách nào can thiệp để sửa lỗi ngoài việc ngồi chờ bên máy chủ xử lý xong.
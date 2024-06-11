App máy tính Calculator 
các gói sử dụng: math_expressions: ^2.5.0
mô tả chi tiết:
- 2 widget: expanded để phân chia phần UI/UX
- UI: 1 column() gồm 2 container(), Trên là câu hỏi của user và Dưới là câu trả lời dẵ qua xử lý
- UX: tạo 1 gridView.builder() để hiển thị các Button thông qua gridview và các style trong widget, và các setState của các Button như:
+ khi chạy qua listButton kiếm các phím như('C', 'DEL', '=') để xử lý riêng('1','2','3','4','5','6','7','8','9') xử lý riêng.
+ các phương thức trong project này(isOperator(nếu là toán tử sẽ cho Color khác các button số), equalPresses(xử lý và trả về đáp án))
+ Sử dụng gói 'math_expressions' để tính toán
- Các Button có 1 model định nghĩa nó gồm các thuộc tính(color, textColor, buttonText, buttontapped)
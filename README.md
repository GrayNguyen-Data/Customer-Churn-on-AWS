<h1 align="center">Dự đoán Khách hàng Rời bỏ (Customer Churn Prediction)</h1>

<h3 align="center">
Mục tiêu là phát hiện sớm các khách hàng có nguy cơ rời bỏ dịch vụ, từ đó giúp doanh nghiệp đưa ra các chiến lược giữ chân khách hàng kịp thời.
</h3>
 
 ---

**Dự án triển khai đầy đủ pipeline Machine Learning, bao gồm:**

- Khám phá và phân tích dữ liệu (EDA)

- Tiền xử lý dữ liệu

- Huấn luyện và so sánh nhiều mô hình

- Điều chỉnh threshold

- Lựa chọn và lưu mô hình cuối cùng
---

**THÔNG TIN BÀI TOÁN**
---

**DATASET**

- Nguồn dữ liệu: Telco Customer Churn

- Số lượng mẫu: 7.043 khách hàng

- Biến mục tiêu: Churn (Yes / No)

- Đặc điểm dữ liệu: Mất cân bằng lớp (khách hàng không churn chiếm đa số).

**CÁC MÔ HÌNH ĐƯỢC SỬ DỤNG**
---

 |MÔ HÌNH|MỤC ĐÍCH|
|-|-|
| **Random Forest**|Mô hình baseline|
| **XGBoost**|Mô hình chính|
| **LightGBM**|So sánh tốc độ & hiệu suất|

---

**XỬ LÝ DỮ LIỆU MẤT CÂN BẰNG**

- Sử dụng `scale_pos_weight` cho XGBoost

- Không sử dụng threshold mặc định 0.5

- Thực hiện threshold tuning
---

**CHỈ SỐ ĐÁNH GIÁ**

Do dữ liệu mất cân bằng, accuracy không phải chỉ số chính.
Các chỉ số được sử dụng:

- Precision

- Recall

- F1-score

- ROC-AUC
---

**CHIẾN LƯỢC ĐIỀU CHỈNH Threshold**

Các threshold từ 0.25 → 0.50 được thử nghiệm.

- Threshold = 0.35
→ F1-score cao nhất (cân bằng precision & recall)

- Threshold = 0.30 (được chọn cho mô hình cuối)
→ Recall cao hơn (86.1%), phù hợp mục tiêu nghiệp vụ
---

**HIỆU NĂNG MÔ HÌNH XGBoost Final**

Recall (Churn): 0.861

Precision (Churn): 0.451

F1-score (Churn): 0.592

ROC-AUC: 0.828

Thời gian huấn luyện: 0.23 giây

Thời gian dự đoán: 0.005 giây

---

**CÔNG NGHỆ SỬ DỤNG**

- Python

- pandas, numpy

- scikit-learn

- XGBoost

- LightGBM

- matplotlib, seaborn

- Jupyter Notebook
---
**HƯỚNG PHÁT TRIỂN**

- Phân tích SHAP để giải thích mô hình

- Triển khai API dự đoán churn

- Theo dõi & cập nhật mô hình định kỳ

**LIÊN HỆ**
---
Cảm ơn bạn đã ghé thăm dự án của tôi❤️

Nếu bạn muốn kết nối, đừng ngần ngại liên hệ với tôi nhé!

📧 Email: ndtoan.work@gmail.com

💼 LinkedIn: https://www.linkedin.com/in/ndtoanwork/

📍 Địa điểm: Bình Thạnh, TP. Hồ Chí Minh, Việt Nam

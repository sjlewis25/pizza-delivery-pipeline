# 🍕 Pizza Delivery Data Pipeline (AWS + Terraform + Athena)

This project demonstrates a full cloud-based data pipeline to analyze real-world pizza delivery data using AWS services. It highlights serverless architecture, infrastructure as code, and data analytics using SQL.

---

## 🧱 Architecture

- **Terraform** – Infrastructure as Code (IaC) to provision AWS services
- **AWS S3** – Raw data storage (CSV files)
- **AWS Glue** – Cataloging the data for SQL queries
- **AWS Athena** – Querying the data using SQL
- **PowerShell + AWS CLI** – End-to-end automation and scripting

---

## 🗂 Data

**Source File**: `Pizza_Delivery_Analysis_.xlsx`  
**Converted File**: `pizza_data.csv`

The data includes:
- Delivery date and time
- Delivery zone
- Distance driven
- Home type
- Tip amount and percentage
- Total earnings per delivery

---

## 📊 SQL Analytics Queries

### 1. **Average Tip by Delivery Zone**
```sql
SELECT delivery_zone, AVG(tip) AS avg_tip
FROM pizza_data
GROUP BY delivery_zone;
```

---

### 2. **Daily Tip Trends**
```sql
SELECT date, ROUND(AVG(tip), 2) AS avg_tip, COUNT(*) AS deliveries
FROM pizza_data
GROUP BY date
ORDER BY date;
```

---

### 3. **Miles vs Tip Percentage**
```sql
SELECT 
  ROUND(distance_miles, 1) AS distance_group,
  COUNT(*) AS deliveries,
  ROUND(AVG(tip), 2) AS avg_tip,
  ROUND(AVG(tip_percentage), 2) AS avg_tip_percent
FROM pizza_data
GROUP BY 1
ORDER BY distance_group;
```

---

### 4. **Earnings by Home Type**
```sql
SELECT 
  TRIM(home_type) AS home_type,
  COUNT(*) AS deliveries,
  ROUND(AVG(total_earnings), 2) AS avg_earnings,
  ROUND(SUM(total_earnings), 2) AS total_earnings,
  ROUND(AVG(tip_percentage), 2) AS avg_tip_percent
FROM pizza_data
GROUP BY TRIM(home_type)
ORDER BY avg_earnings DESC;
```

---

## 🧠 Key Insights

- Hotels offer the highest per-order payouts, though rare.
- Houses generated the most revenue overall.
- Tip percentage increases slightly with delivery distance.
- Week-to-week tip trends vary significantly by date.

---

## 🚀 How to Deploy

1. Clone the repo:
```bash
git clone https://github.com/sjlewis25/pizza-delivery-pipeline
```

2. Update the Terraform `main.tf` with your region and S3 bucket.

3. Run:
```bash
terraform init
terraform apply -auto-approve
```

4. Upload `pizza_data.csv` to your S3 bucket's `/raw` folder.

5. Use the Athena queries above to extract insights.

---

## 🧰 Tools Used

- AWS S3, Glue, Athena
- Terraform
- PowerShell
- Python (for Excel to CSV conversion)
- SQL

---

## 🧑‍💻 Author

**Steven Lewis**  
Cloud Engineer & Data Enthusiast  
GitHub: [sjlewis25](https://github.com/sjlewis25)

---

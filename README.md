# Pizza Delivery Data Pipeline (AWS + Terraform + Athena)

This project demonstrates a cloud-based data pipeline for analyzing pizza delivery data using AWS. It applies infrastructure as code, serverless architecture, and SQL analytics to extract insights from real-world delivery metrics.

---

## Architecture Overview

This project uses the following tools and services:

- **Terraform** – Infrastructure as Code to provision AWS resources
- **AWS S3** – Storage for raw CSV data
- **AWS Glue** – Data cataloging and schema discovery
- **AWS Athena** – Serverless SQL querying
- **PowerShell + AWS CLI** – Automation for data upload and query execution
- **Python** – Used to convert Excel data to CSV format

### Data Flow

1. CSV file is uploaded to S3
2. AWS Glue crawler adds it to the Data Catalog
3. Athena is used to run SQL queries on the data

---

## Dataset Details

- **Original File:** Pizza_Delivery_Analysis_.xlsx  
- **Converted File:** pizza_data.csv

**Fields include:**

- Delivery date and time
- Delivery zone
- Distance driven
- Home type
- Tip amount and percentage
- Total earnings

---

## Sample Athena Queries

**1. Average Tip by Delivery Zone**
```sql
SELECT delivery_zone, AVG(tip) AS avg_tip
FROM pizza_data
GROUP BY delivery_zone;
```

**2. Daily Tip Trends**
```sql
SELECT date, ROUND(AVG(tip), 2) AS avg_tip, COUNT(*) AS deliveries
FROM pizza_data
GROUP BY date
ORDER BY date;
```

**3. Miles vs Tip Percentage**
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

**4. Earnings by Home Type**
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

## Key Insights

- Houses accounted for the most total revenue.
- Longer distances showed a slight increase in tip percentage.
- Tip trends fluctuated significantly across different days.

---

## Deployment Instructions

**1. Clone the repository**
```bash
git clone https://github.com/sjlewis25/pizza-delivery-pipeline
cd pizza-delivery-pipeline
```

**2. Update Terraform configuration**  
Edit `main.tf` to match your AWS region and S3 bucket name.

**3. Deploy infrastructure**
```bash
terraform init
terraform apply -auto-approve
```

**4. Upload your data**  
Place `pizza_data.csv` into the `/raw` folder of the S3 bucket.

**5. Query with Athena**  
Run the provided SQL queries in the Athena console or CLI.

---

## Security & Cost Considerations

- S3 bucket uses default encryption (can be customized).
- IAM roles follow least-privilege best practices.
- Cleanup is recommended after use:
```bash
terraform destroy -auto-approve
```

---

## Tools & Technologies

- AWS S3, Glue, Athena
- Terraform
- PowerShell
- Python
- SQL

---

## Author

**Steven Lewis**  
Cloud Engineer & Data Enthusiast  
GitHub: [https://github.com/sjlewis25](https://github.com/sjlewis25)

---

## Related Files

- [`main.tf`](./main.tf)
- [`pizza_data.csv`](./pizza_data.csv)
- [`sample_athena_query.sql`](./sample_athena_query.sql)


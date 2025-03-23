import pandas as pd

# Load Excel file
df = pd.read_excel("./data/Pizza_Delivery_Analysis_.xlsx", sheet_name="Final Cleaned Data")

# Save as CSV
df.to_csv("./data/pizza_data.csv", index=False)
print("Excel file converted to CSV.")

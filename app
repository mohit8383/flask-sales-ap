from flask import Flask, jsonify
import pandas as pd
import os

app = Flask(__name__)

# Load dataset from environment variable or default path
data_path = os.getenv('DATA_PATH', '/mnt/data/100 Sales Records.csv')
data = pd.read_csv(data_path) 

def generate_sales_recommendations():
    top_products = data.groupby('Product')['Total Revenue'].sum().nlargest(3).index.tolist()
    return [
        f"Increase promotions for top-selling products: {', '.join(top_products)}.",
        "Optimize inventory based on seasonal trends.",
        "Offer personalized discounts based on customer purchase history.",
        "Expand into high-demand regions.",
        "Leverage customer reviews to build trust and credibility.",
        "Enhance the checkout experience to reduce cart abandonment.",
        "Use AI-driven recommendations to boost cross-sell and upsell.",
        "Implement targeted email campaigns for repeat customers.",
        "Launch loyalty programs for high-value customers.",
        "Improve supply chain efficiency to lower costs."
    ]

@app.route('/sales_recommendations', methods=['GET'])
def sales_recommendations():
    return jsonify(generate_sales_recommendations())

def generate_sales_strategies():
    return [
        "Expand into emerging markets with high demand.",
        "Implement a data-driven pricing strategy.",
        "Leverage strategic partnerships to enhance distribution."
    ]

@app.route('/sales_strategies', methods=['GET'])
def sales_strategies():
    return jsonify(generate_sales_strategies())

def generate_marketing_funnels():
    return [
        "SEO Blog → Email Signup → Nurture Campaign → Product Offer",
        "Social Media Ads → Landing Page → Lead Capture → Retargeting",
        "Influencer Endorsement → Product Demo → Free Trial → Subscription",
        "Webinar → Special Discount Offer → Purchase → Upsell",
        "Referral Program → Exclusive Discount → Viral Growth."
    ]

@app.route('/marketing_funnels', methods=['GET'])
def marketing_funnels():
    return jsonify(generate_marketing_funnels())

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=10000)

from flask import Blueprint, jsonify 

app_routes = Blueprint("app_routes", __name__)

@app_routes.route("/")
def home():
    return jsonify({"message": "Python Jenkins CI/CD Project Running"})
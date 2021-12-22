from flask import Flask
import os

app = Flask(__name__)


@app.route("/")
def home():
    print("ATC_USERNAME="+os.environ.get("ATC_USERNAME")+"\nATC_PASSWORD="+os.environ.get("ATC_PASSWORD"))
    #return "Username="+str(os.environ.get("ATC_USERNAME "))+"\nPassword="+str(os.environ.get("ATC_PASSWORD\n"))
    return'<p>' + os.environ.get("ATC_USERNAME") + '</p> <p>'+ os.environ.get("ATC_PASSWORD") + '</p>'

if __name__ == "__main__":
    app.run(debug=True,host="0.0.0.0")

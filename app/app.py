from flask import Flask, send_file
import os
import random

app = Flask(__name__)

# Define the folder containing the pictures
PICTURE_FOLDER = 'pictures'

@app.route('/')
def get_random_picture():
    # Get the list of picture files in the folder
    picture_files = os.listdir(PICTURE_FOLDER)

    # Select a random picture file from the list
    random_picture = random.choice(picture_files)

    # Get the full path of the selected picture
    picture_path = os.path.join(PICTURE_FOLDER, random_picture)

    # Return the selected picture file to the user
    return send_file(picture_path, mimetype='image/jpeg')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)

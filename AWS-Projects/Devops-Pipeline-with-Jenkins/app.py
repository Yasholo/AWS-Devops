from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)

def get_db_connection():
    connection = mysql.connector.connect(
        host='your-mysql-host',
        user='your-mysql-user',
        password='your-mysql-password',
        database='your-database'
    )
    return connection

@app.route('/')
def index():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT id, title, content FROM posts")
    posts = cursor.fetchall()
    cursor.close()
    connection.close()
    return render_template('index.html', posts=posts)

@app.route('/post/<int:post_id>')
def post(post_id):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT id, title, content FROM posts WHERE id = %s", (post_id,))
    post = cursor.fetchone()
    cursor.close()
    connection.close()
    return render_template('post.html', post=post)

@app.route('/new', methods=('GET', 'POST'))
def new_post():
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']

        connection = get_db_connection()
        cursor = connection.cursor()
        cursor.execute("INSERT INTO posts (title, content) VALUES (%s, %s)", (title, content))
        connection.commit()
        cursor.close()
        connection.close()

        return redirect(url_for('index'))

    return render_template('new_post.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

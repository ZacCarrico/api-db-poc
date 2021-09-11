import pymysql
from app import app
from db import mysql
from flask import jsonify

def get_query_response(query):
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute(query)
    rows = cursor.fetchall()
    resp = jsonify(rows)
    resp.status_code = 200
    return resp

@app.route('/site/<name>')
def site(name):
    query = \
        f"""
        SELECT 
            s.name as site_name, 
            s.address, 
            i.name as instrument_name, 
            i.id as instrument_id, 
            i.mac, 
            i.container, 
            c.description as container_desc
        FROM db.site s
        LEFT JOIN db.instrument i
            ON s.instrument_id = i.id
        LEFT JOIN db.container c
            ON i.container = c.id 
        WHERE s.name = '{name}'
        """
    return get_query_response(query)

@app.route('/instrument/<name>')
def instrument(name):
    query = \
        f"""
        SELECT 
            i.id as instrument_id, 
            i.name as instrument_name, 
            i.mac, 
            i.container, 
            c.description as container_description
        FROM db.instrument i
        LEFT JOIN db.container c
            ON i.container = c.id
        WHERE i.name = '{name}'
        """
    return get_query_response(query)

@app.route('/container/<uuid>')
def container(uuid):
    query = \
        f"""
        SELECT id, description
        FROM db.container
        WHERE id = '{uuid}'
        """
    return get_query_response(query)

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0')

#!/usr/bin/python
import psycopg2
import os
import logging
import boto3
import sys,argparse,csv

db_host = os.environ['db_host']
db_port = os.environ['db_port']
db_name = os.environ['db_name']
db_user = os.environ['db_user']
db_pass = os.environ['db_pass']
#db_table = os.environ['db_table']
query_cmd = os.environ['db_query']
#query_cmd = query_cmd + "values" + "(" +value_id+ "," + "value_name" +")"

#ssm = boto3.client('ssm')
#parameter = ssm.get_parameter(Name=db_user, WithDecryption=True)
#db_user = parameter['Parameter']['Value']

#parameter = ssm.get_parameter(Name=db_pass, WithDecryption=True)
#db_pass = parameter['Parameter']['Value']


bucket =  os.environ['bucket']
file_name = 'test.csv'

s3 = boto3.client('s3')

s3.download_file(bucket, file_name, '/tmp/test.csv')

with open ('/tmp/test.csv') as csv_file:
    csv_reader=csv.DictReader(csv_file,delimiter=',')
    for row in csv_reader:
                value_id=row['id']
                value_name=row['name']
                print(value_id)
                print(value_name)

query_cmd = query_cmd + "values" + "(" +value_id+ "," + "'"+value_name+"'" +")"


#("("+str(value_id)+ "," + "'"+str(value_name)+"'"+")")



def make_conn():
    conn = None
    try:
        conn = psycopg2.connect("dbname='%s' user='%s' host='%s' password='%s'" % (db_name, db_user, db_host, db_pass))
    except:
        print ("I am unable to connect to the database")
    return conn


def fetch_data(conn, query):
    result = []
    #print ("Now executing: ") + str(query)
    cursor = conn.cursor()
     
    cursor.execute(query)
    conn.commit()
    cursor.execute("select * from app_user")
    raw = cursor.fetchall()
    cursor.close()
    for line in raw:
        result.append(line)
    return result


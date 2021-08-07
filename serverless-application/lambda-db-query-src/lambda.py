#!/usr/bin/python
import sys
import logging
import psycopg2
import db_util
import json
#from db_util import *
def lambda_handler(event, context):
    query = db_util.query_cmd
    print (query)

    # get a connection, if a connect cannot be made an exception will be raised here
    conn = db_util.make_conn()

    result = db_util.fetch_data(conn, query)
    result = json.loads(json.dumps(result, default=str))
    print (result)
    conn.close()

    return result
